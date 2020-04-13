import 'package:concordia_go/services/outdoor_path_service.dart';
import 'package:concordia_go/services/scheduler_service.dart';
import 'package:concordia_go/utilities/direction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_util/google_maps_util.dart';
import 'package:concordia_go/utilities/constant_json.dart' as json;

void main() {
  final OutdoorPathService outdoorPathService = OutdoorPathService.instance;
  outdoorPathService.clearAll();

  test('Direction Type Selection', () async {
    expect(
        await outdoorPathService.getDirections(
            45.456547, -73.9024, 45.456294, -73.9032, 'Test', ModeOfTransport.walking),
        1);
    expect(
        await outdoorPathService.getDirections(
            45.456547, -73.9024, 45.456294, -73.9032, 'Test', ModeOfTransport.driving),
        2);
    expect(
        await outdoorPathService.getDirections(
            45.456547, -73.9024, 45.456294, -73.9032, 'Test', ModeOfTransport.transit),
        3);
    expect(
        await outdoorPathService.getDirections(
            45.456547, -73.9024, 45.456294, -73.9032, 'Test', ModeOfTransport.shuttle),
        4);
    expect(await outdoorPathService.getDirections(45.456547, -73.9024, 45.456294, -73.9032, 'Test', null), -1);
  });

  test('JSON to Direction', () {
    outdoorPathService.clearAll();
    final Map<String, dynamic> mockJSON = <String, dynamic>{
      'html_instructions': 'testInstruction1',
      'start_location': <String, double>{'lat': 45.5284097, 'lng': -73.7968983},
      'distance': <String, dynamic>{'text': '24.8 km', 'value': 24793},
    };

    final Direction testDirection =
        outdoorPathService.toDirection(mockJSON, ModeOfTransport.walking, '0:00', 'TestHall');
    expect(testDirection.instruction, 'testInstruction1');
    expect(testDirection.coordinate.latitude, 45.5284097);
    expect(testDirection.coordinate.longitude, -73.7968983);
    expect(testDirection.distance, '24.8 km');
    expect(testDirection.transitType, ModeOfTransport.walking);
    expect(testDirection.arrivalTime, '0:00');
    expect(testDirection.destination, 'TestHall');
  });

  test('JSON to End Transit Direction', () {
    var mockJSON = {
      'location': {'lat': 45.515212, 'lng': -73.561050},
      'name': 'Berri-UQAM'
    };

    Direction testDirection = outdoorPathService.endTransit(mockJSON, ModeOfTransport.walking, '0:00', 'TestHall');
    expect(testDirection.instruction, 'Get off at Berri-UQAM');
    expect(testDirection.coordinate.latitude, 45.515212);
    expect(testDirection.coordinate.longitude, -73.561050);
    expect(testDirection.transitType, ModeOfTransport.walking);
    expect(testDirection.arrivalTime, '0:00');
    expect(testDirection.destination, 'TestHall');
  });

  test('PolyLine Creation and Handling', () {
    outdoorPathService.clearAll();
    final PolyUtil testPoints = PolyUtil();
    expect(outdoorPathService.getPolylines(), <Polyline>{});
    outdoorPathService.addNewPolyline(
        Colors.pink, testPoints.decode('ymmtGrgabM|AmCj@lAd@jALHNArA}@') as List<LatLng>, '0');
    final Set<Polyline> savedPolylines = outdoorPathService.getPolylines();
    expect(savedPolylines.elementAt(0).points.contains(const LatLng(45.457730000000005, -73.90346000000001)), true);
    expect(savedPolylines.elementAt(0).points.contains(const LatLng(45.456700000000005, -73.90356000000001)), true);
    expect(savedPolylines.elementAt(0).points.contains(const LatLng(45.457730000000005, -73.90346005000001)), false);
    expect(savedPolylines.elementAt(0).points.contains(const LatLng(45.457730040000005, -73.90346000000001)), false);
  });

  test('Route Getter', () {
    outdoorPathService.clearAll();
    final List<Direction> directionsList = <Direction>[];
    directionsList
        .add(Direction('test1', const LatLng(1, 2), ModeOfTransport.walking, '2.5km', '0:00', 'Test Building'));
    directionsList
        .add(Direction('test2', const LatLng(1, 2), ModeOfTransport.walking, '2.5km', '0:00', 'Test Building'));
    directionsList
        .add(Direction('test3', const LatLng(1, 2), ModeOfTransport.walking, '2.5km', '0:00', 'Test Building'));
    directionsList
        .add(Direction('test4', const LatLng(1, 2), ModeOfTransport.walking, '2.5km', '0:00', 'Test Building'));
    directionsList
        .add(Direction('test5', const LatLng(1, 2), ModeOfTransport.walking, '2.5km', '0:00', 'Test Building'));
    outdoorPathService.singleDirections(directionsList);

    expect(outdoorPathService.getRoute(), directionsList);
  });

  test('Single Direction Getters', () {
    outdoorPathService.clearAll();
    final List<Direction> directionsList = <Direction>[];
    var directions = [
      Direction('test1', LatLng(1, 2), ModeOfTransport.walking, '2.5km', '0:00', 'Test Building'),
      Direction('test2', LatLng(1, 2), ModeOfTransport.walking, '2.5km', '0:00', 'Test Building'),
      Direction('test3', LatLng(1, 2), ModeOfTransport.walking, '2.5km', '0:00', 'Test Building'),
      Direction('test4', LatLng(1, 2), ModeOfTransport.walking, '2.5km', '0:00', 'Test Building'),
      Direction('test5', LatLng(1, 2), ModeOfTransport.walking, '2.5km', '0:00', 'Test Building'),
    ];
    for (int i = 0; i < directions.length; i++) {
      directionsList.add(directions[i]);
    }
    outdoorPathService.singleDirections(directionsList);

    expect(outdoorPathService.getRoute(), directionsList);
    expect(outdoorPathService.getFirstInstruction(), directions[0]);
    expect(outdoorPathService.getNextInstruction(), directions[1]);
    expect(outdoorPathService.getPreviousInstruction(), directions[0]);
    expect(outdoorPathService.getNextInstruction(), directions[1]);
    expect(outdoorPathService.getNextInstruction(), directions[2]);
    expect(outdoorPathService.getNextInstruction(), directions[3]);
    expect(outdoorPathService.getNextInstruction(), directions[4]);
  });

  test('Calculate New Arrival Time', () {
    outdoorPathService.clearAll();
    expect(outdoorPathService.calculateArrivalTime('2 mins'),
        SchedulerService.instance.calculateNewTime(SchedulerService.instance.stringTime(), 2));
    expect(outdoorPathService.calculateArrivalTime('2 hours 4 mins'),
        SchedulerService.instance.calculateNewTime(SchedulerService.instance.stringTime(), 124));
    expect(outdoorPathService.calculateArrivalTime('0 min'),
        SchedulerService.instance.calculateNewTime(SchedulerService.instance.stringTime(), 0));
    expect(outdoorPathService.calculateArrivalTime('8 hours 15 min'),
        SchedulerService.instance.calculateNewTime(SchedulerService.instance.stringTime(), 495));
  });

  test('Create Walking Path', () {
    outdoorPathService.clearAll();
    expect(outdoorPathService.addWalkingPath(json.testJSON, 'Test Hall', 0),
        SchedulerService.instance.calculateNewTime(SchedulerService.instance.stringTime(), 6));
  });

  test('Check if current instruction is last instruction', () {
    outdoorPathService.clearAll();
    List<Direction> directionsList = List<Direction>();
    directionsList.add(Direction('test1', LatLng(1, 2), ModeOfTransport.walking, '2.5km', '0:00', 'Test Building'));
    directionsList.add(Direction('test2', LatLng(1, 2), ModeOfTransport.walking, '2.5km', '0:00', 'Test Building'));

    outdoorPathService.singleDirections(directionsList);
    assert(!outdoorPathService.isLastInstruction());

    outdoorPathService.getNextInstruction();
    assert(outdoorPathService.isLastInstruction());
  });
}
