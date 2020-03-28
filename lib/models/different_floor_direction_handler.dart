import 'package:concordia_go/blocs/bloc.dart';
import 'package:concordia_go/models/direction_handler.dart';
import 'package:concordia_go/models/direction_request.dart';
import 'package:concordia_go/models/shortest_path.dart';
import 'package:concordia_go/models/graph.dart';
import 'package:concordia_go/models/node.dart';
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
      var source_building_code = request.source.building.code + request.source.floor;
      var destination_building_code = request.destination.building.code + request.destination.floor;

      var source_graph =
          Graph(source_building_code, cc.edges[source_building_code], cc.edge_indices[source_building_code]);
      source_graph.setNodesFromEdgeIndices(cc.edge_indices[source_building_code]);

      var destination_graph = Graph(
          destination_building_code, cc.edges[destination_building_code], cc.edge_indices[destination_building_code]);
      destination_graph.setNodesFromEdgeIndices(cc.edge_indices[destination_building_code]);

      var escalator_node;
      if (int.parse(request.source.floor) > int.parse(request.destination.floor)) {
        escalator_node = Node('120000');
      } else {
        escalator_node = Node('120001');
      }

      var source_algorithm = DShortestPath(source_graph, request.source.node, escalator_node);
      var destination_algorithm = DShortestPath(destination_graph, escalator_node, request.destination.node);

      var source_shortest_path = source_algorithm.calcShortestPath();
      var destination_shortest_path = destination_algorithm.calcShortestPath();

      // TODO: implement passing of shortest path to indoor directions view and draw path on SVG
      // TODO: implement user interaction for next floor shortest_path

      Navigator.pushNamed(mapContext, '/indoormap');
      BlocProvider.of<MapBloc>(mapContext).add(FloorChange(request.source.building.code, request.source.floor,
          {request.source.floor: source_shortest_path, request.destination.floor: destination_shortest_path}));
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
