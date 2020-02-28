import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      var polyLines;
      await OutdoorPathService.transitDirections(event.startCoordinates.latitude, event.startCoordinates.longitude,
              event.endCoordinates.latitude, event.endCoordinates.longitude, event.destination)
          .then((value) {
        polyLines = value;
        BlocProvider.of<DirectionsUiBloc>(event.context).add(FirstDirection());
//        BlocProvider.of<DirectionsUiBloc>(event.context).add(AllDirections());
      });
      yield polyUpdates(polyLines);
    } else if (event is ClearPolylines) {
      OutdoorPathService.clearAll();
      var polyLines = Set<Polyline>();
      yield polyUpdates(polyLines);
    }
  }
}
