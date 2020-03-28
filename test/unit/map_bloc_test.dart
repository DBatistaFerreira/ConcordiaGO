import 'package:bloc_test/bloc_test.dart';
import 'package:concordia_go/blocs/bloc.dart';
import 'package:concordia_go/utilities/concordia_constants.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final eventMapNoMarker = CameraMove(buildings['H'].coordinates, 1.0);
  final eventMapWithMarker = CameraMoveConcordia(buildings['H'].code);
  final eventDirectionMap = DirectionLinesEvent(null);

  blocTest(
    'Get Map No Marker',
    build: () async => MapBloc(),
    act: (bloc) {
      return bloc.add(eventMapNoMarker);
    },
    expect: [isA<MapNoMarker>()],
  );

  blocTest(
    'Get Map With Marker',
    build: () async => MapBloc(),
    act: (bloc) {
      return bloc.add(eventMapWithMarker);
    },
    expect: [isA<MapWithMarker>()],
  );

  blocTest(
    'Get Direction Map',
    build: () async => MapBloc(),
    act: (bloc) {
      return bloc.add(eventDirectionMap);
    },
    expect: [isA<DirectionMap>()],
  );
}
