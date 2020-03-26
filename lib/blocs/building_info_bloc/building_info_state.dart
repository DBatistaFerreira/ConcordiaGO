import 'package:concordia_go/models/concordia_building_model.dart';
import 'package:meta/meta.dart';

@immutable
abstract class BuildingInfoState {
  const BuildingInfoState();
}

class InitialBuildingInfoState extends BuildingInfoState {}

class ConcordiaBuildingInfoState extends BuildingInfoState {
  final ConcordiaBuilding _building;
  final bool _moreInfo;

  const ConcordiaBuildingInfoState(this._building, this._moreInfo);

  ConcordiaBuilding get building => _building;

  bool get moreInfo => _moreInfo;
}

class ConcordiaRoomInfoState extends BuildingInfoState {
  final ConcordiaBuilding _building;
  final String _room;
  final String _floor;

  const ConcordiaRoomInfoState(this._building, this._floor, this._room);

  ConcordiaBuilding get building => _building;
  String get room => _room;
  String get floor => _floor;
}
