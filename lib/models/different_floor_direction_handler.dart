import 'package:concordia_go/models/direction_handler.dart';
import 'package:concordia_go/models/direction_request.dart';

class DifferentFloorDirectionHandler implements DirectionHandler {
  @override
  void handle(DirectionRequest request) {
    // TODO: implement handle
  }

  @override
  void setNext(DirectionHandler handler) {
    // TODO: implement setNext
  }

  bool _isDifferentFloor(DirectionRequest request){
    return (request.isEqual(request.getBuildingCode(0), request.getBuildingCode(1)))
        && (!request.isEqual(request.getBuildingFloor(0), request.getBuildingFloor(1)));
  }
}
