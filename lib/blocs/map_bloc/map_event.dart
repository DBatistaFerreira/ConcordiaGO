part of 'map_bloc.dart';

abstract class MapEvent {
  const MapEvent();

  Future<MapState> createState();
}

class MoveCameraEvent extends MapEvent {
  const MoveCameraEvent(this._coordinates, this._zoom, this._showMarker);

  final LatLng _coordinates;
  final double _zoom;
  final bool _showMarker;

  @override
  Future<MapState> createState() async {
    return BasicMapState(_coordinates, _zoom, _showMarker);
  }
}

class SelectConcordiaBuildingEvent extends MapEvent {
  const SelectConcordiaBuildingEvent(this._buildingCode);

  final String _buildingCode;

  @override
  Future<MapState> createState() async {
    return ConcordiaMapState(
        _buildingCode, concordia_constants.buildings[_buildingCode].coordinates, concordia_constants.poiZoomLevel);
  }
}

class SwitchCampusEvent extends MapEvent {
  const SwitchCampusEvent(this._currentCameraPosition);

  final LatLng _currentCameraPosition;

  @override
  Future<MapState> createState() async {
    LatLng coordinates;
    await getFurthestCampus().then((LatLng value) => coordinates = value);

    return BasicMapState(coordinates, concordia_constants.campusZoomLevel, false);
  }

  Future<LatLng> getFurthestCampus() async {
    final LatLng sgwCoordinates = concordia_constants.sgwCampus['coordinates'] as LatLng;
    final LatLng loyolaCoordinates = concordia_constants.loyolaCampus['coordinates'] as LatLng;

    final double distanceToSGW = await Geolocator().distanceBetween(_currentCameraPosition.latitude,
        _currentCameraPosition.longitude, sgwCoordinates.latitude, sgwCoordinates.longitude);
    final double distanceToLoyola = await Geolocator().distanceBetween(_currentCameraPosition.latitude,
        _currentCameraPosition.longitude, loyolaCoordinates.latitude, loyolaCoordinates.longitude);

    return distanceToLoyola > distanceToSGW ? loyolaCoordinates : sgwCoordinates;
  }
}

class DirectionLinesEvent extends MapEvent {
  const DirectionLinesEvent(this._directionPolylines);

  final Set<Polyline> _directionPolylines;

  @override
  Future<MapState> createState() async {
    return DirectionMapState(_directionPolylines);
  }
}

class FloorChange extends MapEvent {
  const FloorChange(this._buildingCode, this._floorLevel, [this._paths, this._showDrawer = false]);

  final String _floorLevel;
  final Map<String, List<Node>> _paths;
  final String _buildingCode;
  final bool _showDrawer;

  @override
  Future<MapState> createState() async {
    final String floorCode = _buildingCode + _floorLevel;
    String svgFile = floor_maps.floorPlan[floorCode];
    if (_paths != null && isPathOnFloorLevel()) {
      final List<List<int>> pathMap = <List<int>>[];
      for (final Node path in _paths[_floorLevel]) {
        pathMap.add(floor_maps.nodeGraph[floorCode][path.getId()]);
      }
      svgFile = IndoorPathService.parse(svgFile, pathMap);
    }
    return IndoorMap(_buildingCode, _floorLevel, svgFile, _showDrawer, _paths);
  }

  bool isPathOnFloorLevel() => _paths[_floorLevel] != null;
}
