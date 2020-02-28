import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:concordia_go/utilities/concordia_constants.dart' as concordia_constants;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
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
      LatLng coordinates = concordia_constants.buildings[event.buildingCode]['coordinates'];

      BlocProvider.of<BuildingInfoBloc>(event.context).add(ConcordiaBuildingInfo(event.buildingCode));
      yield MapWithMarker(event.buildingCode, coordinates, concordia_constants.poiZoomLevel);
    }
  }
}
