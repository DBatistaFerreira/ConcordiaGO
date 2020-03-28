import 'package:concordia_go/models/direction_handler.dart';
import 'package:concordia_go/models/direction_request.dart';
import 'package:concordia_go/models/graph.dart';
import 'package:concordia_go/models/shortest_path.dart';
import 'package:concordia_go/utilities/concordia_constants.dart' as cc;
import 'package:concordia_go/widgets/component/google_maps_component.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:concordia_go/blocs/bloc.dart';

class SameFloorDirectionHandler implements DirectionHandler {
  DirectionHandler _nextHandler;

  @override
  void setNext(DirectionHandler handler) {
    _nextHandler = handler;
  }

  @override
  void handle(DirectionRequest request) {
    if (canHandle(request)) {
      var building_code = request.source.building.code + request.source.floor;

      var graph = Graph(building_code, cc.edges[building_code], cc.edge_indices[building_code]);
      graph.setNodesFromEdgeIndices(cc.edge_indices[building_code]);

      var algorithm = DShortestPath(graph, request.source.node, request.destination.node);

      var shortest_path = algorithm.calcShortestPath();

      Navigator.pushNamed(mapContext, '/indoormap');
      BlocProvider.of<MapBloc>(mapContext).add(
          FloorChange(request.source.building.code,request.source.floor,{request.source.floor:shortest_path}));

    } else {
      _nextHandler.handle(request);
    }
  }

  /// Returns `true` if the request involves directions from two rooms on the same floor of a building.
  @override
  bool canHandle(DirectionRequest request) {
    return (request.source.isIndoor() && request.destination.isIndoor()) &&
        (request.source.building.code == request.destination.building.code) &&
        (request.source.floor == request.destination.floor);
  }
}
