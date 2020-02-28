import 'package:concordia_go/utilities/Direction.dart';
import 'package:concordia_go/utilities/Segment.dart';

class Journey {
  List<Segment> routeSegments;
  int instructionCount;

  Journey() {
    instructionCount = 0;
    this.routeSegments = List<Segment>();
    instructionCount++;
  }

  void addSegment(Segment newSegment) {
    routeSegments.add(newSegment);
    instructionCount++;
  }

  void resetList() {
    routeSegments.clear();
  }

  List<Direction> toDirection() {
    List<Direction> routeDirections = List<Direction>();
    for (int i = 0; i < routeSegments.length; i++) {
      if (routeSegments[i].mainDirective.transitType == ModeOfTransport.transit) {
        routeDirections.add(routeSegments[i].mainDirective);
      }
      for (int j = 0; j < routeSegments[i].substeps.length; j++) {
        routeDirections.add(routeSegments[i].substeps[j]);
      }
    }
    return routeDirections;
  }

  void printRoute() {
    for (int i = 0; i < routeSegments.length; i++) {
      routeSegments[i].mainDirective.instruction;
      routeSegments[i].mainDirective.icons;
      for (int j = 0; j < routeSegments[i].substeps.length; j++) {
        print("   -" + routeSegments[i].substeps[j].instruction);
        print("   -" + routeSegments[i].substeps[j].icons.toString());
      }
    }
  }
}
