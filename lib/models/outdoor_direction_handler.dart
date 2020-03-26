import 'package:concordia_go/models/direction_handler.dart';
import 'package:concordia_go/models/direction_request.dart';

class OutdoorDirectionHandler implements DirectionHandler {

  DirectionHandler _next_handler;

  @override
  void setNext(DirectionHandler handler) {
    _next_handler = handler;
  }

  @override
  void handle(DirectionRequest request) {
    // TODO: implement handle
    
  }
}
