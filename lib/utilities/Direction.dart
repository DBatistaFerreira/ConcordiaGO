import 'package:google_maps_flutter/google_maps_flutter.dart';

enum ModeOfTransport { walking, transit, driving }
enum IconType { left, right, compass, walk, bus, subway, generic }

class Direction {
  String instruction;
  String distance;
  String arrival_time;
  LatLng point;
  ModeOfTransport transitType;
  IconType icons;
  String destination;

  Direction(this.instruction, this.point, this.transitType, this.distance, this.arrival_time, this.destination) {
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);

    instruction = instruction.replaceAll(exp, '');
    instruction = instruction.replaceAll('Destination', ". Destination");

    if (instruction.contains('Turn left')) {
      icons = IconType.left;
    } else if (instruction.contains('Turn right')) {
      icons = IconType.right;
    } else if (instruction.contains('Head')) {
      icons = IconType.compass;
    } else if (instruction.contains('Walk')) {
      icons = IconType.walk;
    } else if (instruction.contains('Bus')) {
      icons = IconType.bus;
    } else if (instruction.contains('Subway')) {
      icons = IconType.subway;
    } else {
      icons = IconType.generic;
    }
  }
}
