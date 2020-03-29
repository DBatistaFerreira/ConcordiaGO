import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:concordia_go/services/outdoor_path_service.dart';
import 'package:concordia_go/utilities/direction.dart';
import 'package:concordia_go/widgets/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:concordia_go/utilities/concordia_constants.dart' as concordia_constants;
import '../bloc.dart';

part 'directions_event.dart';
part 'directions_state.dart';

class DirectionsBloc extends Bloc<DirectionsEvent, DirectionsState> {
  DirectionsBloc(this._outdoorPathService);

  final OutdoorPathService _outdoorPathService;

  @override
  DirectionsState get initialState => InitialDirectionsState();

  @override
  Stream<DirectionsState> mapEventToState(
    DirectionsEvent event,
  ) async* {
    if (event is! GetDirectionsEvent) {
      event.state = state as InstructionState;
    }
    yield await event.createState(_outdoorPathService);
  }
}
