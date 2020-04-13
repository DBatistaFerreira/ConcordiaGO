import 'package:concordia_go/blocs/bloc.dart';
import 'package:concordia_go/models/direction_handler.dart';
import 'package:concordia_go/models/direction_request.dart';
import 'package:concordia_go/models/shortest_path.dart';
import 'package:concordia_go/models/graph.dart';
import 'package:concordia_go/models/node.dart';
import 'package:concordia_go/services/shared_preferences_service.dart';
import 'package:concordia_go/utilities/concordia_constants.dart' as cc;
import 'package:concordia_go/widgets/component/google_maps_component.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DifferentFloorDirectionHandler implements DirectionHandler {
  DirectionHandler _nextHandler;

  @override
  void setNext(DirectionHandler handler) {
    _nextHandler = handler;
  }

  @override
  void handle(DirectionRequest request) {
    if (canHandle(request)) {
      final String sourceBuildingCode = request.source.building.code + request.source.floor;
      final String destinationBuildingCode = request.destination.building.code + request.destination.floor;

      final Graph sourceGraph =
          Graph(sourceBuildingCode, cc.edges[sourceBuildingCode], cc.edge_indices[sourceBuildingCode]);
      sourceGraph.setNodesFromEdgeIndices(cc.edge_indices[sourceBuildingCode]);

      final Graph destinationGraph =
          Graph(destinationBuildingCode, cc.edges[destinationBuildingCode], cc.edge_indices[destinationBuildingCode]);
      destinationGraph.setNodesFromEdgeIndices(cc.edge_indices[destinationBuildingCode]);

      Node floorChangerNode;
      if (SharedPreferencesService.prioritizeElevators) {
        floorChangerNode = Node('130000');
      } else {
        if (int.parse(request.source.floor) > int.parse(request.destination.floor)) {
          floorChangerNode = Node('120000');
        } else {
          floorChangerNode = Node('120001');
        }
      }

      final DShortestPath sourceAlgorithm = DShortestPath(sourceGraph, request.source.node, floorChangerNode);
      final DShortestPath destinationAlgorithm =
          DShortestPath(destinationGraph, floorChangerNode, request.destination.node);

      final List<Node> sourceShortestPath = sourceAlgorithm.calcShortestPath();
      final List<Node> destinationShortestPath = destinationAlgorithm.calcShortestPath();

      Navigator.pushNamed(mapContext, '/indoormap');
      BlocProvider.of<MapBloc>(mapContext).add(FloorChange(
          request.source.building.code, request.source.floor, <String, List<Node>>{
        request.source.floor: sourceShortestPath,
        request.destination.floor: destinationShortestPath
      }));
    } else {
      _nextHandler.handle(request);
    }
  }

  /// Returns `true` if the request involves directions between rooms in the same building but on different floors.
  @override
  bool canHandle(DirectionRequest request) {
    return (request.source.isIndoor() && request.destination.isIndoor()) &&
        (request.source.building.code == request.destination.building.code) &&
        (request.source.floor != request.destination.floor);
  }
}
