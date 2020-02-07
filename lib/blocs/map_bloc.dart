import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'bloc.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  @override
  MapState get initialState => InitialMap();

  @override
  Stream<MapState> mapEventToState(
    MapEvent event,
  ) async* {
    if (event is CameraMove) {
      if (event.setMarker == true) {
        Set<Marker> markers = {Marker(markerId: MarkerId('result'), position: event.coordinates)};
        yield ExplorationMap(event.coordinates, event.zoom, markers);
      } else {
        yield ExplorationMap(event.coordinates, event.zoom, null);
      }
    }
  }
}
