import 'package:concordia_go/models/direction_handler.dart';
import 'package:concordia_go/models/direction_request.dart';

class DifferentFloorDirectionHandler implements DirectionHandler {

  DirectionHandler _next_handler;

  @override
  void setNext(DirectionHandler handler) {
    _next_handler = handler;
  }

  @override
  void handle(DirectionRequest request) {
    if(_isDifferentFloor(request)){
      // TODO: implement the process of different floor direction handling
    }
    else{
      _next_handler.handle(request);
    }
  }

  /// Returns `true` if the request involves directions between rooms in the same building but on different floors.
  bool _isDifferentFloor(DirectionRequest request){
    return (request.source.isIndoor() && request.destination.isIndoor())
        && (request.source.building == request.destination.building)
        && (request.source.floor != request.destination.floor);
  }
}
