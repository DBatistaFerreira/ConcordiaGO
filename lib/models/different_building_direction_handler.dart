import 'package:concordia_go/models/direction_handler.dart';
import 'package:concordia_go/models/direction_object.dart';
import 'package:concordia_go/models/direction_request.dart';
import 'package:concordia_go/models/node.dart';
import 'package:concordia_go/models/graph.dart';
import 'package:concordia_go/models/shortest_path.dart';
import 'package:concordia_go/utilities/concordia_constants.dart' as cc;

class DifferentBuildingDirectionHandler implements DirectionHandler {
  DirectionHandler _nextHandler;

  @override
  void setNext(DirectionHandler handler) {
    _nextHandler = handler;
  }

  @override
  void handle(DirectionRequest request) {
    if (canHandle(request)) {

      var exit_node = Node('990000');
      var exit_indoor_dobject = Dobject.indoor(exit_node, request.source.building, '1');
      var indoor_exit_request = DirectionRequest(request.source, exit_indoor_dobject);

      // TODO: implement indoor request to exit building

      var source_outdoor_dobject = Dobject.building(request.source.building);
      var outdoor_request = DirectionRequest(source_outdoor_dobject, request.destination);
      
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

  bool _endsIndoor(DirectionRequest request){
    return (request.source.isIndoor() && request.destination.isIndoor())
        && (request.source.building.code != request.destination.building.code);
  }

  bool _endsOutdoor(DirectionRequest request){
    return (request.source.isIndoor() && request.destination.isOutdoor());
  }
}
