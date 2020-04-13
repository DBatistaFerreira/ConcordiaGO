import 'package:concordia_go/models/direction_handler.dart';
import 'package:concordia_go/models/direction_request.dart';
import 'package:concordia_go/models/graph.dart';
import 'package:concordia_go/models/node.dart';
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
      final String buildingCode = request.source.building.code + request.source.floor;

      final Graph graph = Graph(buildingCode, cc.edges[buildingCode], cc.edge_indices[buildingCode]);
      graph.setNodesFromEdgeIndices(cc.edge_indices[buildingCode]);

      final DShortestPath algorithm = DShortestPath(graph, request.source.node, request.destination.node);

      final List<Node> shortestPath = algorithm.calcShortestPath();

      Navigator.pushNamed(mapContext, '/indoormap');
      BlocProvider.of<MapBloc>(mapContext).add(FloorChange(request.source.building.code, request.source.floor,
          <String, List<Node>>{request.source.floor: shortestPath}));
    } else {
      _nextHandler.handle(request);
    }
  }

  /// Returns `true` if the request involves directions from two rooms on the same floor of a building.
  @override
  bool canHandle(DirectionRequest request) {
    return (request.source.isIndoor() && request.destination.isIndoor()) &&
            (request.source.building.code == request.destination.building.code) &&
            (request.source.floor == request.destination.floor) ||
        request.destination.isIndoorHotspot();
  }
}
