import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:google_maps_util/google_maps_util.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:concordia_go/utilities/Direction.dart';
import 'package:concordia_go/utilities/Segment.dart';
import 'package:concordia_go/utilities/Journey.dart';
import 'package:flutter/material.dart';

final Set<Polyline> polyLines={};
Journey listDirections = Journey();
List<Direction> singleDirections;
int currentInstruction = 0;

class OutdoorPathService {


  static void _testFunction(startLat, startLng, endLat, endLng) async {
    listDirections = Journey();
    String url = "https://maps.googleapis.com/maps/api/directions/json?origin=${startLat},${startLng}&destination=${endLat},${endLng}&mode=transit&key=AIzaSyCSfOQPeMpgh41izZJjUWVF625BL-NimZs";
    http.Response response = await http.get(url);
    Map values = jsonDecode(response.body);
    PolyUtil myPoints = PolyUtil();
    for (int i = 0; i < values['routes'][0]['legs'][0]['steps'].length; i++) {
      var pointArray = myPoints.decode(values['routes'][0]['legs'][0]['steps'][i]['polyline']['points']);
      Segment newSegment;
      if (values['routes'][0]['legs'][0]['steps'][i]['travel_mode'] == 'WALKING') {
        var newDirection = toDirection(values['routes'][0]['legs'][0]['steps'][i], modeOfTransport.walking);
        newSegment = Segment(newDirection);

        for (int j = 0; j < values['routes'][0]['legs'][0]['steps'][i]['steps'].length; j++) {
          newDirection = toDirection(values['routes'][0]['legs'][0]['steps'][i]['steps'][j], modeOfTransport.walking);
          newSegment.addSubstep(newDirection);
        }

        addNewPolyline(Colors.pink, pointArray, i);
      }
      else {
        var newDirection = toDirection(values['routes'][0]['legs'][0]['steps'][i], modeOfTransport.transit);
        newSegment = Segment(newDirection);

        newDirection = endTransit(values['routes'][0]['legs'][0]['steps'][i]['transit_details']['arrival_stop'], modeOfTransport.transit);
        newSegment.addSubstep(newDirection);

        addNewPolyline(Colors.teal, pointArray, i);
      }
      listDirections.addSegment(newSegment);

    }
    setDirections();
    print("-------------------------------------");
    print("List Directions");
    print("-------------------------------------");
    listDirections.printRoute();
    print("-------------------------------------");
    print("Play by play directions");
    print("-------------------------------------");
    for(int i=0; i<singleDirections.length;i++){
      print(singleDirections[i].instruction);
    }
  }



  static Direction toDirection(apiJson, modeOfTransport transportType){
    var instruction = apiJson['html_instructions'];
    var lat = apiJson['start_location']['lat'];
    var lng = apiJson['start_location']['lng'];
    LatLng coordinate = LatLng(lat,lng);
    return Direction(instruction, coordinate, transportType);
  }

  static Direction endTransit(apiJson, modeOfTransport transportType){
    var instruction = "Get off at ${apiJson['name']}";
    var lat = apiJson['location']['lat'];
    var lng = apiJson['location']['lng'];
    LatLng coordinate = LatLng(lat,lng);
    return Direction(instruction, coordinate, transportType);
  }

  static void addNewPolyline(Color colorChoice, pointValues, index){
    polyLines.add(Polyline(
        polylineId: PolylineId('${index}'),
        width: 4,
        points: pointValues,
        color: colorChoice));
  }

  static Set<Polyline> buildPolylines(startLat, startLng, endLat, endLng){

    _testFunction(startLat, startLng, endLat, endLng);
    return polyLines;


  }

  static Journey returnRoute(){
    return listDirections;
  }

  static Direction returnFirstInstruction(){
    return singleDirections[currentInstruction];
  }
  static Direction returnNextInstruction(){
    if(currentInstruction == singleDirections.length-1){
      //Do something here to end transit
      clearAll();
      return null;
    }
    return singleDirections[++currentInstruction];
  }

  static Direction returnPreviousInstruction(){
    if (currentInstruction == 0){
      return singleDirections[currentInstruction];
    }else{
      return singleDirections[--currentInstruction];
    }
  }

  static void clearAll(){
    singleDirections.clear();
    listDirections.resetList();
    currentInstruction = 0;
  }

  static void setDirections(){
    singleDirections.clear();
    var tempDirections = listDirections.toDirection();
    for(int i=0;i<tempDirections.length;i++){
      // print(tempDirections.length);
      singleDirections.add(tempDirections[i]);
    }
  }

}