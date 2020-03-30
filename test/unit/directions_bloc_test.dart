import 'package:bloc_test/bloc_test.dart';
import 'package:concordia_go/blocs/bloc.dart';
import 'package:concordia_go/services/outdoor_path_service.dart';
import 'package:concordia_go/utilities/direction.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mockito/mockito.dart';

// region OutdoorPathService Mock
class MockOutdoorPathService extends Mock implements OutdoorPathService {
  @override
  Future<int> getDirections(double startLat, double startLng, double endLat, double endLng, String buildingDestination,
      ModeOfTransport modeOfTransport) async {
    return null;
  }

  @override
  Direction getFirstInstruction() {
    return null;
  }

  @override
  Direction getNextInstruction() {
    return null;
  }

  @override
  Direction getPreviousInstruction() {
    return null;
  }
}
// endregion

void main() {
  // region DirectionsBloc Event to State tests
  group('DirectionsBloc event to state tests', () {
    final MockOutdoorPathService mockOutdoorPathService = MockOutdoorPathService();

    blocTest(
      'GetDirections event yields InstructionUpdate',
      build: () async => DirectionsBloc(mockOutdoorPathService),
      act: (bloc) => bloc.add(
          GetDirectionsEvent(LatLng(0, 0), LatLng(0, 0), 'Atlantic Ocean under West Africa', ModeOfTransport.transit)),
      expect: <dynamic>[],
    );

    blocTest(
      'NextDirection event yields InstructionUpdate',
      build: () async => DirectionsBloc(mockOutdoorPathService),
      act: (bloc) => bloc.add(NextInstructionEvent()),
      expect: [],
    );

    blocTest(
      'PreviousDirection event yields InstructionUpdate',
      build: () async => DirectionsBloc(mockOutdoorPathService),
      act: (bloc) => bloc.add(PreviousInstructionEvent()),
      expect: [],
    );
  });
  // endregion

  // region DirectionsState tests
  group('DirectionsState tests for constructor and getter', () {
    test('InstructionState test', () {
      List<Direction> directionsList = List<Direction>();
      directionsList.add(Direction('test1', LatLng(1, 2), ModeOfTransport.walking, '2.5km', '0:00', 'Test Building'));
      directionsList.add(Direction('test2', LatLng(1, 2), ModeOfTransport.walking, '2.5km', '0:00', 'Test Building'));
      directionsList.add(Direction('test3', LatLng(1, 2), ModeOfTransport.walking, '2.5km', '0:00', 'Test Building'));

      var state = InstructionState(directionsList[1], directionsList);

      expect(state.step.instruction, 'test2');
      expect(state.directionsList, directionsList);
    });
  });
  // endregion
}
