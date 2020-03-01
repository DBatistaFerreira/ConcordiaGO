import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:concordia_go/blocs/building_info_bloc/building_info_bloc.dart';
import 'package:concordia_go/blocs/building_info_bloc/building_info_event.dart';
import 'package:concordia_go/blocs/building_info_bloc/building_info_state.dart';
import 'package:concordia_go/utilities/concordia_constants.dart';

void main() {
  final event = ConcordiaBuildingInfo(buildings['H'].code);
  final toggleEvent = ToggleHoursEvent(true);
  blocTest(
    'Get Concordia Building Info',
    build: () async => BuildingInfoBloc(),
    act: (bloc) {
      bloc.add(event);
      return bloc.add(toggleEvent);
    },
    expect: [isA<BuildingInfo>(), isA<BuildingInfo>()],
  );
}
