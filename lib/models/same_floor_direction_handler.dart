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
    if(_isSameFloor(request)){
      // TODO: implement the process of same floor direction handling
    }
    else{
      _next_handler.handle(request);
    }
  }

  /// Returns `true` if the request's source building is equal to the destination building.
  bool _isSameFloor(DirectionRequest request){
    return request.isEqual(request.getBuildingSource(), request.getBuildingDestination());
  }
}
