import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class MapState {
  const MapState();
}

class InitialMap extends MapState {
  const InitialMap();
}

class MapNoMarker extends MapState {
  final LatLng _cameraPosition;
  final double _zoom;

  const MapNoMarker(this._cameraPosition, this._zoom);

  LatLng get cameraPosition => _cameraPosition;

  double get zoom => _zoom;
}

class MapWithMarker extends MapState {
  final String _buildingCode;
  final LatLng _cameraPosition;
  final double _zoom;

  const MapWithMarker(this._buildingCode, this._cameraPosition, this._zoom);

  String get buildingCode => _buildingCode;

  LatLng get cameraPosition => _cameraPosition;

  double get zoom => _zoom;
}

class DirectionMap extends MapState {
  final Set<Polyline> _directionLines;

  const DirectionMap(this._directionLines);

  Set<Polyline> get directionLines => _directionLines;
}

class IndoorMap extends MapState {
  final String svgFile;
  final String floorLevel;

  const IndoorMap(this.floorLevel, this.svgFile);
}
