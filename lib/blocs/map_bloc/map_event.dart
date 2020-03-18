import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class MapEvent {
  const MapEvent();
}

class CameraMove extends MapEvent {
  final LatLng coordinates;
  final double zoom;

  const CameraMove(this.coordinates, this.zoom);
}

class CameraMoveConcordia extends MapEvent {
  final String buildingCode;
  final BuildContext context;

  const CameraMoveConcordia(this.buildingCode, this.context);
}

class DirectionLinesEvent extends MapEvent {
  final Set<Polyline> directionPolylines;

  const DirectionLinesEvent(this.directionPolylines);
}

class FloorChange extends MapEvent {
  final String floorLevel;

  const FloorChange(this.floorLevel);
}
