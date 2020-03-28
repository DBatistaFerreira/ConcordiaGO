import 'package:concordia_go/services/outdoor_path_service.dart';
import 'package:concordia_go/utilities/concordia_constants.dart' as concordia_constants;
import 'package:concordia_go/utilities/direction.dart';
import 'package:concordia_go/widgets/screens/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:concordia_go/blocs/bloc.dart';

abstract class DirectionsEvent {
  final OutdoorPathService outdoorPathService = OutdoorPathService.instance;
  InstructionState _state;

  set state(InstructionState value) {
    _state = value;
  }

  DirectionsEvent();

  Future<DirectionsState> createState();
}

class GetDirectionsEvent extends DirectionsEvent {
  final LatLng _startCoordinates;
  final LatLng _endCoordinates;
  final String _destination;
  final ModeOfTransport _modeOfTransport;

  GetDirectionsEvent(this._startCoordinates, this._endCoordinates, this._destination, this._modeOfTransport);

  @override
  Future<DirectionsState> createState() async {
    await outdoorPathService.nicksMagicalChooserOfDirections(
      _startCoordinates.latitude,
      _startCoordinates.longitude,
      _endCoordinates.latitude,
      _endCoordinates.longitude,
      _destination,
      _modeOfTransport,
    );

    Direction newInstruction = await outdoorPathService.getFirstInstruction();
    BlocProvider.of<MapBloc>(mc)
        .add(MoveCameraEvent(newInstruction.coordinate, concordia_constants.navZoomLevel, false));
    BlocProvider.of<MapBloc>(mc).add(DirectionLinesEvent(outdoorPathService.getPolylines()));
    revealPanel();
    return InstructionState(newInstruction, outdoorPathService.getRoute());
  }
}

class NextInstructionEvent extends DirectionsEvent {
  NextInstructionEvent();

  @override
  Future<DirectionsState> createState() async {
    Direction newInstruction = await outdoorPathService.getNextInstruction();
    BlocProvider.of<MapBloc>(mc)
        .add(MoveCameraEvent(newInstruction.coordinate, concordia_constants.navZoomLevel, false));
    return InstructionState(newInstruction, _state.directionsList);
  }
}

class PreviousInstructionEvent extends DirectionsEvent {
  PreviousInstructionEvent();

  @override
  Future<DirectionsState> createState() async {
    Direction newInstruction = await outdoorPathService.getPreviousInstruction();
    BlocProvider.of<MapBloc>(mc)
        .add(MoveCameraEvent(newInstruction.coordinate, concordia_constants.navZoomLevel, false));
    return InstructionState(newInstruction, _state.directionsList);
  }
}
