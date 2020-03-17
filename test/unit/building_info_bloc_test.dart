import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:concordia_go/blocs/building_info_bloc/building_info_bloc.dart';
import 'package:concordia_go/blocs/building_info_bloc/building_info_event.dart';
import 'package:concordia_go/blocs/building_info_bloc/building_info_state.dart';
import 'package:concordia_go/utilities/concordia_constants.dart';

void main() {
  final event = ConcordiaBuildingInfo(buildings['H'].code, false);

  blocTest(
    'Get Concordia Building Info',
    build: () async => BuildingInfoBloc(),
    act: (bloc) {
      return bloc.add(event);
    },
    expect: [isA<BuildingInfo>()],
  );
}
