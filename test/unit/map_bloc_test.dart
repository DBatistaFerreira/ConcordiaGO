import 'package:bloc_test/bloc_test.dart';
import 'package:concordia_go/blocs/bloc.dart';
import 'package:concordia_go/models/classroom.dart';
import 'package:concordia_go/utilities/concordia_constants.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mockito/mockito.dart';

class MockSwitchCampusEvent extends Mock implements SwitchCampusEvent {
  @override
  Future<MapState> createState() async {
    return BasicMapState(null, 0, false);
  }
}

void main() {
  // region MapBloc Event to State tests
  group('MapBloc event to state tests', () {
    blocTest(
      'MoveCameraEvent should yield BasicMapState',
      build: () async => MapBloc(),
      act: (bloc) => bloc.add(MoveCameraEvent(buildings['H'].coordinates, poiZoomLevel, false)),
      expect: [isA<BasicMapState>()],
    );

    blocTest(
      'SelectConcordiaBuildingEvent should yield ConcordiaMapState',
      build: () async => MapBloc(),
      act: (bloc) => bloc.add(SelectConcordiaBuildingEvent(buildings['H'].code)),
      expect: [isA<ConcordiaMapState>()],
    );

    blocTest(
      'SwitchCampusEvent should yield BasicMapState',
      build: () async => MapBloc(),
      act: (bloc) => bloc.add(MockSwitchCampusEvent()),
      expect: [isA<BasicMapState>()],
    );

    blocTest(
      'Send direction lines event',
      build: () async => MapBloc(),
      act: (bloc) => bloc.add(DirectionLinesEvent(null)),
      expect: [isA<DirectionMapState>()],
    );

    blocTest(
      'Send floor change event',
      build: () async => MapBloc(),
      act: (bloc) {
        final Classroom room = rooms[0];
        return bloc.add(FloorChange(room.building.code, room.floor));
      },
      expect: [isA<IndoorMap>()],
    );
  });
  // endregion

  // region MapState tests
  group('MapState tests for constructors and getters', () {
    test('BasicMapState tests', () {
      var state = BasicMapState(buildings['H'].coordinates, poiZoomLevel, false);

      expect(state.cameraPosition, buildings['H'].coordinates);
      expect(state.zoom, poiZoomLevel);
      expect(state.showMarker, false);
    });

    test('ConcordiaMapState tests', () {
      var state = ConcordiaMapState('H', buildings['H'].coordinates, poiZoomLevel);

      expect(state.buildingCode, buildings['H'].code);
      expect(state.cameraPosition, buildings['H'].coordinates);
      expect(state.zoom, poiZoomLevel);
    });

    test('DirectionMapState tests', () {
      Polyline polyline = Polyline(polylineId: PolylineId('test_polyline'));
      var state = DirectionMapState({polyline});

      assert(state.directionLines.contains(polyline), true);
      expect(state.directionLines.elementAt(0).polylineId.value, 'test_polyline');
    });

    test('IndoorMap tests', () {
      Classroom room = Classroom(buildings['H'], '8', '820');
      var state = IndoorMap(room.building.code, room.floor, null, false, {
        'H8': [room.node]
      });

      expect(state.buildingCode, 'H');
      expect(state.floorLevel, '8');
      expect(state.svgFile, null);
      expect(state.showDrawer, false);
      expect(state.paths, {
        'H8': [room.node]
      });
    });
  });
  // endregion
}
