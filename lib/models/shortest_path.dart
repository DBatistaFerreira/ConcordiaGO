import 'graph.dart';
import 'node.dart';

class DShortestPath {
  Graph _graph;
  Node _source;
  Node _destination;
  int _distance;
  Map<String, Node> _visited;
  Map<String, Node> _unvisited;
  List<Node> _shortest_path;
  List _table;

  // region constructors
  DShortestPath(Graph graph, Node source, Node destination) {
    _graph = graph;
    _source = source;
    _destination = destination;
    _distance = 0;
    _visited = <String, Node>{};
    _unvisited = Map.from(graph.getNodes());
    _shortest_path = <Node>[];
    _table = [];
  }

  DShortestPath.withNothing(){
    _graph = null;
    _source = null;
    _destination = null;
    _distance = 0;
    _visited = <String, Node>{};
    _unvisited = <String, Node>{};
    _shortest_path = <Node>[];
    _table = [];
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

  List<Node> getShortestPath(){
    return _shortest_path;
  }

  List getTable(){
    return _table;
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

  void setShortestPath(List<Node> shortest_path){
    _shortest_path = shortest_path;
  }

  void setTable(List table){
    _table = table;
  }
  // endregion setters

  // region private functions
  void _fillTable(){
    // set all values in the table to [node, -1, null]
    for(var node in _graph.getNodes().values){
      _table.add([node, -1, null]);
    }
    // set the distance and via values of the source node to 0 and 'source' respectively.
    _table[_graph.getEdgeIndices().indexOf(_source.getId())][1] = 0;
    _table[_graph.getEdgeIndices().indexOf(_source.getId())][2] = _source;
  }

  Node _getTableNode(Node node){
    return _table[_graph.getIndex(node)][0];
  }

  int _getTableDistance(Node node){
    return _table[_graph.getIndex(node)][1];
  }

  Node _getTableVia(Node node){
    return _table[_graph.getIndex(node)][2];
  }

  void _updateTableDistance(Node node, int distance){
    _table[_graph.getIndex(node)][1] = distance;
  }

  void _updateTableVia(Node node, Node via){
    _table[_graph.getIndex(node)][2] = via;
  }

  void _updateVisited(Node node){
    _visited[node.getId()] = _unvisited.remove(node.getId());
  }

  Node _getNextCurrentNode(){
    var candidates = <Node>[];
    for(var row in _table){
      if(row[1] != -1 && !_visited.containsKey(row[0].getId())){
        candidates.add(row[0]);
      }
    }
    if(candidates.isEmpty){
      return null;
    }
    var next = candidates.first;
    for(var node in candidates){
      if(_getTableDistance(node) < _getTableDistance(next)){
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
  List<Node> calcShortestPath(){
    _fillTable();

    _greedyDijkstra();

    _generateNodePathList();

    return _shortest_path;
  }

  void _generateNodePathList() {
    _distance = _getTableDistance(_destination);

    var node = _destination;
    while(!_getTableNode(node).isEqualTo(_source)){
      _shortest_path.insert(0, node);
      node = _getTableVia(node);
    }

    _shortest_path.insert(0, _source);
  }

  void _greedyDijkstra() {
    var current = _source;
    while(_unvisited.isNotEmpty){
      if(current == null){
        break;
      }
      var nodesConnectedToCurrent = _graph.getConnectedNodes(current);
      for(var connected in nodesConnectedToCurrent){
        var distanceFromSource = _getTableDistance(current)
            + _graph.getWeight(current, connected);
        if(_getTableDistance(connected) == -1 || distanceFromSource < _getTableDistance(connected)){
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
