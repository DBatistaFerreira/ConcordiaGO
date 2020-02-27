import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import './bloc.dart';
import 'package:concordia_go/services/OutdoorPathService.dart';

class DirectionsBloc extends Bloc<DirectionsEvent, DirectionsState> {
  @override
  DirectionsState get initialState => InitialDirectionsState();

  @override
  Stream<DirectionsState> mapEventToState(
    DirectionsEvent event,
  ) async* {
    if (event is PolylineUpdate) {
      var polyLines = OutdoorPathService.buildPolylines(event.startCoordinates.latitude,
          event.startCoordinates.longitude, event.endCoordinates.latitude, event.endCoordinates.longitude);
      yield polyUpdates(polyLines);
    } else
      if (event is ClearPolylines){
        OutdoorPathService.clearAll();
        var polyLines = Set<Polyline>();
        yield polyUpdates(polyLines);
      }
  }
}
