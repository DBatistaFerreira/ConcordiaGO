import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:google_maps_util/google_maps_util.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:concordia_go/utilities/direction.dart';
import 'package:concordia_go/utilities/segment.dart';
import 'package:concordia_go/utilities/journey.dart';
import 'package:flutter/material.dart';
import 'package:concordia_go/utilities/concordia_constants.dart' as concordia_constants;

var _apiKey = '';

class OutdoorPathService {
  static final Set<Polyline> _polyLines = {};
  static Journey _listDirections = Journey();
  static List<Direction> _singleDirections = <Direction>[];
  static int _currentInstruction = 0;

  /*
  * The transitDirections method is the core method used for outdoor path directions. It operates in steps
  * First it makes a call to the Google Directions API to get the transit information for an optimal route
  * Second the polyLines are extracted from this as well as the arrival time
  * Third the JSON is broken down into Direction, Segment and Journey objects.
  * Next the polyLines are set on the google maps
  * Finally, segments are updated so that the UI values can be set.
   */

  static void transitDirections(startLat, startLng, endLat, endLng, buildingDestination) async {
    _singleDirections = <Direction>[];
    _listDirections = Journey();
    var url =
        'https://maps.googleapis.com/maps/api/directions/json?origin=${startLat},${startLng}&destination=${endLat},${endLng}&mode=transit&key=${_apiKey}';
    var response = await http.get(url); //Google Directions API call
    Map values = jsonDecode(response.body);
    var myPoints = PolyUtil();
    var returnedValues = values[concordia_constants.route][0][concordia_constants.legs][0];
    var returnedSteps = returnedValues[concordia_constants.steps];
    for (var i = 0; i < returnedSteps.length; i++) {
      var subInstruction = true;
      var arrival_time =
          returnedValues[concordia_constants.arrival_time][concordia_constants.text]; //Arrival time extraction from API
      debugPrint(arrival_time);
      var pointArray = myPoints
          .decode(returnedSteps[i][concordia_constants.polyline][concordia_constants.points]); //polyLine extraction
      Segment newSegment;
      if (returnedSteps[i][concordia_constants.travel_mode] == concordia_constants.walking) {
        //Creating Walking directions if API specifies a walk path
        var newDirection = toDirection(returnedSteps[i], ModeOfTransport.walking, arrival_time, buildingDestination);
        newSegment = Segment(newDirection); //Adding it to a segment
        try {
          if (returnedSteps[0][concordia_constants.instruction] == null) {
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
    setDirections(); //Directions are transformed from Journey format to List<Direction> for easier UI presentation.
  }

  /*
  *
  * Method currently inactive until Sprint 3.
  * Provides directions for TRANSIT_TYPE = DRIVING
  *
   */
  static void drivingDirections(startLat, startLng, endLat, endLng, buildingDestination) async {
    _singleDirections = <Direction>[];
    _listDirections = Journey();
    var url =
        'https://maps.googleapis.com/maps/api/directions/json?origin=${startLat},${startLng}&destination=${endLat},${endLng}&mode=driving&key=${_apiKey}';
    var response = await http.get(url);
    Map values = jsonDecode(response.body);
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
          if (returnedSteps[i][concordia_constants.steps][0][concordia_constants.instruction] == null) {
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

  static void walkingDirections(startLat, startLng, endLat, endLng, buildingDestination) async {
    _singleDirections = List<Direction>();
    _listDirections = Journey();
    var url =
        'https://maps.googleapis.com/maps/api/directions/json?origin=${startLat},${startLng}&destination=${endLat},${endLng}&mode=walking&key=${_apiKey}';
    var response = await http.get(url);
    Map values = jsonDecode(response.body);
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
          if (returnedSteps[i][concordia_constants.steps][0][concordia_constants.instruction] == null) {
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
  static Direction toDirection(apiJson, ModeOfTransport transportType, String arrival_time, destination) {
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

  static Direction endTransit(apiJson, ModeOfTransport transportType, String arrival_time, destination) {
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

  static void addNewPolyline(Color colorChoice, pointValues, index) {
    _polyLines.add(Polyline(polylineId: PolylineId('${index}'), width: 4, points: pointValues, color: colorChoice));
  }

  static Set<Polyline> getPolylines() {
    return _polyLines;
  }

  /*
  *
  * Method used to return the entire list of directions (List<Direction>) for the drawer in the Navigation UI
  *
   */

  static List<Direction> getRoute() {
    return _singleDirections;
  }

  /*
  *
  * Method used to return a single direction for the Navigation UI. This is only triggered on the first instruction.
  *
   */

  static Direction getFirstInstruction() {
    return _singleDirections[_currentInstruction];
  }

  /*
  *
  * Method used to return a single direction for the Navigation UI. Updates current instruction to the next one
  *
   */

  static Direction getNextInstruction() {
    if (_currentInstruction == _singleDirections.length - 1) {
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

  static Direction getPreviousInstruction() {
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

  static void clearAll() {
    _singleDirections.clear();
    _listDirections.resetList();
    _currentInstruction = 0;
    _polyLines.clear();
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

  static String calculateArrivalTime(durationJSON) {
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

  static void setDirections() {
    _singleDirections.clear();
    var tempDirections = _listDirections.toDirection();
    for (var i = 0; i < tempDirections.length; i++) {
      _singleDirections.add(tempDirections[i]);
    }
  }
}
