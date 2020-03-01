import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:concordia_go/utilities/concordia_constants.dart' as concordia_constants;
import '../bloc.dart';

class BuildingInfoBloc extends Bloc<BuildingInfoEvent, BuildingInfoState> {
  @override
  BuildingInfoState get initialState => InitialBuildingInfoState();

  @override
  Stream<BuildingInfoState> mapEventToState(
    BuildingInfoEvent event,
  ) async* {
    if (event is ConcordiaBuildingInfo) {
      var name = concordia_constants.buildings[event.buildingCode].name;
      var campus = concordia_constants.buildings[event.buildingCode].campusString();
      var coordinates = concordia_constants.buildings[event.buildingCode].coordinates;
      var address = concordia_constants.buildings[event.buildingCode].address;
      var hours = concordia_constants.buildings[event.buildingCode].hours;

      yield BuildingInfo(
        event.buildingCode,
        name,
        campus,
        address,
        coordinates,
        hours,
        false,
        false,
      );
    } else if (event is ToggleHoursEvent) {
      yield (state as BuildingInfo).toggleHours(event.expandHours);
    }
  }
}
