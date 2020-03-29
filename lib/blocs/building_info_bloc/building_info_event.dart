import 'package:concordia_go/blocs/bloc.dart';
import 'package:concordia_go/blocs/building_info_bloc/building_info_state.dart';
import 'package:meta/meta.dart';
import 'package:concordia_go/utilities/concordia_constants.dart'
    as concordia_constants;

@immutable
abstract class BuildingInfoEvent {
  const BuildingInfoEvent();

  BuildingInfoState createState();
}

class ConcordiaBuildingInfoEvent extends BuildingInfoEvent {
  final String _buildingCode;
  final bool _moreInfo;

  const ConcordiaBuildingInfoEvent(this._buildingCode, this._moreInfo);

  @override
  BuildingInfoState createState() {
    return ConcordiaBuildingInfoState(
        concordia_constants.buildings[_buildingCode], _moreInfo);
  }
}

class ConcordiaRoomInfoEvent extends BuildingInfoEvent {
  final String _room;
  final String _floor;
  final String _buildingCode;

  const ConcordiaRoomInfoEvent(this._buildingCode, this._floor, this._room);

  @override
  BuildingInfoState createState() {
    return ConcordiaRoomInfoState(concordia_constants.buildings[_buildingCode], _floor, _room);
  }
}
