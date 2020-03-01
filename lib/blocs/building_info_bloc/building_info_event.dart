import 'package:meta/meta.dart';

@immutable
abstract class BuildingInfoEvent {
  const BuildingInfoEvent();
}

class ConcordiaBuildingInfo extends BuildingInfoEvent {
  final buildingCode;

  const ConcordiaBuildingInfo(this.buildingCode);
}

class ToggleHoursEvent extends BuildingInfoEvent {
  final bool expandHours;

  const ToggleHoursEvent(this.expandHours);
}
