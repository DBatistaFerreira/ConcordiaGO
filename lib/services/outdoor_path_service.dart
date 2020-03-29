import 'dart:io';

import 'package:concordia_go/models/direction_object.dart';
import 'package:concordia_go/models/direction_request.dart';
import 'package:concordia_go/services/direction_chain.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:google_maps_util/google_maps_util.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:concordia_go/utilities/direction.dart';
import 'package:concordia_go/utilities/segment.dart';
import 'package:concordia_go/utilities/journey.dart';
import 'package:flutter/material.dart';
import 'package:concordia_go/utilities/concordia_constants.dart' as concordia_constants;
import 'package:concordia_go/services/scheduler_service.dart';

Map<String, String> env = Platform.environment;

var _apiKey = env["GOOGLE_API"];

class OutdoorPathService {
  OutdoorPathService._privateConstructor();

  static final OutdoorPathService instance = OutdoorPathService._privateConstructor();

  final Set<Polyline> _polyLines = {};
  Journey _listDirections = Journey();
  List<Direction> _singleDirections = <Direction>[];
  int _currentInstruction = 0;
  bool isShuttlePossible = true;
  SchedulerService schedulerService = SchedulerService.instance;
  List<Dobject> dobjectList = <Dobject>[];

  /*
  * The transitDirections method is the core method used for outdoor path directions. It operates in steps
  * First it makes a call to the Google Directions API to get the transit information for an optimal route
  * Second the polyLines are extracted from this as well as the arrival time
  * Third the JSON is broken down into Direction, Segment and Journey objects.
  * Next the polyLines are set on the google maps
  * Finally, segments are updated so that the UI values can be set.
  * Update in Sprint 3 will change its layout to provide a more testable class
   */

  Future<int> getDirections(startLat, startLng, endLat, endLng, buildingDestination, modeOfTransport) async {
    switch (modeOfTransport) {
      case ModeOfTransport.walking:
        await walkingDirections(startLat, startLng, endLat, endLng, buildingDestination);
        return 1;
        break;
      case ModeOfTransport.driving:
        await drivingDirections(startLat, startLng, endLat, endLng, buildingDestination);
        return 2;
        break;
      case ModeOfTransport.transit:
        await transitDirections(startLat, startLng, endLat, endLng, buildingDestination);
        return 3;
        break;
      case ModeOfTransport.shuttle:
        await setShuttlePath(startLat, startLng, endLat, endLng, buildingDestination);
        return 4;
        break;
    }

    return -1; //Invalid mode of Transport
    // ENDING MAGIC
  }

  void transitDirections(startLat, startLng, endLat, endLng, buildingDestination) async {
    _singleDirections = <Direction>[];
    _listDirections = Journey();
    Map values = await googleMapsRequest(startLat, startLng, endLat, endLng, "transit");
    var myPoints = PolyUtil();
    var returnedValues = values[concordia_constants.route][0][concordia_constants.legs][0];
    var returnedSteps = returnedValues[concordia_constants.steps];
    for (var i = 0; i < returnedSteps.length; i++) {
      var subInstruction = true;
      var arrival_time;
      try {
        //Dependent on volatile Directions API field. If statement was previous attempted to check null to no success
        arrival_time = returnedValues[concordia_constants.arrival_time]
            [concordia_constants.text]; //Arrival time extraction from API
      } catch (Exception) {
        arrival_time = calculateArrivalTime(returnedValues[concordia_constants.duration][concordia_constants.text]);
      }
      var pointArray = myPoints
          .decode(returnedSteps[i][concordia_constants.polyline][concordia_constants.points]); //polyLine extraction
      Segment newSegment;
      if (returnedSteps[i][concordia_constants.travel_mode] == concordia_constants.walking) {
        //Creating Walking directions if API specifies a walk path
        var newDirection = toDirection(returnedSteps[i], ModeOfTransport.walking, arrival_time, buildingDestination);
        newSegment = Segment(newDirection); //Adding it to a segment
        try {
          if (returnedSteps[0][concordia_constants.steps][i][concordia_constants.instruction] == null) {
            //Dealing with null cases from the directions API
            subInstruction = false;
          }
        } catch (Exception) {
          subInstruction = false;
        }
        if (subInstruction) {
          //If a null case is detected (CONTROL FLOW = FALSE), the main directive will match its subinstruction. Eliminating null values.
          for (var j = 0; j < returnedSteps[i][concordia_constants.steps].length; j++) {
            newDirection = toDirection(returnedSteps[i][concordia_constants.steps][j], ModeOfTransport.walking,
                arrival_time, buildingDestination);
            newSegment.addSubstep(newDirection);
          }
        } else {
          newSegment.addSubstep(
              newDirection); //Creating subdirections matching the initial direction PINK = WALKING DIRECTION
        }
        addNewPolyline(Colors.pink, pointArray, i); //extracted polyLines are added to the primary polyLine set.
      } else {
        //If the transport type is not walking in the above control flow, a transit direction is detected. Two steps (Get on / Get off)
        var newDirection = toDirection(returnedSteps[i], ModeOfTransport.transit, arrival_time, buildingDestination);
        newSegment =
            Segment(newDirection); //Initial direction and segment created for getting onto the bus/subway/train

        newDirection = endTransit(
            //Direction for getting off the train
            returnedSteps[i][concordia_constants.transit_details][concordia_constants.arrival_stop],
            ModeOfTransport.transit,
            arrival_time,
            buildingDestination);
        newSegment.addSubstep(newDirection);
        addNewPolyline(Colors.teal, pointArray,
            i); //extracted polyLines are added to the primary polyLine set. TEAL = TRANSIT DIRECTION
      }
      _listDirections
          .addSegment(newSegment); //Loop iteration ends here. Segment created in the iteration is added to the list.
    }
    setDirections(); //Directions are transformed from Journey format to List<Direction> for easier UI presentation
  }

