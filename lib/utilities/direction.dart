import 'package:google_maps_flutter/google_maps_flutter.dart';

enum ModeOfTransport { walking, transit, driving, shuttle }
enum IconType { left, right, compass, fork, merge, walk, bus, subway, generic }

class Direction {
  String instruction;
  String distance;
  String arrivalTime;
  LatLng coordinate;
  ModeOfTransport transitType;
  IconType icons;
  String destination;

  Direction(this.instruction, this.coordinate, this.transitType, this.distance,
      this.arrivalTime, this.destination) {
    var exp = RegExp(r'<[^>]*>', multiLine: true, caseSensitive: true);

    instruction = instruction.replaceAll(exp, '');
    instruction = instruction.replaceAll('Destination', '. Destination');

    if (instruction.contains('Turn left')) {
      icons = IconType.left;
    } else if (instruction.contains('Turn right')) {
      icons = IconType.right;
    } else if (instruction.contains('Head')) {
      icons = IconType.compass;
    } else if (instruction.contains('at the fork')) {
      icons = IconType.fork;
    } else if (instruction.contains('Merge')) {
      icons = IconType.merge;
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
