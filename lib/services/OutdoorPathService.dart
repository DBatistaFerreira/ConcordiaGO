import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:google_maps_util/google_maps_util.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:concordia_go/utilities/Direction.dart';
import 'package:concordia_go/utilities/Segment.dart';
import 'package:concordia_go/utilities/Journey.dart';
import 'package:flutter/material.dart';

class OutdoorPathService {
  static final Set<Polyline> _polyLines = {};
  static Journey _listDirections = Journey();
  static List<Direction> _singleDirections = List<Direction>();
  static int _currentInstruction = 0;

  static void transitDirections(startLat, startLng, endLat, endLng, buildingDestination) async {
    _singleDirections = List<Direction>();
    _listDirections = Journey();
    var apiKey;
    String url =
        "https://maps.googleapis.com/maps/api/directions/json?origin=${startLat},${startLng}&destination=${endLat},${endLng}&mode=transit&key=${apiKey}";
    http.Response response = await http.get(url);
    Map values = jsonDecode(response.body);
    PolyUtil myPoints = PolyUtil();
    for (int i = 0; i < values['routes'][0]['legs'][0]['steps'].length; i++) {
      bool subInstruction = true;
      var arrival_time = values['routes'][0]['legs'][0]['arrival_time']['text'];
      var pointArray = myPoints.decode(values['routes'][0]['legs'][0]['steps'][i]['polyline']['points']);
      Segment newSegment;
      if (values['routes'][0]['legs'][0]['steps'][i]['travel_mode'] == 'WALKING') {
        var newDirection = toDirection(
            values['routes'][0]['legs'][0]['steps'][i], ModeOfTransport.walking, arrival_time, buildingDestination);
        newSegment = Segment(newDirection);
        try {
          if (values['routes'][0]['legs'][0]['steps'][i]['steps'][0]['html_instructions'] == null) {
            subInstruction = false;
          }
        } catch (Exception) {
          subInstruction = false;
        }
        if (subInstruction) {
          for (int j = 0; j < values['routes'][0]['legs'][0]['steps'][i]['steps'].length; j++) {
            newDirection = toDirection(values['routes'][0]['legs'][0]['steps'][i]['steps'][j], ModeOfTransport.walking,
                arrival_time, buildingDestination);
            newSegment.addSubstep(newDirection);
          }
        } else {
          newSegment.addSubstep(newDirection);
        }

        addNewPolyline(Colors.pink, pointArray, i);
      } else {
        var newDirection = toDirection(
            values['routes'][0]['legs'][0]['steps'][i], ModeOfTransport.transit, arrival_time, buildingDestination);
        newSegment = Segment(newDirection);

        newDirection = endTransit(values['routes'][0]['legs'][0]['steps'][i]['transit_details']['arrival_stop'],
            ModeOfTransport.transit, arrival_time, buildingDestination);
        newSegment.addSubstep(newDirection);

        addNewPolyline(Colors.teal, pointArray, i);
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

  static void setDirections() {
    _singleDirections.clear();
    var tempDirections = _listDirections.toDirection();
    for (int i = 0; i < tempDirections.length; i++) {
      _singleDirections.add(tempDirections[i]);
    }
  }
}
