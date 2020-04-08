part of 'directions_bloc.dart';

abstract class DirectionsEvent {
  DirectionsEvent();

  InstructionState _state;

  set state(InstructionState value) {
    _state = value;
  }

  Future<DirectionsState> createState(OutdoorPathService outdoorPathService);
}

class GetDirectionsEvent extends DirectionsEvent {
  GetDirectionsEvent(this._startCoordinates, this._endCoordinates, this._destination, this._modeOfTransport);

  final LatLng _startCoordinates;
  final LatLng _endCoordinates;
  final String _destination;
  final ModeOfTransport _modeOfTransport;

  @override
  Future<DirectionsState> createState(OutdoorPathService outdoorPathService) async {
    await outdoorPathService.getDirections(
      _startCoordinates.latitude,
      _startCoordinates.longitude,
      _endCoordinates.latitude,
      _endCoordinates.longitude,
      _destination,
      _modeOfTransport,
    );

    final Direction newInstruction = outdoorPathService.getFirstInstruction();
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
  Future<DirectionsState> createState(OutdoorPathService outdoorPathService) async {
    final bool moveCamera = !outdoorPathService.isLastInstruction();
    final Direction newInstruction = outdoorPathService.getNextInstruction();
    if (moveCamera) {
      BlocProvider.of<MapBloc>(mc)
          .add(MoveCameraEvent(newInstruction.coordinate, concordia_constants.navZoomLevel, false));
    }
    return InstructionState(newInstruction, _state.directionsList);
  }
}

class PreviousInstructionEvent extends DirectionsEvent {
  PreviousInstructionEvent();

  @override
  Future<DirectionsState> createState(OutdoorPathService outdoorPathService) async {
    final Direction newInstruction = outdoorPathService.getPreviousInstruction();
    BlocProvider.of<MapBloc>(mc)
        .add(MoveCameraEvent(newInstruction.coordinate, concordia_constants.navZoomLevel, false));
    return InstructionState(newInstruction, _state.directionsList);
  }
}
