part of 'building_info_bloc.dart';

@immutable
abstract class BuildingInfoState {
  const BuildingInfoState();
}

class InitialBuildingInfoState extends BuildingInfoState {}

class ConcordiaBuildingInfoState extends BuildingInfoState {
  const ConcordiaBuildingInfoState(this._building, this._moreInfo);

  final ConcordiaBuilding _building;
  final bool _moreInfo;

  ConcordiaBuilding get building => _building;

  bool get moreInfo => _moreInfo;
}

class ConcordiaRoomInfoState extends BuildingInfoState {
  const ConcordiaRoomInfoState(this._building, this._floor, this._room);

  final ConcordiaBuilding _building;
  final String _floor;
  final String _room;

  ConcordiaBuilding get building => _building;

  String get floor => _floor;

  String get room => _room;
}
