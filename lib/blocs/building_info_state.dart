import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meta/meta.dart';

@immutable
abstract class BuildingInfoState {
  const BuildingInfoState();
}

class InitialBuildingInfoState extends BuildingInfoState {}

class BuildingInfo extends BuildingInfoState {
  final String buildingName;
  final String campus;
  final String address;
  final LatLng coordinates;
  final bool expandHours;
  final bool fromToggle;

  const BuildingInfo(this.buildingName, this.campus, this.address, this.coordinates, this.expandHours, this.fromToggle);

  BuildingInfo toggleHours(bool expandHours) {
    return BuildingInfo(this.buildingName, this.campus, this.address, this.coordinates, expandHours, true);
  }
}
