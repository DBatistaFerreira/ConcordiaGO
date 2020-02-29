import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:google_maps_util/google_maps_util.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:concordia_go/utilities/direction.dart';
import 'package:concordia_go/utilities/segment.dart';
import 'package:concordia_go/utilities/journey.dart';
import 'package:flutter/material.dart';


var _apiKey = '';

class OutdoorPathService {
  static final Set<Polyline> _polyLines = {};
  static Journey _listDirections = Journey();
  static List<Direction> _singleDirections = List<Direction>();
  static int _currentInstruction = 0;

  static void transitDirections(startLat, startLng, endLat, endLng, buildingDestination) async {
    _singleDirections = List<Direction>();
    _listDirections = Journey();
    String url =
        "https://maps.googleapis.com/maps/api/directions/json?origin=${startLat},${startLng}&destination=${endLat},${endLng}&mode=transit&key=${_apiKey}";
    http.Response response = await http.get(url);
    Map values = jsonDecode(response.body);
    PolyUtil myPoints = PolyUtil();
    var returnedValues = values['routes'][0]['legs'][0];
    var returnedSteps = returnedValues['steps'];
    for (int i = 0; i < returnedSteps.length; i++) {
      bool subInstruction = true;
      var arrival_time = returnedValues['arrival_time']['text'];
      var pointArray = myPoints.decode(returnedSteps[i]['polyline']['points']);
      Segment newSegment;
      if (returnedSteps[i]['travel_mode'] == 'WALKING') {
        var newDirection = toDirection(
            returnedSteps[i], ModeOfTransport.walking, arrival_time, buildingDestination);
        newSegment = Segment(newDirection);
        try {
          if (returnedSteps[0]['html_instructions'] == null) {
            subInstruction = false;
          }
        } catch (Exception) {
          subInstruction = false;
        }
        if (subInstruction) {
          for (int j = 0; j < returnedSteps[i]['steps'].length; j++) {
            newDirection = toDirection(returnedSteps[i]['steps'][j], ModeOfTransport.walking,
                arrival_time, buildingDestination);
            newSegment.addSubstep(newDirection);
          }
        } else {
          newSegment.addSubstep(newDirection);
        }

        addNewPolyline(Colors.pink, pointArray, i);
      } else {
        var newDirection = toDirection(
            returnedSteps[i], ModeOfTransport.transit, arrival_time, buildingDestination);
        newSegment = Segment(newDirection);

        newDirection = endTransit(returnedSteps[i]['transit_details']['arrival_stop'],
            ModeOfTransport.transit, arrival_time, buildingDestination);
        newSegment.addSubstep(newDirection);

        addNewPolyline(Colors.teal, pointArray, i);
      }
      _listDirections.addSegment(newSegment);
    }
    setDirections();
  }

  static void drivingDirections(startLat, startLng, endLat, endLng, buildingDestination) async {
    _singleDirections = List<Direction>();
    _listDirections = Journey();
    String url =
        "https://maps.googleapis.com/maps/api/directions/json?origin=${startLat},${startLng}&destination=${endLat},${endLng}&mode=driving&key=${_apiKey}";
    http.Response response = await http.get(url);
    Map values = jsonDecode(response.body);
    PolyUtil myPoints = PolyUtil();
    var returnedValues = values['routes'][0]['legs'][0];
    var returnedSteps = returnedValues['steps'];
    for (int i = 0; i < returnedSteps.length; i++) {
      bool subInstruction = true;
      var arrival_time = calculateArrivalTime(returnedValues['duration']['text']);
      var pointArray = myPoints.decode(returnedSteps[i]['polyline']['points']);
      Segment newSegment;
      if (returnedSteps[i]['travel_mode'] == 'DRIVING') {
        var newDirection = toDirection(
            returnedSteps[i], ModeOfTransport.driving, arrival_time, buildingDestination);
        newSegment = Segment(newDirection);
        try {
          if (returnedSteps[i]['steps'][0]['html_instructions'] == null) {
            subInstruction = false;
          }
        } catch (Exception) {
          subInstruction = false;
        }
        if (subInstruction) {
          for (int j = 0; j < returnedSteps[i]['steps'].length; j++) {
            newDirection = toDirection(returnedSteps[i]['steps'][j], ModeOfTransport.driving,
                arrival_time, buildingDestination);
            newSegment.addSubstep(newDirection);
          }
        } else {
          newSegment.addSubstep(newDirection);
        }

        addNewPolyline(Colors.teal, pointArray, i);
      } else {
        var newDirection = toDirection(
            returnedSteps[i], ModeOfTransport.walking, arrival_time, buildingDestination);
        newSegment = Segment(newDirection);

        newDirection = endTransit(returnedSteps[i]['transit_details']['arrival_stop'],
            ModeOfTransport.walking, arrival_time, buildingDestination);
        newSegment.addSubstep(newDirection);

        addNewPolyline(Colors.pink, pointArray, i);
      }
      _listDirections.addSegment(newSegment);
    }
    setDirections();
  }

