part of 'building_info_bloc.dart';

@immutable
abstract class BuildingInfoEvent {
  const BuildingInfoEvent();

  BuildingInfoState createState();
}

class ConcordiaBuildingInfoEvent extends BuildingInfoEvent {
  const ConcordiaBuildingInfoEvent(this._buildingCode, this._moreInfo);

  final String _buildingCode;
  final bool _moreInfo;

  @override
  BuildingInfoState createState() {
    return ConcordiaBuildingInfoState(concordia_constants.buildings[_buildingCode], _moreInfo);
  }
}

class ConcordiaRoomInfoEvent extends BuildingInfoEvent {
  const ConcordiaRoomInfoEvent(this._buildingCode, this._floor, this._room);

  final String _room;
  final String _floor;
  final String _buildingCode;

  @override
  BuildingInfoState createState() {
    return ConcordiaRoomInfoState(concordia_constants.buildings[_buildingCode], _floor, _room);
  }
}
