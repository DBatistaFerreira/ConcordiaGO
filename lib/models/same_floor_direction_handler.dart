import 'package:concordia_go/models/direction_handler.dart';
import 'package:concordia_go/models/direction_request.dart';

class SameFloorDirectionHandler implements DirectionHandler {

  DirectionHandler _next_handler;

  @override
  void setNext(DirectionHandler handler) {
    _next_handler = handler;
  }

  @override
  void handle(DirectionRequest request) {
    if(canHandle(request)){
      // TODO: implement the process of same floor direction handling
      
    }
    else{
      _next_handler.handle(request);
    }
  }

  /// Returns `true` if the request involves directions from two rooms on the same floor of a building.
  @override
  bool canHandle(DirectionRequest request) {
    return (request.source.isIndoor() && request.destination.isIndoor())
        && (request.source.building == request.destination.building)
        && (request.source.floor == request.destination.floor);
  }
}
