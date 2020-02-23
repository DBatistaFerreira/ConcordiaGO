import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:concordia_go/utilities/concordia_constants.dart' as concordia_constants;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import './bloc.dart';

class BuildingInfoBloc extends Bloc<BuildingInfoEvent, BuildingInfoState> {
  @override
  BuildingInfoState get initialState => InitialBuildingInfoState();

  @override
  Stream<BuildingInfoState> mapEventToState(
    BuildingInfoEvent event,
  ) async* {
    if (event is ConcordiaBuildingInfo) {
      String name = concordia_constants.buildings[event.buildingCode]['name'];
      String campus = concordia_constants.buildings[event.buildingCode]['campus'];
      LatLng coordinates = concordia_constants.buildings[event.buildingCode]['coordinates'];
      String address = concordia_constants.buildings[event.buildingCode]['address'];

      yield BuildingInfo(name, campus, address, coordinates, false);
    } else if (event is ToggleHoursEvent) {
      yield (state as BuildingInfo).toggleHours(event.expandHours);
    }
  }
}
