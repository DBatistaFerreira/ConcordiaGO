import 'package:concordia_go/utilities/direction.dart';
import 'package:concordia_go/utilities/segment.dart';

class Journey {
  List<Segment> routeSegments;
  int instructionCount;

  Journey() {
    instructionCount = 0;
    routeSegments = <Segment>[];
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
    var routeDirections = <Direction>[];
    for (var i = 0; i < routeSegments.length; i++) {
      if (routeSegments[i].mainDirective.transitType ==
          ModeOfTransport.transit) {
        routeDirections.add(routeSegments[i].mainDirective);
      }
      for (var j = 0; j < routeSegments[i].substeps.length; j++) {
        routeDirections.add(routeSegments[i].substeps[j]);
      }
    }
    return routeDirections;
  }

}
