import 'package:bloc_test/bloc_test.dart';
import 'package:concordia_go/models/classroom.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:concordia_go/blocs/building_info_bloc/building_info_bloc.dart';
import 'package:concordia_go/utilities/concordia_constants.dart';

void main() {
  // region BuildingInfoBloc Event to State tests
  group(('BuildingInfoBloc event to state tests'), () {
    blocTest(
      'ConcordiaBuildingInfoEvent should yield ConcordiaBuildingInfoState',
      build: () async => BuildingInfoBloc(),
      act: (bloc) => bloc.add(ConcordiaBuildingInfoEvent('H', false)),
      expect: [isA<ConcordiaBuildingInfoState>()],
    );

    blocTest(
      'ConcordiaRoomInfoEvent should yield ConcordiaRoomInfoState',
      build: () async => BuildingInfoBloc(),
      act: (bloc) => bloc.add(ConcordiaRoomInfoEvent('H', '8', '837')),
      expect: [isA<ConcordiaRoomInfoState>()],
    );
  });
  // endregion

  // region BuildingInfoState tests
  group(('BuildingInfoState tests for constructors and getters'), () {
    Classroom room = Classroom(buildings['H'], '8', '801');

    test('BuildingInfoState tests', () {
      var state = ConcordiaBuildingInfoState(room.building, true);

      expect(state.building, room.building);
      expect(state.moreInfo, true);
    });

    test('RoomInfoState tests', () {
      var state = ConcordiaRoomInfoState(room.building, room.floor, room.number);

      expect(state.building, room.building);
      expect(state.floor, room.floor);
      expect(state.room, room.number);
    });
  });
  // endregion
}
