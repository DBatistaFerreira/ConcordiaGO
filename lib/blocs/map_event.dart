import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class MapEvent {
  const MapEvent();
}

class CameraMove extends MapEvent {
  final LatLng coordinates;
  final double zoom;
  final bool setMarker;

  const CameraMove(this.coordinates, this.zoom, this.setMarker);
}
