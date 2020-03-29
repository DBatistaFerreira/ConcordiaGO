import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:concordia_go/models/concordia_building.dart';
import 'package:flutter/material.dart';
import 'package:concordia_go/utilities/concordia_constants.dart' as concordia_constants;

part 'building_info_event.dart';
part 'building_info_state.dart';

class BuildingInfoBloc extends Bloc<BuildingInfoEvent, BuildingInfoState> {
  @override
  BuildingInfoState get initialState => InitialBuildingInfoState();

  @override
  Stream<BuildingInfoState> mapEventToState(
    BuildingInfoEvent event,
  ) async* {
    yield event.createState();
  }
}
