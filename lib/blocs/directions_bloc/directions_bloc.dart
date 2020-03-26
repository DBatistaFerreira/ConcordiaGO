import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:concordia_go/services/outdoor_path_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc.dart';

class DirectionsBloc extends Bloc<DirectionsEvent, DirectionsState> {
  final OutdoorPathService outdoorPathService = OutdoorPathService.instance;

  @override
  DirectionsState get initialState => InitialDirectionsState();

  @override
  Stream<DirectionsState> mapEventToState(
    DirectionsEvent event,
  ) async* {
    if (!(event is GetDirectionsEvent)) {
      event.state = state;
    }
    yield await event.createState();
  }
}
