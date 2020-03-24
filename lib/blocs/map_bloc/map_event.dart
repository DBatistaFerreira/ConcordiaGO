import 'package:concordia_go/blocs/bloc.dart';
import 'package:concordia_go/models/node.dart';
import 'package:concordia_go/services/indoor_path_service.dart';
import 'package:concordia_go/utilities/concordia_constants.dart' as concordia_constants;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:concordia_go/utilities/floor_maps_lib.dart' as floor_maps;

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

class FloorChange extends MapEvent {
  final String floorLevel;
  final List<Node> paths;

  const FloorChange(this.floorLevel, [this.paths]);

  @override
  MapState createState() {
    var svgFile = floor_maps.floorPlan[floorLevel];
    if(paths!=null){
      List<List<int>> pathMap = List();
      for(var path in paths){
        pathMap.add(floor_maps.nodeGraph['H'][floorLevel][path.getId()]);
      }
      svgFile = IndoorPathService.parse(svgFile, pathMap);
    }
    return IndoorMap(floorLevel, svgFile);
  }
}

