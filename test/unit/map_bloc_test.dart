import 'package:bloc_test/bloc_test.dart';
import 'package:concordia_go/blocs/bloc.dart';
import 'package:concordia_go/utilities/concordia_constants.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockSwitchCampusEvent extends Mock implements SwitchCampusEvent {
  @override
  Future<MapState> createState() async {
    return BasicMapState(null, 0, false);
  }
}

void main() {
  final moveCameraEvent = MoveCameraEvent(buildings['H'].coordinates, 1.0, false);
  final selectConcordiaBuildingEvent = SelectConcordiaBuildingEvent(buildings['H'].code);
  final switchCampusEvent = MockSwitchCampusEvent();
  final directionLinesEvent = DirectionLinesEvent(null);

  blocTest(
    'Send move camera event',
    build: () async => MapBloc(),
    act: (bloc) {
      return bloc.add(moveCameraEvent);
    },
    expect: [isA<BasicMapState>()],
  );

  blocTest(
    'Send select concordia building event',
    build: () async => MapBloc(),
    act: (bloc) {
      return bloc.add(selectConcordiaBuildingEvent);
    },
    expect: [isA<ConcordiaMapState>()],
  );

  blocTest(
    'Send switch campus event',
    build: () async => MapBloc(),
    act: (bloc) => bloc.add(switchCampusEvent),
    expect: [isA<BasicMapState>()],
  );

  blocTest(
    'Send direction lines event',
    build: () async => MapBloc(),
    act: (bloc) {
      return bloc.add(directionLinesEvent);
    },
    expect: [isA<DirectionMapState>()],
  );
}
