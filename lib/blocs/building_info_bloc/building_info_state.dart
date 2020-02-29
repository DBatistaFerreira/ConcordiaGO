import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meta/meta.dart';

@immutable
abstract class BuildingInfoState {
  const BuildingInfoState();
}

class InitialBuildingInfoState extends BuildingInfoState {}

class BuildingInfo extends BuildingInfoState {
  final String buildingCode;
  final String buildingName;
  final String campus;
  final String address;
  final LatLng coordinates;
  final Map<String, String> hours;
  final bool expandHours;
  final bool fromToggle;

  const BuildingInfo(
    this.buildingCode,
    this.buildingName,
    this.campus,
    this.address,
    this.coordinates,
    this.hours,
    this.expandHours,
    this.fromToggle,
  );

  BuildingInfo toggleHours(bool expandHours) {
    return BuildingInfo(
      this.buildingCode,
      this.buildingName,
      this.campus,
      this.address,
      this.coordinates,
      this.hours,
      expandHours,
      true,
    );
  }

  @override
  String toString() {
    return 'BuildingInfo{buildingCode: $buildingCode, buildingName: $buildingName, campus: $campus, address: $address, coordinates: $coordinates, hours: $hours, expandHours: $expandHours, fromToggle: $fromToggle}';
  }
}
