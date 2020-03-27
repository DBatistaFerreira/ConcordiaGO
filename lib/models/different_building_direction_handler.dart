import 'package:concordia_go/models/direction_handler.dart';
import 'package:concordia_go/models/direction_request.dart';

class DifferentBuildingDirectionHandler implements DirectionHandler {

  DirectionHandler _next_handler;

  @override
  void setNext(DirectionHandler handler) {
    _next_handler = handler;
  }

  @override
  void handle(DirectionRequest request) {
    if(_isDifferentBuilding(request)){
      // TODO: implement the process of outdoor direction handling
    }
    else{
      _next_handler.handle(request);
    }
  }

  /// Returns `true` if the request involves directions from rooms in different buildings.
  bool _isDifferentBuilding(DirectionRequest request){
    return (!request.isEqual(request.getBuildingCode(0), request.getBuildingCode(1)));
  }
}
