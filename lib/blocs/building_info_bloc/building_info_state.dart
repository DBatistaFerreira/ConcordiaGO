import 'package:concordia_go/models/concordia_building_model.dart';
import 'package:meta/meta.dart';

@immutable
abstract class BuildingInfoState {
  const BuildingInfoState();
}

class InitialBuildingInfoState extends BuildingInfoState {}

class ConcordiaBuildingInfoState extends BuildingInfoState {
  final ConcordiaBuilding _building;
  final bool _expandHours;

  const ConcordiaBuildingInfoState(this._building, this._expandHours);

  ConcordiaBuilding get building => _building;

  bool get expandHours => _expandHours;
}
