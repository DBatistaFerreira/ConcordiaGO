import 'package:bloc_test/bloc_test.dart';
import 'package:concordia_go/blocs/bloc.dart';
import 'package:concordia_go/utilities/concordia_constants.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final eventNoMarker = CameraMove(buildings['H'].coordinates, 1.0);
  final eventDirectionMap = DirectionLinesEvent(null);

  blocTest(
    'Get Map Camera Movement',
    build: () async => MapBloc(),
    act: (bloc) {
      bloc.add(eventNoMarker);
      return bloc.add(eventDirectionMap);
    },
    expect: [isA<MapNoMarker>(), isA<DirectionMap>()],
  );
}