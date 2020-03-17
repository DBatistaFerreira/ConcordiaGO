import 'package:concordia_go/blocs/bloc.dart';
import 'package:meta/meta.dart';
import 'package:concordia_go/utilities/concordia_constants.dart' as concordia_constants;

@immutable
abstract class BuildingInfoEvent {
  const BuildingInfoEvent();

  BuildingInfoState createState();
}

class ConcordiaBuildingInfo extends BuildingInfoEvent {
  final String _buildingCode;
  final bool _expandHours;

  const ConcordiaBuildingInfo(this._buildingCode, this._expandHours);

  @override
  BuildingInfoState createState() {
    var name = concordia_constants.buildings[_buildingCode].name;
    var campus = concordia_constants.buildings[_buildingCode].campusString();
    var coordinates = concordia_constants.buildings[_buildingCode].coordinates;
    var address = concordia_constants.buildings[_buildingCode].address;
    var hours = concordia_constants.buildings[_buildingCode].hours;

    return BuildingInfo(
      _buildingCode,
      name,
      campus,
      address,
      coordinates,
      hours,
      _expandHours,
    );
  }
}
