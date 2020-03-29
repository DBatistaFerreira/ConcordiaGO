import 'graph.dart';
import 'node.dart';

class DShortestPath {
  // region constructors
  DShortestPath(Graph graph, Node source, Node destination) {
    _graph = graph;
    _source = source;
    _destination = destination;
    _distance = 0;
    _visited = <String, Node>{};
    _unvisited = Map<String, Node>.from(graph.getNodes());
    _shortestPath = <Node>[];
    _table = <List<dynamic>>[];
  }

  DShortestPath.withNothing() {
    _graph = null;
    _source = null;
    _destination = null;
    _distance = 0;
    _visited = <String, Node>{};
    _unvisited = <String, Node>{};
    _shortestPath = <Node>[];
    _table = <List<dynamic>>[];
  }
  // endregion constructors
  Graph _graph;
  Node _source;
  Node _destination;
  int _distance;
  Map<String, Node> _visited;
  Map<String, Node> _unvisited;
  List<Node> _shortestPath;
  List<List<dynamic>> _table;
  // region getters
  // TODO(Teolis): implement all getter methods
  Graph getGraph() => _graph;

  Node getSource() => _source;

  Node getDestination() => _destination;

  int getDistance() => _distance;

  List<Node> getShortestPath() => _shortestPath;

  List<List<dynamic>> getTable() => _table;
  // endregion getters

  // region setters
  // TODO(Teolis): implement all setter methods
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

  void setShortestPath(List<Node> shortestPath) {
    _shortestPath = shortestPath;
  }

  void setTable(List<List<dynamic>> table) {
    _table = table;
  }
  // endregion setters

  // region private functions
  void _fillTable() {
    // set all values in the table to [node, -1, null]
    for (final Node node in _graph.getNodes().values) {
      _table.add(<dynamic>[node, -1, null]);
    }
    // set the distance and via values of the source node to 0 and 'source' respectively.
    _table[_graph.getEdgeIndices().indexOf(_source.getId())][1] = 0;
    _table[_graph.getEdgeIndices().indexOf(_source.getId())][2] = _source;
  }

  Node _getTableNode(Node node) {
    return _table[_graph.getIndex(node)][0] as Node;
  }

  int _getTableDistance(Node node) {
    return _table[_graph.getIndex(node)][1] as int;
  }

  Node _getTableVia(Node node) {
    return _table[_graph.getIndex(node)][2] as Node;
  }

  void _updateTableDistance(Node node, int distance) {
    _table[_graph.getIndex(node)][1] = distance;
  }

  void _updateTableVia(Node node, Node via) {
    _table[_graph.getIndex(node)][2] = via;
  }

  void _updateVisited(Node node) {
    _visited[node.getId()] = _unvisited.remove(node.getId());
  }

  Node _getNextCurrentNode() {
    final List<Node> candidates = <Node>[];
    for (final dynamic row in _table) {
      if (row[1] != -1 && !_visited.containsKey(row[0].getId())) {
        candidates.add(row[0] as Node);
      }
    }
    if (candidates.isEmpty) {
      return null;
    }
    Node next = candidates.first;
    for (final Node node in candidates) {
      if (_getTableDistance(node) < _getTableDistance(next)) {
        next = node;
      }
    }

    return next;
  }
  // endregion private functions

  // region functions
  /*
  TODO: implement calcShortestPath() algorithm
  returns the shortest path as a list of nodes
   */
  List<Node> calcShortestPath() {
    _fillTable();

    _greedyDijkstra();

    _generateNodePathList();

    return _shortestPath;
  }

  void _generateNodePathList() {
    _distance = _getTableDistance(_destination);

    Node node = _destination;
    while (!_getTableNode(node).isEqualTo(_source)) {
      _shortestPath.insert(0, node);
      node = _getTableVia(node);
    }

    _shortestPath.insert(0, _source);
  }

  void _greedyDijkstra() {
    Node current = _source;
    while (_unvisited.isNotEmpty) {
      if (current == null) {
        break;
      }
      final List<Node> nodesConnectedToCurrent = _graph.getConnectedNodes(current);
      for (final Node connected in nodesConnectedToCurrent) {
        final int distanceFromSource = _getTableDistance(current) + _graph.getWeight(current, connected);
        if (_getTableDistance(connected) == -1 || distanceFromSource < _getTableDistance(connected)) {
          _updateTableDistance(connected, distanceFromSource);
          _updateTableVia(connected, current);
        }
      }
      _updateVisited(current);
      current = _getNextCurrentNode();
    }
  }

  // endregion functions
}
