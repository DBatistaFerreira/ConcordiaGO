import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:concordia_go/services/OutdoorPathService.dart';
import 'package:concordia_go/utilities/Direction.dart';
import 'package:flutter/cupertino.dart';
import './bloc.dart';

class DirectionsUiBloc extends Bloc<DirectionsUiEvent, DirectionsUiState> {
  @override
  DirectionsUiState get initialState => InitialDirectionsUiState();

  @override
  Stream<DirectionsUiState> mapEventToState(
    DirectionsUiEvent event,
  ) async* {
    if (event is FirstDirection) {
      debugPrint('received first');
      Direction newDirection = OutdoorPathService.returnFirstInstruction();
      debugPrint(newDirection.toString());
      debugPrint('yield first');
      yield DirectionsUiUpdate(newDirection);
    } else if (event is NextDirection) {
      debugPrint('received next');
      Direction newDirection = OutdoorPathService.returnNextInstruction();
      debugPrint('yield next');
      yield DirectionsUiUpdate(newDirection);
    } else if (event is PreviousDirection) {
      debugPrint('received previous');
      Direction newDirection = OutdoorPathService.returnPreviousInstruction();
      debugPrint('yield previous');
      yield DirectionsUiUpdate(newDirection);
    }
  }
}
