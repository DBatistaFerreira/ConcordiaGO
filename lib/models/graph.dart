import 'node.dart';

/// A weighted graph containing nodes and edges.
class Graph {
  /// The letters of the building code for this graph.
  String _building_code;
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
  List<String> _edge_indices;

  // region constructors
  /// Default constructor to initialize this graph with the values passed.
  Graph(
      String building_code, List<List<int>> edges, List<String> edge_indices) {
    _building_code = building_code;
    _nodes = <String, Node>{};
    _edges = edges;
    _edge_indices = edge_indices;
  }

  /// Constructor to initialize this graph with empty values for all variables.
  Graph.withNothing() {
    _building_code = '';
    _nodes = <String, Node>{};
    _edges = <List<int>>[];
    _edge_indices = <String>[];
  }

  Graph.withNodes(String building_code, Map<String, Node> nodes,
      List<List<int>> edges, List<String> edge_indices) {
    _building_code = building_code;
    _nodes = nodes;
    _edges = edges;
    _edge_indices = edge_indices;
  }

  /// Constructor to initialize this graph from another graph passed.
  Graph.fromGraph(Graph graph) {
    _building_code = graph.getName();
    _nodes = graph.getNodes();
    _edges = graph.getEdges();
    _edge_indices = graph.getEdgeIndices();
  }
  // endregion constructors

  // region getters
  /// Returns the building code letters of this graph.
  String getName() {
    return _building_code;
  }

  /// Returns the [node] map of this graph.
  Map<String, Node> getNodes() {
    return _nodes;
  }

  /// Returns the 2D edge matrix of this graph.
  List<List<int>> getEdges() {
    return _edges;
  }

  /// Returns the map of indices for the 2D edge matrix of this graph.
  List<String> getEdgeIndices() {
    return _edge_indices;
  }
  // endregion getters

  // region setters
  /// Sets the building code of this graph to the building code passed.
  void setName(String building_code) {
    _building_code = building_code;
  }

  /// Sets the [node] map of this graph to the [node] map passed.
  void setNodes(Map<String, Node> nodes) {
    _nodes = nodes;
  }

  /// Sets the [node] map of this graph from the edge indices passed.
  void setNodesFromEdgeIndices(List<String> edge_indices) {
    for (var node in edge_indices) {
      _nodes[node] = Node(node);
    }
  }

  /// Sets the 2D edge matrix of this graph to the 2D edge matrix passed.
  void setEdges(List<List<int>> edges) {
    _edges = edges;
  }

  /// Sets the map of indices for the 2D edge matrix of this graph to the map of indices for the 2D edge matrix passed.
  void setEdgeIndices(List<String> edge_indices) {
    _edge_indices = edge_indices;
  }
  // endregion setters
/*
  // region functions
  // region add...
  /*
  when adding a node to the graph, the node id is added to the list along with
  the node object itself. The nodes can be referenced by id (aka node name).
   */
  /// Add a [node] to this graph.
  void addNode(Node node) {
    // TODO: verify completion
    _nodes[node.getId()] = node;
  }

  /*
  can only add an edge between nodes that already exist in the graph.
  so before adding an edge, check to see if the nodes passed are already
  added to the graph (exist in the _nodes list).
  */
  /// Add an edge and its [weight] to this graph.
  void addEdge() {
    // TODO: implement
  }
  // endregion add...

  /*
  when deleting a node from the graph, the edges must also be deleted, since
  edges cannot exist without nodes. edge cannot be connected to a node that
  was deleted and no longer exists.
  */
  /// Deletes a [node] from this graph.
  Node delNode(Node node) {
    // TODO: not finished
    return _nodes.remove(node.getId());
  }

  // endregion functions
 */
}
