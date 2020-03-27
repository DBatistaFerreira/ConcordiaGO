import 'package:concordia_go/models/direction_handler.dart';
import 'package:concordia_go/models/direction_object.dart';
import 'package:concordia_go/models/direction_request.dart';

class OutdoorDirectionHandler implements DirectionHandler {

  DirectionHandler _next_handler;

  @override
  void setNext(DirectionHandler handler) {
    _next_handler = handler;
  }

  @override
  void handle(DirectionRequest request) {
    if(_isOutdoor(request)){

      // TODO: implement the process of outdoor direction handling
    }
    else{
      _next_handler.handle(request);
    }
  }

  bool _isOutdoor(DirectionRequest request){
    // TODO: implement checks to determine if request is outdoor direction
  }
}
