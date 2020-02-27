import 'package:google_maps_flutter/google_maps_flutter.dart';

enum modeOfTransport { walking, transit, driving }
enum iconType { left, right, compass, generic }

class Direction {
  String instruction;
  String distance;
  String arrival_time;
  LatLng point;
  modeOfTransport transitType;
  iconType icons;
  String destination;

  Direction(this.instruction, this.point, this.transitType, this.distance, this.arrival_time, this.destination) {
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);

    this.instruction = this.instruction.replaceAll(exp, '');
    this.instruction = this.instruction.replaceAll('Destination', ". Destination");

    if (this.instruction.contains('Turn left')) {
      icons = iconType.left;
    } else if (this.instruction.contains('Turn right')) {
      icons = iconType.right;
    } else if (this.instruction.contains('Head')) {
      icons = iconType.compass;
    } else {
      icons = iconType.generic;
    }
  }
}