  /*
  *
  * Method currently inactive until Sprint 3.
  * Provides directions for TRANSIT_TYPE = DRIVING
  *
   */
  void drivingDirections(startLat, startLng, endLat, endLng, buildingDestination) async {
    _singleDirections = <Direction>[];
    _listDirections = Journey();
    Map values = await googleMapsRequest(startLat, startLng, endLat, endLng, "driving");
    var myPoints = PolyUtil();
    var returnedValues = values[concordia_constants.route][0][concordia_constants.legs][0];
    var returnedSteps = returnedValues[concordia_constants.steps];
    for (var i = 0; i < returnedSteps.length; i++) {
      var subInstruction = true;
      var arrival_time = calculateArrivalTime(returnedValues[concordia_constants.duration][concordia_constants.text]);
      var pointArray = myPoints.decode(returnedSteps[i][concordia_constants.polyline][concordia_constants.points]);
      Segment newSegment;
      if (returnedSteps[i][concordia_constants.travel_mode] == concordia_constants.driving) {
        var newDirection = toDirection(returnedSteps[i], ModeOfTransport.driving, arrival_time, buildingDestination);
        newSegment = Segment(newDirection);
        try {
          if (returnedSteps[0][concordia_constants.steps][i][concordia_constants.instruction] == null) {
            subInstruction = false;
          }
        } catch (Exception) {
          subInstruction = false;
        }
        if (subInstruction) {
          for (var j = 0; j < returnedSteps[i][concordia_constants.steps].length; j++) {
            newDirection = toDirection(returnedSteps[i][concordia_constants.steps][j], ModeOfTransport.driving,
                arrival_time, buildingDestination);
            newSegment.addSubstep(newDirection);
          }
        } else {
          newSegment.addSubstep(newDirection);
        }

        addNewPolyline(Colors.teal, pointArray, i);
      } else {
        var newDirection = toDirection(returnedSteps[i], ModeOfTransport.walking, arrival_time, buildingDestination);
        newSegment = Segment(newDirection);

        newDirection = endTransit(
            returnedSteps[i][concordia_constants.transit_details][concordia_constants.arrival_stop],
            ModeOfTransport.walking,
            arrival_time,
            buildingDestination);
        newSegment.addSubstep(newDirection);

        addNewPolyline(Colors.pink, pointArray, i);
      }
      _listDirections.addSegment(newSegment);
    }
    setDirections();
  }

  /*
  *
  * Method currently inactive until Sprint 3.
  * Provides directions for TRANSIT_TYPE = WALKING
  *
   */

