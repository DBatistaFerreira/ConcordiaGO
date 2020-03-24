import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:concordia_go/services/outdoor_path_service.dart';
import 'package:concordia_go/utilities/direction.dart';
import 'package:concordia_go/utilities/concordia_constants.dart' as concordia_constants;
import 'package:concordia_go/widgets/screens/home_screen.dart';
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
    Direction newInstruction;
    if (event is GetDirectionsEvent) {
      await outdoorPathService.nicksMagicalChooserOfDirections(
          event.startCoordinates.latitude,
          event.startCoordinates.longitude,
          event.endCoordinates.latitude,
          event.endCoordinates.longitude,
          event.destination,
          event.modeOfTransport);

      newInstruction = outdoorPathService.getFirstInstruction();
      BlocProvider.of<MapBloc>(mc).add(MoveCameraEvent(newInstruction.coordinate, concordia_constants.navZoomLevel));
      BlocProvider.of<MapBloc>(mc).add(DirectionLinesEvent(outdoorPathService.getPolylines()));
      revealPanel();
      yield InstructionState(newInstruction, outdoorPathService.getRoute());
    } else if (event is NextInstructionEvent) {
      newInstruction = outdoorPathService.getNextInstruction();
      BlocProvider.of<MapBloc>(mc).add(MoveCameraEvent(newInstruction.coordinate, concordia_constants.navZoomLevel));
      yield InstructionState(newInstruction, (state as InstructionState).directionsList);
    } else if (event is PreviousInstructionEvent) {
      newInstruction = outdoorPathService.getPreviousInstruction();
      BlocProvider.of<MapBloc>(mc).add(MoveCameraEvent(newInstruction.coordinate, concordia_constants.navZoomLevel));
      yield InstructionState(newInstruction, (state as InstructionState).directionsList);
    }
  }
}
