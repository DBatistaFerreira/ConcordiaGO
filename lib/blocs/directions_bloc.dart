import 'dart:async';
import 'package:flutter/cupertino.dart';
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
              event.endCoordinates.latitude, event.endCoordinates.longitude)
          .then((value) {
        polyLines = value;
        debugPrint('sending event');
        BlocProvider.of<DirectionsUiBloc>(event.context).add(FirstDirection());
        debugPrint('sent event');
      });
      debugPrint('yielding');
      yield polyUpdates(polyLines);
    } else if (event is ClearPolylines) {
      OutdoorPathService.clearAll();
      var polyLines = Set<Polyline>();
      yield polyUpdates(polyLines);
    }
  }
}