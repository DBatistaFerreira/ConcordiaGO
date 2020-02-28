import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:concordia_go/services/OutdoorPathService.dart';
import 'package:concordia_go/utilities/Direction.dart';
import 'package:concordia_go/widgets/screens/home_screen.dart';
import './bloc.dart';
import 'package:concordia_go/widgets/component/google_maps_component.dart';

class DirectionsUiBloc extends Bloc<DirectionsUiEvent, DirectionsUiState> {
  @override
  DirectionsUiState get initialState => InitialDirectionsUiState();

  @override
  Stream<DirectionsUiState> mapEventToState(
    DirectionsUiEvent event,
  ) async* {
    if (event is FirstDirection) {
      Direction newDirection = OutdoorPathService.returnFirstInstruction();
      revealPanel();
      await moveCameraPosition(newDirection.point);
      yield DirectionsUiUpdate(newDirection, OutdoorPathService.returnRoute());
    } else if (event is NextDirection) {
      Direction newDirection = OutdoorPathService.returnNextInstruction();
      await moveCameraPosition(newDirection.point);
      yield DirectionsUiUpdate(newDirection, OutdoorPathService.returnRoute());
    } else if (event is PreviousDirection) {
      Direction newDirection = OutdoorPathService.returnPreviousInstruction();
      await moveCameraPosition(newDirection.point);
      yield DirectionsUiUpdate(newDirection, OutdoorPathService.returnRoute());
    }
  }
}