  void walkingDirections(startLat, startLng, endLat, endLng, buildingDestination) async {
    _singleDirections = <Direction>[];
    _listDirections = Journey();
    Map values = await googleMapsRequest(startLat, startLng, endLat, endLng, "walking");
    var myPoints = PolyUtil();
    var returnedValues = values[concordia_constants.route][0][concordia_constants.legs][0];
    var returnedSteps = returnedValues[concordia_constants.steps];
    for (var i = 0; i < returnedSteps.length; i++) {
      var subInstruction = true;
      var arrival_time = calculateArrivalTime(returnedValues[concordia_constants.duration][concordia_constants.text]);
      var pointArray = myPoints.decode(returnedSteps[i][concordia_constants.polyline][concordia_constants.points]);
      Segment newSegment;
      if (returnedSteps[i][concordia_constants.travel_mode] == concordia_constants.walking) {
        var newDirection = toDirection(returnedSteps[i], ModeOfTransport.walking, arrival_time, buildingDestination);
        newSegment = Segment(newDirection);
        try {
          if (returnedSteps[0][concordia_constants.steps][i][concordia_constants.instruction] == null) {
            subInstruction = false;
          }
        } catch (Exception) {
          subInstruction = false;
        }
        if (subInstruction) {
          for (var j = 0; j < returnedSteps[i][concordia_constants.steps].length; j++) {
            newDirection = toDirection(returnedSteps[i][concordia_constants.steps][j], ModeOfTransport.walking,
                arrival_time, buildingDestination);
            newSegment.addSubstep(newDirection);
          }
        } else {
          newSegment.addSubstep(newDirection);
        }

        addNewPolyline(Colors.pink, pointArray, i);
      }
      _listDirections.addSegment(newSegment);
    }
    setDirections();
  }

  /*
  *
  * Takes the the raw data from the Directions API JSON and transforms it into the Direction object used by the application
  *
   */
  Direction toDirection(apiJson, ModeOfTransport transportType, String arrival_time, destination) {
    var instruction = apiJson[concordia_constants.instruction];
    var lat = apiJson[concordia_constants.start_location][concordia_constants.latitude];
    var lng = apiJson[concordia_constants.start_location][concordia_constants.longitude];
    var coordinate = LatLng(lat, lng);
    var distance = apiJson[concordia_constants.distance][concordia_constants.text];
    return Direction(instruction, coordinate, transportType, distance, arrival_time, destination);
  }

  /*
  *
  * Unique Direction object that is only created when a Transit journey type is started. It extracts the end step of the transit journey.
  *
   */

  Direction endTransit(apiJson, ModeOfTransport transportType, String arrival_time, destination) {
    var instruction = 'Get off at ${apiJson[concordia_constants.name]}';
    var lat = apiJson[concordia_constants.location][concordia_constants.latitude];
    var lng = apiJson[concordia_constants.location][concordia_constants.longitude];
    var coordinate = LatLng(lat, lng);
    var distance = '';
    return Direction(instruction, coordinate, transportType, distance, arrival_time, destination);
  }

  /*
  *
  * Updated the local polyLine, pending a Bloc update
  *
   */

  void addNewPolyline(Color colorChoice, pointValues, index) {
    _polyLines.add(Polyline(polylineId: PolylineId('${index}'), width: 4, points: pointValues, color: colorChoice));
  }

  Set<Polyline> getPolylines() {
    return _polyLines;
  }

  /*
  *
  * Method used to return the entire list of directions (List<Direction>) for the drawer in the Navigation UI
  *
   */

  List<Direction> getRoute() {
    return _singleDirections;
  }

  /*
  *
  * Method used to return a single direction for the Navigation UI. This is only triggered on the first instruction.
  *
   */

  Direction getFirstInstruction() {
    return _singleDirections[_currentInstruction];
  }

  /*
  *
  * Method used to return a single direction for the Navigation UI. Updates current instruction to the next one
  *
   */

  Direction getNextInstruction() {
    if (_currentInstruction == _singleDirections.length - 1) {
      if (dobjectList.isNotEmpty) {
        DirectionChain.instance.head.handle(DirectionRequest(dobjectList[0], dobjectList[1]));
      } else {
        //End Navigation clearAll()
      }
      return _singleDirections[_currentInstruction];
      // HANDLE END OF NAVIGATION
    }
    return _singleDirections[++_currentInstruction];
  }

  /*
  *
  * Method used to return a single direction for the Navigation UI. Updates current instruction to the previous one.
  *
   */

  Direction getPreviousInstruction() {
    if (_currentInstruction == 0) {
      return _singleDirections[_currentInstruction];
    } else {
      return _singleDirections[--_currentInstruction];
    }
  }

  /*
  *
  * Called when navigation is ended, to clear any existing data in the service. Lists are cleared and integers are reset to 0.
  *
   */

  void clearAll() {
    _singleDirections.clear();
    _listDirections.resetList();
    _currentInstruction = 0;
    _polyLines.clear();
    isShuttlePossible = true;
    schedulerService.clearAll();
    dobjectList.clear();
  }

  /*
  *
  * Used for transit types where the JSON provides no arrival time, but instead a duration of the Journey.
  * The duration value in the JSON is a string in the form [ 4 hours 42 minutes / 43 minutes]
  * The string is split and the integer values are extracted. These values are turned into minutes
  * The method then looks at the current time and adds to it the duration value in minutes.
  * This calculated arrival_time is converted to string form and returned
  *
   */

