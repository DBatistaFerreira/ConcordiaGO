import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class MapState {
  const MapState();
}

class InitialMap extends MapState {
  final markers = null;
  const InitialMap();
}

class ExplorationMap extends MapState {
  final LatLng cameraPosition;
  final double zoom;
  final Set<Marker> markers;

  const ExplorationMap(this.cameraPosition, this.zoom, this.markers);
}

class DirectionMap extends MapState {
  const DirectionMap();
}
