import 'dart:async';

import 'package:concordia_go/blocs/bloc.dart';
import 'package:concordia_go/models/node.dart';
import 'package:concordia_go/services/indoor_path_service.dart';
import 'package:concordia_go/utilities/concordia_constants.dart' as concordia_constants;
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:concordia_go/utilities/floor_maps_lib.dart' as floor_maps;

abstract class MapEvent {
  const MapEvent();

  Future<MapState> createState();
}

class MoveCameraEvent extends MapEvent {
  final LatLng _coordinates;
  final double _zoom;

  const MoveCameraEvent(this._coordinates, this._zoom);

  @override
  Future<MapState> createState() async {
    return BasicMapState(_coordinates, _zoom);
  }
}

class SelectConcordiaBuildingEvent extends MapEvent {
  final String _buildingCode;

  const SelectConcordiaBuildingEvent(this._buildingCode);

  @override
  Future<MapState> createState() async {
    return ConcordiaMapState(
        _buildingCode, concordia_constants.buildings[_buildingCode].coordinates, concordia_constants.poiZoomLevel);
  }
}

class SwitchCampusEvent extends MapEvent {
  final LatLng _currentCameraPosition;

  const SwitchCampusEvent(this._currentCameraPosition);

  @override
  Future<MapState> createState() async {
    var coordinates;
    await getFurthestCampus().then((value) => coordinates = value);

    return BasicMapState(coordinates, concordia_constants.campusZoomLevel);
  }

  Future<LatLng> getFurthestCampus() async {
    LatLng sgwCoordinates = concordia_constants.sgwCampus['coordinates'];
    LatLng loyolaCoordinates = concordia_constants.loyolaCampus['coordinates'];

    var distanceToSGW = await Geolocator().distanceBetween(_currentCameraPosition.latitude,
        _currentCameraPosition.longitude, sgwCoordinates.latitude, sgwCoordinates.longitude);
    var distanceToLoyola = await Geolocator().distanceBetween(_currentCameraPosition.latitude,
        _currentCameraPosition.longitude, loyolaCoordinates.latitude, loyolaCoordinates.longitude);

    return distanceToLoyola > distanceToSGW ? loyolaCoordinates : sgwCoordinates;
  }
}

class DirectionLinesEvent extends MapEvent {
  final Set<Polyline> _directionPolylines;

  const DirectionLinesEvent(this._directionPolylines);

  @override
  Future<MapState> createState() async {
    return DirectionMapState(_directionPolylines);
  }
}

class FloorChange extends MapEvent {
  final String _floorLevel;
  final List<Node> _paths;
  final String _buildingCode;
  final bool _showDrawer;

  const FloorChange(this._buildingCode, this._floorLevel, [this._paths, this._showDrawer=false]);

  @override
  Future<MapState> createState() async {
    var svgFile = floor_maps.floorPlan[_floorLevel];
    if (_paths != null) {
      List<List<int>> pathMap = List();
      for (var path in _paths) {
        pathMap.add(floor_maps.nodeGraph[_floorLevel][path.getId()]);
      }
      svgFile = IndoorPathService.parse(svgFile, pathMap);
    }
    return IndoorMap(_buildingCode, _floorLevel, svgFile, _showDrawer);
  }
}
