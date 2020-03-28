import 'package:concordia_go/models/direction_handler.dart';
import 'package:concordia_go/models/direction_request.dart';

class DifferentBuildingDirectionHandler implements DirectionHandler {
  DirectionHandler _nextHandler;

  @override
  void setNext(DirectionHandler handler) {
    _nextHandler = handler;
  }

  @override
  void handle(DirectionRequest request) {
    if (canHandle(request)) {
      // TODO: implement the process of outdoor direction handling
    } else {
      _nextHandler.handle(request);
    }
  }

  /// Returns `true` if the request involves directions from rooms in different buildings.
  @override
  bool canHandle(DirectionRequest request) {
    return (request.source.isIndoor() && request.destination.isIndoor()) &&
        (request.source.building.code != request.destination.building.code);
  }
}
