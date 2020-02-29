import 'package:bloc_test/bloc_test.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:concordia_go/blocs/building_info_bloc/building_info_bloc.dart';
import 'package:concordia_go/blocs/building_info_bloc/building_info_event.dart';
import 'package:concordia_go/blocs/building_info_bloc/building_info_state.dart';
import 'package:concordia_go/utilities/concordia_constants.dart';

class MockBuildingInfoBloc extends Mock implements BuildingInfoBloc {}

void main() {
  final event = ConcordiaBuildingInfo(buildings["H"].code);
  final Tevent = ToggleHoursEvent(true);
  String name = buildings[event.buildingCode].name;
  String campus = buildings[event.buildingCode].campusString();
  LatLng coordinates = buildings[event.buildingCode].coordinates;
  String address = buildings[event.buildingCode].address;
  Map<String, String> hours = buildings[event.buildingCode].hours;
  final binfo = BuildingInfo(
    event.buildingCode,
    name,
    campus,
    address,
    coordinates,
    hours,
    false,
    false,
  );
  final Tinfo = BuildingInfo(
    event.buildingCode,
    name,
    campus,
    address,
    coordinates,
    hours,
    true,
    true,
  );
  blocTest(
    'Get Concordia Building Info',
    build: () async {
      return BuildingInfoBloc();
    },
    act: (bloc) {
      bloc.add(event);
      return bloc.add(Tevent);
    },
    expect: [binfo, Tinfo],
  );
}
