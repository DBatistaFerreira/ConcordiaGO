import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meta/meta.dart';

@immutable
abstract class BuildingInfoState {
  const BuildingInfoState();
}

class InitialBuildingInfoState extends BuildingInfoState {}

class BuildingInfoSheet extends BuildingInfoState {
  final String buildingName;
  final String campus;
  final String address;
  final LatLng coordinates;

  const BuildingInfoSheet(this.buildingName, this.campus, this.address, this.coordinates);
}
