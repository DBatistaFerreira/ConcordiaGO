import 'package:google_maps_flutter/google_maps_flutter.dart';

enum modeOfTransport { walking, transit, driving }

class Direction {
  String instruction;
  LatLng point;
  modeOfTransport transitType;

  Direction(this.instruction, this.point, this.transitType) {
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);

    this.instruction = this.instruction.replaceAll(exp, '');
    this.instruction = this.instruction.replaceAll('Destination', ". Destination");
  }

  void printDirection() {
    print(this.instruction);
  }
}
