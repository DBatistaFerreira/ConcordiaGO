import 'package:concordia_go/utilities/Direction.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meta/meta.dart';

@immutable
abstract class DirectionsUiState {}

class InitialDirectionsUiState extends DirectionsUiState {
  final Direction currentDirection =
      Direction("NULL STATE", LatLng(45.457, -73.657), modeOfTransport.walking, "0km", "0:00PM");
}

class DirectionsUiUpdate extends DirectionsUiState {
  final Direction newDirection;

  DirectionsUiUpdate(this.newDirection);
}
