part of 'map_bloc.dart';

abstract class MapState {
  const MapState();
}

class InitialMapState extends MapState {
  const InitialMapState();
}

class BasicMapState extends MapState {
  const BasicMapState(this._cameraPosition, this._zoom, this._showMarker);

  final LatLng _cameraPosition;
  final double _zoom;
  final bool _showMarker;

  LatLng get cameraPosition => _cameraPosition;

  double get zoom => _zoom;

  bool get showMarker => _showMarker;
}

class ConcordiaMapState extends MapState {
  const ConcordiaMapState(this._buildingCode, this._cameraPosition, this._zoom);

  final String _buildingCode;
  final LatLng _cameraPosition;
  final double _zoom;

  String get buildingCode => _buildingCode;

  LatLng get cameraPosition => _cameraPosition;

  double get zoom => _zoom;
}

class DirectionMapState extends MapState {
  const DirectionMapState(this._directionLines);

  final Set<Polyline> _directionLines;

  Set<Polyline> get directionLines => _directionLines;
}

class IndoorMap extends MapState {
  const IndoorMap(this._buildingCode, this._floorLevel, this._svgFile, this._showDrawer, this._paths);

  final String _svgFile;
  final String _floorLevel;
  final String _buildingCode;
  final bool _showDrawer;
  final Map<String, List<Node>> _paths;

  String get svgFile => _svgFile;

  String get floorLevel => _floorLevel;

  String get buildingCode => _buildingCode;

  bool get showDrawer => _showDrawer;

  Map<String, List<Node>> get paths => _paths;
}