  static void walkingDirections(startLat, startLng, endLat, endLng, buildingDestination) async {
    _singleDirections = List<Direction>();
    _listDirections = Journey();
    String url =
        "https://maps.googleapis.com/maps/api/directions/json?origin=${startLat},${startLng}&destination=${endLat},${endLng}&mode=walking&key=${_apiKey}";
    http.Response response = await http.get(url);
    Map values = jsonDecode(response.body);
    PolyUtil myPoints = PolyUtil();
    var returnedValues = values['routes'][0]['legs'][0];
    var returnedSteps = returnedValues['steps'];
    for (int i = 0; i < returnedSteps.length; i++) {
      bool subInstruction = true;
      var arrival_time = calculateArrivalTime(returnedValues['duration']['text']);
      var pointArray = myPoints.decode(returnedSteps[i]['polyline']['points']);
      Segment newSegment;
      if (returnedSteps[i]['travel_mode'] == 'WALKING') {
        var newDirection = toDirection(
            returnedSteps[i], ModeOfTransport.walking, arrival_time, buildingDestination);
        newSegment = Segment(newDirection);
        try {
          if (returnedSteps[i]['steps'][0]['html_instructions'] == null) {
            subInstruction = false;
          }
        } catch (Exception) {
          subInstruction = false;
        }
        if (subInstruction) {
          for (int j = 0; j < returnedSteps[i]['steps'].length; j++) {
            newDirection = toDirection(returnedSteps[i]['steps'][j], ModeOfTransport.walking,
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

  static Direction toDirection(apiJson, ModeOfTransport transportType, String arrival_time, destination) {
    var instruction = apiJson['html_instructions'];
    var lat = apiJson['start_location']['lat'];
    var lng = apiJson['start_location']['lng'];
    LatLng coordinate = LatLng(lat, lng);
    var distance = apiJson['distance']['text'];
    return Direction(instruction, coordinate, transportType, distance, arrival_time, destination);
  }

  static Direction endTransit(apiJson, ModeOfTransport transportType, String arrival_time, destination) {
    var instruction = "Get off at ${apiJson['name']}";
    var lat = apiJson['location']['lat'];
    var lng = apiJson['location']['lng'];
    LatLng coordinate = LatLng(lat, lng);
    var distance = '';
    return Direction(instruction, coordinate, transportType, distance, arrival_time, destination);
  }

  static void addNewPolyline(Color colorChoice, pointValues, index) {
    _polyLines.add(Polyline(polylineId: PolylineId('${index}'), width: 4, points: pointValues, color: colorChoice));
  }

  static Set<Polyline> getPolylines() {
    return _polyLines;
  }

  static List<Direction> getRoute() {
    return _singleDirections;
  }

  static Direction getFirstInstruction() {
    return _singleDirections[_currentInstruction];
  }

  static Direction getNextInstruction() {
    if (_currentInstruction == _singleDirections.length - 1) {
      return _singleDirections[_currentInstruction];
      // HANDLE END OF NAVIGATION
    }
    return _singleDirections[++_currentInstruction];
  }

  static Direction getPreviousInstruction() {
    if (_currentInstruction == 0) {
      return _singleDirections[_currentInstruction];
    } else {
      return _singleDirections[--_currentInstruction];
    }
  }

  static void clearAll() {
    _singleDirections.clear();
    _listDirections.resetList();
    _currentInstruction = 0;
    _polyLines.clear();
  }

  static String calculateArrivalTime(durationJSON) {
    durationJSON;
    List<String> durationToSplit = durationJSON.split(" ");
    var duration;
    if (durationToSplit.length == 2) {
      duration = int.parse(durationToSplit[0]);
    } else {
      duration = int.parse(durationToSplit[0]) * 60 + int.parse(durationToSplit[2]);
    }
    var currentTime = DateTime.now();
    Duration newDuration = Duration(days: 0, hours: 0, minutes: duration);
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
    for (int i = 0; i < tempDirections.length; i++) {
      _singleDirections.add(tempDirections[i]);
    }
  }
}
