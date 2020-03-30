import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:concordia_go/models/node.dart';
import 'package:concordia_go/services/indoor_path_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:concordia_go/utilities/concordia_constants.dart' as concordia_constants;
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:concordia_go/utilities/floor_maps_lib.dart' as floor_maps;

part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  @override
  MapState get initialState => const InitialMapState();

  @override
  Stream<MapState> mapEventToState(
    MapEvent event,
  ) async* {
    yield await event.createState();
  }
}
