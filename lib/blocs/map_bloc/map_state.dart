import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class MapState {
  const MapState();
}

class InitialMap extends MapState {
  final markers = null;
  const InitialMap();
}

class MapNoMarker extends MapState {
  final LatLng cameraPosition;
  final double zoom;

  const MapNoMarker(this.cameraPosition, this.zoom);
}

class MapWithMarker extends MapState {
  final String buildingCode;
  final LatLng cameraPosition;
  final double zoom;

  const MapWithMarker(this.buildingCode, this.cameraPosition, this.zoom);
}

class DirectionMap extends MapState {
  final Set<Polyline> directionLines;

  const DirectionMap(this.directionLines);
}

class IndoorMap extends MapState {
  final String svgFile;
  final String floorLevel;

  const IndoorMap(this.floorLevel, this.svgFile);
}
