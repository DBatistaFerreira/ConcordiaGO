import 'node.dart';

/// A weighted graph containing nodes and edges.
class Graph {
  // region constructors
  /// Default constructor to initialize this graph with the values passed.
  Graph(String buildingCode, List<List<int>> edges, List<String> edgeIndices) {
    _buildingCode = buildingCode;
    _nodes = <String, Node>{};
    _edges = edges;
    _edgeIndices = edgeIndices;
  }

  /// Constructor to initialize this graph with empty values for all variables.
  Graph.withNothing() {
    _buildingCode = '';
    _nodes = <String, Node>{};
    _edges = <List<int>>[];
    _edgeIndices = <String>[];
  }

  Graph.withNodes(String buildingCode, Map<String, Node> nodes, List<List<int>> edges, List<String> edgeIndices) {
    _buildingCode = buildingCode;
    _nodes = nodes;
    _edges = edges;
    _edgeIndices = edgeIndices;
  }

  /// Constructor to initialize this graph from another graph passed.
  Graph.fromGraph(Graph graph) {
    _buildingCode = graph.getName();
    _nodes = graph.getNodes();
    _edges = graph.getEdges();
    _edgeIndices = graph.getEdgeIndices();
  }
  // endregion constructors
  /// The letters of the building code for this graph.
  String _buildingCode;
  /*
  key:value pair list of nodes on the graph.
  key = the id number of the node.
  value = the node object.
   */
  /// The map of all the nodes on this graph.
  Map<String, Node> _nodes;
  /*
  2D matrix of edges that connect 2 nodes together and the weight of that edge.
  rows = from
  columns = to
  the weight of the edge is the actual value at position (row, col).
  weight =
    0 if is node itself
    int indicating distance between nodes in meters (or difficulty of travel).
    +inf if is not connected to
   */
  /// The 2D matrix containing the edges and weights of this graph.
  List<List<int>> _edges;
  /*
  Mapping of the edge ids to their appropriate index in the 2D matrix.
  key = id of the node
  value = index in the 2D matrix.
   */
  /// The map of the indices in the 2D matrix of the edges on this graph.
  List<String> _edgeIndices;

  // region getters
  /// Returns the building code letters of this graph.
  String getName() {
    return _buildingCode;
  }

  /// Returns the [node] map of this graph.
  Map<String, Node> getNodes() {
    return _nodes;
  }

  /// Returns the index of the [node] on this graph.
  int getIndex(Node node) {
    return _edgeIndices.indexOf(node.getId());
  }

  /// Returns the [node] of this graph as a list.
  List<Node> getNodesAsList() {
    final List<Node> list = <Node>[];
    _nodes.forEach((String k, Node v) => list.add(Node(v.getId())));

    return list;
  }

  /// Returns the [node] IDs of this graph as a list of strings.
  List<String> getNodeIDsAsList() {
    final List<String> idList = <String>[];
    // ignore: prefer_foreach
    for (final String id in _nodes.keys) {
      idList.add(id);
    }

    return idList;
  }

  /// Returns a list of [node]s that are connected to the [node] passed.
  List<Node> getConnectedNodes(Node node) {
    final List<Node> connected = <Node>[];

    int index = 0;
    for (final int weight in _edges[_edgeIndices.indexOf(node.getId())]) {
      if (weight > 0) {
        connected.add(_nodes[_edgeIndices[index]]);
      }
      index++;
    }

    return connected;
  }

  int getWeight(Node from, Node to) {
    return _edges[_edgeIndices.indexOf(from.getId())][_edgeIndices.indexOf(to.getId())];
  }

/*  /// Returns a list of [node] IDs that are connected to the [node] ID passed.
  List<String> getConnectedNodeIDs(String id){
    var connected = <String>[];

    for (var node in _edges)
  }*/

  /// Returns the 2D edge matrix of this graph.
  List<List<int>> getEdges() {
    return _edges;
  }

  /// Returns the map of indices for the 2D edge matrix of this graph.
  List<String> getEdgeIndices() {
    return _edgeIndices;
  }
  // endregion getters

  // region setters
  /// Sets the building code of this graph to the building code passed.
  void setName(String buildingCode) {
    _buildingCode = buildingCode;
  }

  /// Sets the [node] map of this graph to the [node] map passed.
  void setNodes(Map<String, Node> nodes) {
    _nodes = nodes;
  }

  /// Sets the [node] map of this graph from the edge indices passed.
  void setNodesFromEdgeIndices(List<String> edgeIndices) {
    for (final String id in edgeIndices) {
      _nodes[id] = Node(id);
    }
  }

  /// Sets the 2D edge matrix of this graph to the 2D edge matrix passed.
  void setEdges(List<List<int>> edges) {
    _edges = edges;
  }

  /// Sets the map of indices for the 2D edge matrix of this graph to the map of indices for the 2D edge matrix passed.
  void setEdgeIndices(List<String> edgeIndices) {
    _edgeIndices = edgeIndices;
  }
  // endregion setters
}
