import 'package:bloc_test/bloc_test.dart';
import 'package:concordia_go/blocs/bloc.dart';
import 'package:concordia_go/services/outdoor_path_service.dart';
import 'package:concordia_go/utilities/direction.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mockito/mockito.dart';

class MockOutdoorPathService extends Mock implements OutdoorPathService {
  @override
  Future<int> getDirections(startLat, startLng, endLat, endLng, buildingDestination, modeOfTransport) async {
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

void main() {
  final mockOutdoorPathService = MockOutdoorPathService();

  blocTest(
    'GetDirections event yields InstructionUpdate',
    build: () async => DirectionsBloc(mockOutdoorPathService),
    act: (bloc) => bloc.add(
        GetDirectionsEvent(LatLng(0, 0), LatLng(0, 0), 'Atlantic Ocean under West Africa', ModeOfTransport.transit)),
    expect: [],
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
}
