import 'package:concordia_go/utilities/direction.dart';
import 'package:concordia_go/utilities/segment.dart';

class Journey {
  Journey() {
    instructionCount = 0;
    routeSegments = <Segment>[];
    instructionCount++;
  }

  List<Segment> routeSegments;
  int instructionCount;

  void addSegment(Segment newSegment) {
    routeSegments.add(newSegment);
    instructionCount++;
  }

  void resetList() {
    routeSegments.clear();
  }

  List<Direction> toDirection() {
    final List<Direction> routeDirections = <Direction>[];
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
}
