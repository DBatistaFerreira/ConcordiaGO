import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class MapState {
  const MapState();
}

class InitialMapState extends MapState {
  const InitialMapState();
}

class BasicMapState extends MapState {
  final LatLng _cameraPosition;
  final double _zoom;

  const BasicMapState(this._cameraPosition, this._zoom);

  LatLng get cameraPosition => _cameraPosition;

  double get zoom => _zoom;
}

class ConcordiaMapState extends MapState {
  final String _buildingCode;
  final LatLng _cameraPosition;
  final double _zoom;

  const ConcordiaMapState(this._buildingCode, this._cameraPosition, this._zoom);

  String get buildingCode => _buildingCode;

  LatLng get cameraPosition => _cameraPosition;

  double get zoom => _zoom;
}

class DirectionMapState extends MapState {
  final Set<Polyline> _directionLines;

  const DirectionMapState(this._directionLines);

  Set<Polyline> get directionLines => _directionLines;
}

class IndoorMap extends MapState {
  final String _svgFile;
  final String _floorLevel;
  final String _buildingCode;

  const IndoorMap(this._buildingCode, this._floorLevel, this._svgFile);

  String get svgFile => _svgFile;
  String get floorLevel => _floorLevel;
  String get buildingCode => _buildingCode;

}
