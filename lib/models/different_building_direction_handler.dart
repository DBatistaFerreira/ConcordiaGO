import 'package:concordia_go/models/direction_handler.dart';
import 'package:concordia_go/models/direction_object.dart';
import 'package:concordia_go/models/direction_request.dart';
import 'package:concordia_go/models/node.dart';

class DifferentBuildingDirectionHandler implements DirectionHandler {
  DirectionHandler _nextHandler;

  @override
  void setNext(DirectionHandler handler) {
    _nextHandler = handler;
  }

  @override
  void handle(DirectionRequest request) {
    if (canHandle(request)) {
      var exitNode = Node('990000');
      var exitIndoorDobject = Dobject.indoor(exitNode, request.source.building, '1');
      var indoorExitRequest = DirectionRequest(request.source, exitIndoorDobject);

      // TODO: implement indoor request to exit building

      var source_outdoor_dobject = Dobject.building(request.source.building);
      var outdoorRequest = DirectionRequest(source_outdoor_dobject, request.destination);

      // TODO: implement outdoor request to get to destination

    } else {
      _nextHandler.handle(request);
    }
  }

  /// Returns `true` if the request involves directions from rooms in different buildings.
  @override
  bool canHandle(DirectionRequest request) {
    return (_endsIndoor(request) || _endsOutdoor(request));
  }

  bool _endsIndoor(DirectionRequest request) {
    return (request.source.isIndoor() && request.destination.isIndoor()) &&
        (request.source.building.code != request.destination.building.code);
  }

  bool _endsOutdoor(DirectionRequest request) {
    return (request.source.isIndoor() && request.destination.isOutdoor());
  }
}
