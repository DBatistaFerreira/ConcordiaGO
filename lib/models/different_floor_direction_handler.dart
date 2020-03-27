import 'package:concordia_go/models/direction_handler.dart';
import 'package:concordia_go/models/direction_request.dart';
import 'package:concordia_go/models/shortest_path.dart';
import 'package:concordia_go/models/graph.dart';
import 'package:concordia_go/models/node.dart';
import 'package:concordia_go/utilities/concordia_constants.dart' as cc;

class DifferentFloorDirectionHandler implements DirectionHandler {

  DirectionHandler _next_handler;

  @override
  void setNext(DirectionHandler handler) {
    _next_handler = handler;
  }

  @override
  void handle(DirectionRequest request) {
    if(canHandle(request)){
      var source_building_code = request.source.building.code + request.source.floor;
      var destination_building_code = request.destination.building.code + request.destination.floor;

      var source_graph = Graph(source_building_code, cc.edges[source_building_code], cc.edge_indices[source_building_code]);
      source_graph.setNodesFromEdgeIndices(cc.edge_indices[source_building_code]);

      var destination_graph = Graph(destination_building_code, cc.edges[destination_building_code], cc.edge_indices[destination_building_code]);
      destination_graph.setNodesFromEdgeIndices(cc.edge_indices[destination_building_code]);

      var escalator_node;
      if(int.parse(request.source.floor) > int.parse(request.destination.floor)){
        escalator_node = Node('130000');
      }
      else {
        escalator_node = Node('130001');
      }

      var source_algorithm = DShortestPath(source_graph, request.source.node, escalator_node);
      var destination_algorithm = DShortestPath(destination_graph, escalator_node, request.destination.node);

      var source_shortest_path = source_algorithm.calcShortestPath();
      var destination_shortest_path = destination_algorithm.calcShortestPath();

      // TODO: implement passing of shortest path to indoor directions view and draw path on SVG
    }
    else{
      _next_handler.handle(request);
    }
  }

  /// Returns `true` if the request involves directions between rooms in the same building but on different floors.
  @override
  bool canHandle(DirectionRequest request) {
    return (request.source.isIndoor() && request.destination.isIndoor())
        && (request.source.building.code == request.destination.building.code)
        && (request.source.floor != request.destination.floor);
  }
}
