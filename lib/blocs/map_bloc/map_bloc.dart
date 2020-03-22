import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:concordia_go/services/indoor_path_service.dart';
import 'package:concordia_go/utilities/concordia_constants.dart'
    as concordia_constants;
import 'package:concordia_go/utilities/floor_maps_lib.dart' as floor_maps;
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  @override
  MapState get initialState => InitialMap();

  @override
  Stream<MapState> mapEventToState(
    MapEvent event,
  ) async* {
    if (event is CameraMove) {
      yield MapNoMarker(event.coordinates, event.zoom);
    } else if (event is CameraMoveConcordia) {
      var coordinates =
          concordia_constants.buildings[event.buildingCode].coordinates;

      BlocProvider.of<BuildingInfoBloc>(event.context)
          .add(ConcordiaBuildingInfo(event.buildingCode));
      yield MapWithMarker(
          event.buildingCode, coordinates, concordia_constants.poiZoomLevel);
    } else if (event is DirectionLinesEvent) {
      yield DirectionMap(event.directionPolylines);
    } else if (event is FloorChange) {
      var svgFile = floor_maps.floorPlan[event.floorLevel];
      if(event.paths!=null){
        List<List<int>> pathMap = new List();
        for(var path in event.paths){
          pathMap.add(floor_maps.nodeGraph['H'][event.floorLevel][path]);
        }
        svgFile = IndoorPathService.parse(svgFile, pathMap);
      }
      yield IndoorMap(event.floorLevel, svgFile);
    }
  }
}
