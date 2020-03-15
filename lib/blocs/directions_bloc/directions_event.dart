import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meta/meta.dart';

@immutable
abstract class DirectionsEvent {
  const DirectionsEvent();
}

class GetDirections extends DirectionsEvent {
  final LatLng startCoordinates;
  final LatLng endCoordinates;
  final String destination;

  const GetDirections(
      this.startCoordinates, this.endCoordinates, this.destination);
}

class NextDirection extends DirectionsEvent {
  const NextDirection();
}

class PreviousDirection extends DirectionsEvent {
  const PreviousDirection();
}
