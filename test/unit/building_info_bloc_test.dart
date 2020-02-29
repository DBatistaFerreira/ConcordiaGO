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
  final event = ConcordiaBuildingInfo(buildings['H'].code);
  var name = buildings[event.buildingCode].name;
  var campus = buildings[event.buildingCode].campusString();
  var address = buildings[event.buildingCode].address;
  var coordinates = buildings[event.buildingCode].coordinates;
  var hours = buildings[event.buildingCode].hours;

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

//  blocTest(
//    'Get Concordia Building Info',
//    build: () async => BuildingInfoBloc(),
//    act: (bloc) => bloc.add(event),
//    expect: [binfo],
//  );
  test('Get Concordia Building Info', () async {
    final bloc = BuildingInfoBloc();
    bloc.add(event);
    await emitsExactly(bloc, [binfo]);
  });
}
