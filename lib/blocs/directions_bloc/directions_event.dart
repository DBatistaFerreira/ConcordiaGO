import 'package:concordia_go/utilities/direction.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meta/meta.dart';
import 'package:concordia_go/blocs/bloc.dart';

@immutable
abstract class DirectionsEvent {
  const DirectionsEvent();

  DirectionsState createState();
}

class GetDirectionsEvent extends DirectionsEvent {
  final LatLng startCoordinates;
  final LatLng endCoordinates;
  final String destination;
  final ModeOfTransport modeOfTransport;

  const GetDirectionsEvent(this.startCoordinates, this.endCoordinates, this.destination, this.modeOfTransport);

  @override
  DirectionsState createState() {
    // TODO: implement createState
    return null;
  }
}

class NextInstructionEvent extends DirectionsEvent {
  const NextInstructionEvent();

  @override
  DirectionsState createState() {
    // TODO: implement createState
    return null;
  }
}

class PreviousInstructionEvent extends DirectionsEvent {
  const PreviousInstructionEvent();

  @override
  DirectionsState createState() {
    // TODO: implement createState
    return null;
  }
}
