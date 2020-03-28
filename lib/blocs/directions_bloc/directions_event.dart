import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meta/meta.dart';
import 'package:concordia_go/blocs/bloc.dart';

@immutable
abstract class DirectionsEvent {
  const DirectionsEvent();

  DirectionsState createState();
}

class GetDirections extends DirectionsEvent {
  final LatLng startCoordinates;
  final LatLng endCoordinates;
  final String destination;

  const GetDirections(
      this.startCoordinates, this.endCoordinates, this.destination);

  @override
  DirectionsState createState() {
    // TODO: implement createState
    return null;
  }
}

class NextDirection extends DirectionsEvent {
  const NextDirection();

  @override
  DirectionsState createState() {
    // TODO: implement createState
    return null;
  }
}

class PreviousDirection extends DirectionsEvent {
  const PreviousDirection();

  @override
  DirectionsState createState() {
    // TODO: implement createState
    return null;
  }
}
