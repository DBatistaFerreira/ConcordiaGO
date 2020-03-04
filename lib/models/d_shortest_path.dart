import 'graph.dart';
import 'node.dart';

class DShortestPath {
  Graph _graph;
  Node _source;
  Node _destination;
  int _distance;
  // List<Node> shortest_path

  // region constructors
  DShortestPath(Graph graph, Node source, Node destination) {
    _graph = graph;
    _source = source;
    _destination = destination;
    _distance = 0;
  }
  // endregion constructors

  // region getters
  // TODO: implement all getter methods
  Graph getGraph() {
    return _graph;
  }

  Node getSource() {
    return _source;
  }

  Node getDestination() {
    return _destination;
  }

  int getDistance() {
    return _distance;
  }
  // endregion getters

  // region setters
  // TODO: implement all setter methods
  void setGraph(Graph graph) {
    _graph = graph;
  }

  void setSource(Node source) {
    _source = source;
  }

  void setDestination(Node destination) {
    _destination = destination;
  }

  void setDistance(int distance) {
    _distance = distance;
  }
  // endregion setters

  // region functions
  /*
  TODO: implement calcShortestPath() algorithm
  returns the shortest path as a list of nodes
   */
  // endregion functions
}
