import 'package:concordia_go/models/direction_handler.dart';
import 'package:concordia_go/models/direction_request.dart';

class SameFloorDirectionHandler implements DirectionHandler {
  @override
  void handle(DirectionRequest request) {
    // TODO: implement handle
  }

  @override
  void setNext(DirectionHandler handler) {
    // TODO: implement setNext
  }

  /// Returns `true` if the request's source building is equal to the destination building.
  bool isSameFloor(DirectionRequest request){
    return request.isEqual(request.getBuildingSource(), request.getBuildingDestination());
  }
}
