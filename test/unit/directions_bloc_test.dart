import 'package:bloc_test/bloc_test.dart';
import 'package:concordia_go/blocs/bloc.dart';
import 'package:concordia_go/blocs/directions_bloc/directions_bloc.dart';
import 'package:concordia_go/services/outdoor_path_service.dart';
import 'package:concordia_go/utilities/direction.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mockito/mockito.dart';

class MockOutdoorPathService extends Mock implements OutdoorPathService {}

void main() {
//  MockOutdoorPathService mockOutdoorPathService;

//  setUp(() {
//    mockOutdoorPathService = MockOutdoorPathService();
//  });

//  To properly test the DirectionsBloc functionality, OutdoorPathService needs to be refactored as a singleton class
//  and DirectionsBloc needs to use the instance of OutdoorPathService to call the service
  blocTest(
    'GetDirections event yields InstructionUpdate',
    build: () async => DirectionsBloc(),
    act: (bloc) => bloc.add(
        GetDirectionsEvent(LatLng(0, 0), LatLng(0, 0), 'Atlantic Ocean under West Africa', ModeOfTransport.transit)),
    expect: [
//      isA<InstructionUpdate>(),
    ],
  );

  blocTest(
    'NextDirection event yields InstructionUpdate',
    build: () async => DirectionsBloc(),
    act: (bloc) => bloc.add(NextInstructionEvent()),
    expect: [
//      isA<InstructionUpdate>(),
    ],
  );

  blocTest(
    'PreviousDirection event yields InstructionUpdate',
    build: () async => DirectionsBloc(),
    act: (bloc) => bloc.add(PreviousInstructionEvent()),
    expect: [
//      isA<InstructionUpdate>(),
    ],
  );
}
