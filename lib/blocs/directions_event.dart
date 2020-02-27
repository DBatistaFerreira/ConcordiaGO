import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meta/meta.dart';

@immutable
abstract class DirectionsEvent {
  const DirectionsEvent();
}

class PolylineUpdate extends DirectionsEvent {
  final LatLng startCoordinates;
  final LatLng endCoordinates;
  final BuildContext context;
  final String destination;

  const PolylineUpdate(this.startCoordinates, this.endCoordinates, this.context, this.destination);
}

class ClearPolylines extends DirectionsEvent {
  const ClearPolylines();
}
