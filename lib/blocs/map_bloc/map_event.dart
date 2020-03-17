import 'package:concordia_go/blocs/bloc.dart';
import 'package:concordia_go/utilities/concordia_constants.dart' as concordia_constants;
import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class MapEvent {
  const MapEvent();

  MapState createState();
}

class CameraMove extends MapEvent {
  final LatLng coordinates;
  final double zoom;

  const CameraMove(this.coordinates, this.zoom);

  @override
  MapState createState() {
    return MapNoMarker(coordinates, zoom);
  }
}

class CameraMoveConcordia extends MapEvent {
  final String buildingCode;
  final BuildContext context;

  const CameraMoveConcordia(this.buildingCode, this.context);

  @override
  MapState createState() {
    return MapWithMarker(
        buildingCode, concordia_constants.buildings[buildingCode].coordinates, concordia_constants.poiZoomLevel);
  }
}

class DirectionLinesEvent extends MapEvent {
  final Set<Polyline> directionPolylines;

  const DirectionLinesEvent(this.directionPolylines);

  @override
  MapState createState() {
    return DirectionMap(directionPolylines);
  }
}