  String calculateArrivalTime(durationJSON) {
    durationJSON;
    List<String> durationToSplit = durationJSON.split(' ');
    var duration;
    if (durationToSplit.length == 2) {
      duration = int.parse(durationToSplit[0]);
    } else {
      duration = int.parse(durationToSplit[0]) * 60 + int.parse(durationToSplit[2]);
    }
    var currentTime = DateTime.now();
    var newDuration = Duration(days: 0, hours: 0, minutes: duration);
    var calculated_time = currentTime.add(newDuration);
    var arrival_time;
    if (calculated_time.minute > 9) {
      arrival_time = '${calculated_time.hour.toString()}:${calculated_time.minute.toString()}';
    } else {
      arrival_time = '${calculated_time.hour.toString()}:0${calculated_time.minute.toString()}';
    }
    return arrival_time;
  }

  /*
  *
  *
  * Shuttle Code
  *
  *
   */

  void setShuttlePath(startLat, startLng, endLat, endLng, buildingDestination) async {
    _singleDirections = <Direction>[];
    _listDirections = Journey();
    LatLng sgwCoordinates =
        concordia_constants.shuttleStops[concordia_constants.campusSGW][concordia_constants.stopCoordinates];
    LatLng loyolaCoordinates =
        concordia_constants.shuttleStops[concordia_constants.campusLoyola][concordia_constants.stopCoordinates];
    bool sgwToLoyola = true;

    Map values = await googleMapsRequest(startLat, startLng, endLat, endLng, "walking");
    var returnedValues = values[concordia_constants.route][0][concordia_constants.legs][0];
    var walkable = schedulerService
            .calculateArrivalTimeInIntFormat(returnedValues[concordia_constants.duration][concordia_constants.text]) <
        35;

    if (walkable) {
      // await walkingDirections(startLat, startLng, endLat, endLng, buildingDestination);
      addWalkingPath(values, buildingDestination, 0);
      setDirections();
    } else {
      sgwToLoyola = await isSgwCloser(startLat, startLng);

      if (sgwToLoyola) {
        var sgwValues = values =
            await googleMapsRequest(startLat, startLng, sgwCoordinates.latitude, sgwCoordinates.longitude, "walking");
        var loyolaValues =
            await googleMapsRequest(loyolaCoordinates.latitude, loyolaCoordinates.longitude, endLat, endLng, "walking");
        var arrival_time = addWalkingPath(sgwValues, buildingDestination, 0);
        createShuttlePath(
            arrival_time,
            buildingDestination,
            concordia_constants.campusLoyola,
            LatLng(45.497275, -73.5783332),
            LatLng(45.4583, -73.6384),
            schedulerService.scheduleNextShuttleTime(arrival_time, concordia_constants.campusLoyola));
        var arrival_time2 = addWalkingPath(loyolaValues, buildingDestination, 250);
        var finalArrivalTime = schedulerService.calculateTotalArrivalTime(
            schedulerService.stringTimeToInt(arrival_time),
            schedulerService.stringTimeToInt(arrival_time2),
            concordia_constants.campusSGW);
        setDirections(finalArrivalTime);
      } else {
        var loyolaValues = values = await googleMapsRequest(
            startLat, startLng, loyolaCoordinates.latitude, loyolaCoordinates.longitude, "walking");
        var sgwValues =
            await googleMapsRequest(sgwCoordinates.latitude, sgwCoordinates.longitude, endLat, endLng, "walking");
        var arrival_time = schedulerService.calculateNewTime(addWalkingPath(loyolaValues, buildingDestination, 0), 30);
        createShuttlePath(
            arrival_time,
            buildingDestination,
            concordia_constants.campusSGW,
            LatLng(45.4583, -73.6384),
            LatLng(45.497275, -73.5783332),
            schedulerService.scheduleNextShuttleTime(arrival_time, concordia_constants.campusSGW));
        var arrival_time2 = addWalkingPath(sgwValues, buildingDestination, 250);
        var finalArrivalTime = schedulerService.calculateTotalArrivalTime(
            schedulerService.stringTimeToInt(arrival_time),
            schedulerService.stringTimeToInt(arrival_time2),
            concordia_constants.campusLoyola);
        if (finalArrivalTime == 'No Buses') {
          isShuttlePossible = false;
          return;
        }
        isShuttlePossible = true;
        setDirections(finalArrivalTime);
      }
    }
  }

