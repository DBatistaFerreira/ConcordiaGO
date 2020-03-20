import 'dart:async';

import 'package:concordia_go/blocs/bloc.dart';
import 'package:concordia_go/utilities/concordia_constants.dart' as concordia_constants;
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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
