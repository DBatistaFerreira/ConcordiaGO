import 'package:concordia_go/services/outdoor_path_service.dart';
import 'package:concordia_go/services/scheduler_service.dart';
import 'package:concordia_go/utilities/direction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_util/google_maps_util.dart';
import 'package:concordia_go/utilities/constant_json.dart' as json;


  void main(){
      OutdoorPathService.instance.clearAll();
      test('NicksMagicalChooserofDirections', () async{
          expect(await OutdoorPathService.instance.nicksMagicalChooserOfDirections(45.456547, -73.9024, 45.456294, -73.9032, 'Test', ModeOfTransport.walking), 1);
          expect(await OutdoorPathService.instance.nicksMagicalChooserOfDirections(45.456547, -73.9024, 45.456294, -73.9032, 'Test', ModeOfTransport.driving), 2);
          expect(await OutdoorPathService.instance.nicksMagicalChooserOfDirections(45.456547, -73.9024, 45.456294, -73.9032, 'Test', ModeOfTransport.transit), 3);
          expect(await OutdoorPathService.instance.nicksMagicalChooserOfDirections(45.456547, -73.9024, 45.456294, -73.9032, 'Test', ModeOfTransport.shuttle), 4);
          expect(await OutdoorPathService.instance.nicksMagicalChooserOfDirections(45.456547, -73.9024, 45.456294, -73.9032, 'Test', 'testing'), -1);
        });

      
      test('toDirection', () {
        OutdoorPathService.instance.clearAll();
          var mockJSON = {
            'html_instructions' : 'testInstruction1',
            "start_location" : {
              "lat" : 45.5284097,
              "lng" : -73.7968983
            },
            "distance" : {
              "text" : "24.8 km",
              "value" : 24793
            },
          };
  
          Direction testDirection = OutdoorPathService.instance.toDirection(mockJSON, ModeOfTransport.walking, '0:00', 'TestHall');
          expect(testDirection.instruction, 'testInstruction1');
          expect(testDirection.coordinate.latitude, 45.5284097);
          expect(testDirection.coordinate.longitude, -73.7968983);
          expect(testDirection.distance, "24.8 km");
          expect(testDirection.transitType, ModeOfTransport.walking);
          expect(testDirection.arrivalTime, '0:00');
          expect(testDirection.destination, 'TestHall');
  
        });

      test('endTransit', () {
          var mockJSON = {
              "location" : {
                "lat" : 45.515212,
                "lng" : -73.561050
              },
              "name" : "Berri-UQAM"
          };
  
          Direction testDirection = OutdoorPathService.instance.endTransit(mockJSON, ModeOfTransport.walking, '0:00', 'TestHall');
          expect(testDirection.instruction, 'Get off at Berri-UQAM');
          expect(testDirection.coordinate.latitude, 45.515212);
          expect(testDirection.coordinate.longitude, -73.561050);
          expect(testDirection.transitType, ModeOfTransport.walking);
          expect(testDirection.arrivalTime, '0:00');
          expect(testDirection.destination, 'TestHall');
  
        });

      test('addPolylinesAndGetPolyLines', () {
        OutdoorPathService.instance.clearAll();
        var testPoints = PolyUtil();
        expect(OutdoorPathService.instance.getPolylines(), []);
        OutdoorPathService.instance.addNewPolyline(Colors.pink, testPoints.decode("ymmtGrgabM|AmCj@lAd@jALHNArA}@"), 0);
        var savedPolylines = OutdoorPathService.instance.getPolylines();
       expect(savedPolylines.elementAt(0).points.contains(LatLng(45.457730000000005, -73.90346000000001)), true);
       expect(savedPolylines.elementAt(0).points.contains(LatLng(45.456700000000005, -73.90356000000001)), true);
       expect(savedPolylines.elementAt(0).points.contains(LatLng(45.457730000000005, -73.90346005000001)), false);
       expect(savedPolylines.elementAt(0).points.contains(LatLng(45.457730040000005, -73.90346000000001)), false);

      });

      test('getRoute', () {
        OutdoorPathService.instance.clearAll();
        List<Direction> directionsList = List<Direction>();
        directionsList.add(Direction("test1", LatLng(1,2), ModeOfTransport.walking, "2.5km", "0:00", "Test Building"));
        directionsList.add(Direction("test2", LatLng(1,2), ModeOfTransport.walking, "2.5km", "0:00", "Test Building"));
        directionsList.add(Direction("test3", LatLng(1,2), ModeOfTransport.walking, "2.5km", "0:00", "Test Building"));
        directionsList.add(Direction("test4", LatLng(1,2), ModeOfTransport.walking, "2.5km", "0:00", "Test Building"));
        directionsList.add(Direction("test5", LatLng(1,2), ModeOfTransport.walking, "2.5km", "0:00", "Test Building"));
        OutdoorPathService.instance.singleDirections(directionsList);

        expect(OutdoorPathService.instance.getRoute(), directionsList);
      });

      test('getDirection Methods', () {
        OutdoorPathService.instance.clearAll();
        List<Direction> directionsList = List<Direction>();
        var directions = [
        Direction("test1", LatLng(1,2), ModeOfTransport.walking, "2.5km", "0:00", "Test Building"),
        Direction("test2", LatLng(1,2), ModeOfTransport.walking, "2.5km", "0:00", "Test Building"),
        Direction("test3", LatLng(1,2), ModeOfTransport.walking, "2.5km", "0:00", "Test Building"),
        Direction("test4", LatLng(1,2), ModeOfTransport.walking, "2.5km", "0:00", "Test Building"),
        Direction("test5", LatLng(1,2), ModeOfTransport.walking, "2.5km", "0:00", "Test Building"),
        ];
        for(int i=0;i<directions.length;i++){
          directionsList.add(directions[i]);
        }
        OutdoorPathService.instance.singleDirections(directionsList);

        expect(OutdoorPathService.instance.getRoute(), directionsList);
        expect(OutdoorPathService.instance.getFirstInstruction(), directions[0]);
        expect(OutdoorPathService.instance.getNextInstruction(), directions[1]);
        expect(OutdoorPathService.instance.getPreviousInstruction(), directions[0]);
        expect(OutdoorPathService.instance.getNextInstruction(), directions[1]);
        expect(OutdoorPathService.instance.getNextInstruction(), directions[2]);
        expect(OutdoorPathService.instance.getNextInstruction(), directions[3]);
        expect(OutdoorPathService.instance.getNextInstruction(), directions[4]);
        expect(OutdoorPathService.instance.getNextInstruction(), directions[4]);
      });

      test('calculateArrivalTime', () {
        OutdoorPathService.instance.clearAll();
        expect(OutdoorPathService.instance.calculateArrivalTime('2 mins'), SchedulerService.instance.calculateNewTime(SchedulerService.instance.stringTime(),2));
        expect(OutdoorPathService.instance.calculateArrivalTime('2 hours 4 mins'), SchedulerService.instance.calculateNewTime(SchedulerService.instance.stringTime(),124));
        expect(OutdoorPathService.instance.calculateArrivalTime('0 min'), SchedulerService.instance.calculateNewTime(SchedulerService.instance.stringTime(),0));
        expect(OutdoorPathService.instance.calculateArrivalTime('8 hours 15 min'), SchedulerService.instance.calculateNewTime(SchedulerService.instance.stringTime(),495));
      });

      test('addWalkingPath', (){
        OutdoorPathService.instance.clearAll();
        expect(OutdoorPathService.instance.addWalkingPath(json.testJSON, 'Test Hall', 0),SchedulerService.instance.calculateNewTime(SchedulerService.instance.stringTime(),6));
      });


  }