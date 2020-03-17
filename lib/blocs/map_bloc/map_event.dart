import 'package:concordia_go/blocs/bloc.dart';
import 'package:concordia_go/utilities/concordia_constants.dart' as concordia_constants;
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class MapEvent {
  const MapEvent();

  MapState createState();
}

class CameraMove extends MapEvent {
  final LatLng _coordinates;
  final double _zoom;

  const CameraMove(this._coordinates, this._zoom);

  @override
  MapState createState() {
    return MapNoMarker(_coordinates, _zoom);
  }
}

class CameraMoveConcordia extends MapEvent {
  final String _buildingCode;

  const CameraMoveConcordia(this._buildingCode);

  @override
  MapState createState() {
    return MapWithMarker(
        _buildingCode, concordia_constants.buildings[_buildingCode].coordinates, concordia_constants.poiZoomLevel);
  }
}

class DirectionLinesEvent extends MapEvent {
  final Set<Polyline> _directionPolylines;

  const DirectionLinesEvent(this._directionPolylines);

  @override
  MapState createState() {
    return DirectionMap(_directionPolylines);
  }
}
