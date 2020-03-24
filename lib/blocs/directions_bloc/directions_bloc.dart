import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:concordia_go/services/outdoor_path_service.dart';
import 'package:concordia_go/utilities/direction.dart';
import 'package:concordia_go/utilities/concordia_constants.dart' as concordia_constants;
import 'package:concordia_go/widgets/screens/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc.dart';

class DirectionsBloc extends Bloc<DirectionsEvent, DirectionsState> {
  @override
  DirectionsState get initialState => InitialDirectionsState();

  @override
  Stream<DirectionsState> mapEventToState(
    DirectionsEvent event,
  ) async* {
    Direction newInstruction;
    if (event is GetDirectionsEvent) {
      await OutdoorPathService.transitDirections(event.startCoordinates.latitude, event.startCoordinates.longitude,
          event.endCoordinates.latitude, event.endCoordinates.longitude, event.destination);

      newInstruction = OutdoorPathService.getFirstInstruction();
      BlocProvider.of<MapBloc>(mc).add(MoveCameraEvent(newInstruction.coordinate, concordia_constants.navZoomLevel));
      BlocProvider.of<MapBloc>(mc).add(DirectionLinesEvent(OutdoorPathService.getPolylines()));
      revealPanel();
      yield InstructionState(newInstruction, OutdoorPathService.getRoute());
    } else if (event is NextInstructionEvent) {
      newInstruction = OutdoorPathService.getNextInstruction();
      BlocProvider.of<MapBloc>(mc).add(MoveCameraEvent(newInstruction.coordinate, concordia_constants.navZoomLevel));
      yield InstructionState(newInstruction, (state as InstructionState).directionsList);
    } else if (event is PreviousInstructionEvent) {
      newInstruction = OutdoorPathService.getPreviousInstruction();
      BlocProvider.of<MapBloc>(mc).add(MoveCameraEvent(newInstruction.coordinate, concordia_constants.navZoomLevel));
      yield InstructionState(newInstruction, (state as InstructionState).directionsList);
    }
  }
}