  String addWalkingPath(pathJSON, buildingDestination, startIndex) {
    var myPoints = PolyUtil();
    var returnedValues = pathJSON[concordia_constants.route][0][concordia_constants.legs][0];
    var returnedSteps = returnedValues[concordia_constants.steps];
    var arrival_time = schedulerService
        .calculateArrivalTimeinStringFormat(returnedValues[concordia_constants.duration][concordia_constants.text]);
    for (var i = 0; i < returnedSteps.length; i++) {
      var subInstruction = true;
      var pointArray = myPoints.decode(returnedSteps[i][concordia_constants.polyline][concordia_constants.points]);
      Segment newSegment;
      if (returnedSteps[i][concordia_constants.travel_mode] == concordia_constants.walking) {
        var newDirection = toDirection(returnedSteps[i], ModeOfTransport.walking, arrival_time, buildingDestination);
        newSegment = Segment(newDirection);
        try {
          if (returnedSteps[0][concordia_constants.steps][i][concordia_constants.instruction] == null) {
            subInstruction = false;
          }
        } catch (Exception) {
          subInstruction = false;
        }
        if (subInstruction) {
          for (var j = 0; j < returnedSteps[i][concordia_constants.steps].length; j++) {
            newDirection = toDirection(returnedSteps[i][concordia_constants.steps][j], ModeOfTransport.walking,
                arrival_time, buildingDestination);
            newSegment.addSubstep(newDirection);
          }
        } else {
          newSegment.addSubstep(newDirection);
        }

        addNewPolyline(Colors.pink, pointArray, i + startIndex);
      }
      _listDirections.addSegment(newSegment);
    }
    return arrival_time;
  }

  void createShuttlePath(
      arrival_time, buildingDestination, campus, pickUpCoordinate, getOffCoordinate, nextShuttleTime) {
    var myPoints = PolyUtil();
    var polylineList = (concordia_constants.shuttleStops[campus][concordia_constants.shuttlePath] as List);
    var newDirection = Direction(
        "Get on the Concordia Shuttle Bus at ${schedulerService.intTimeToString(nextShuttleTime)}",
        pickUpCoordinate,
        ModeOfTransport.transit,
        "9.3km",
        arrival_time,
        buildingDestination);
    var newSegment = Segment(newDirection);
    newDirection = Direction("Get off the Concordia Shuttle Bus", getOffCoordinate, ModeOfTransport.transit, "9.3km",
        arrival_time, buildingDestination);
    newSegment.addSubstep(newDirection);
    _listDirections.addSegment(newSegment);

    for (int i = 0; i < polylineList.length; i++) {
      var pointArray = myPoints.decode(polylineList[i]);
      addNewPolyline(Colors.teal, pointArray, i + 100);
    }
  }

  /*
  *
  *
  *
  *
   */

  Future<Map> googleMapsRequest(startLat, startLng, endLat, endLng, modeOfTransport) async {
    var url =
        'https://maps.googleapis.com/maps/api/directions/json?origin=${startLat},${startLng}&destination=${endLat},${endLng}&mode=${modeOfTransport}&key=${_apiKey}';
    var response = await http.get(url);
    return jsonDecode(response.body);
  }

  void addDObject(Dobject dobject1, Dobject dobject2) {
    dobjectList = List<Dobject>();
    dobjectList.add(dobject1);
    dobjectList.add(dobject2);
  }

  Future<bool> isSgwCloser(startLat, startLng) async {
    LatLng sgwCoordinates = concordia_constants.sgwCampus['coordinates'];
    LatLng loyolaCoordinates = concordia_constants.loyolaCampus['coordinates'];

    var distanceToSGW =
        await Geolocator().distanceBetween(startLat, startLng, sgwCoordinates.latitude, sgwCoordinates.longitude);
    var distanceToLoyola =
        await Geolocator().distanceBetween(startLat, startLng, loyolaCoordinates.latitude, loyolaCoordinates.longitude);

    return distanceToLoyola > distanceToSGW;
  }

  void setDirections([String arrival_time]) {
    var tempDirections = _listDirections.toDirection();
    if (arrival_time != null) {
      for (var i = 0; i < tempDirections.length; i++) {
        tempDirections[i].arrivalTime = arrival_time;
        _singleDirections.add(tempDirections[i]);
      }
    } else {
      for (var i = 0; i < tempDirections.length; i++) {
        _singleDirections.add(tempDirections[i]);
      }
    }
  }

  void singleDirections(List<Direction> value) {
    _singleDirections = value;
  }

  bool isLastInstruction() {
    return _currentInstruction == _singleDirections.length - 1;
  }
}
