import 'node.dart';

class Graph {
  /*
  name of the building (H, MB, EV, etc.)
   */
  String _name;
  /*
  key:value pair list of nodes on the graph.
  key = the id number of the node.
  value = the node object.
   */
  Map<int, Node> _nodes;
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
  List<List<int>> _edges;
  /*
  Mapping of the edge ids to their appropriate index in the 2D matrix.
  key = id of the node
  value = index in the 2D matrix.
   */
  Map<int, int> _edge_indices;

  // region constructors
  Graph(String name) {
    _name = name;
    _nodes = <int, Node>{};
    _edges = <List<int>>[];
    _edge_indices = <int, int>{};
  }

  Graph.fromGraph(Graph graph) {
    _name = graph.getName();
    _nodes = graph.getNodes();
    _edges = graph.getEdges();
    _edge_indices = graph.getEdgeIndices();
  }
  // endregion constructors

  // region getters
  String getName() {
    return _name;
  }

  Map<int, Node> getNodes() {
    return _nodes;
  }

  List<List<int>> getEdges() {
    return _edges;
  }

  Map<int, int> getEdgeIndices() {
    return _edge_indices;
  }
  // endregion getters

  // region setters
  void setName(String name) {
    _name = name;
  }

  void setNodes(Map<int, Node> nodes) {
    _nodes = nodes;
  }

  void setEdges(List<List<int>> edges) {
    _edges = edges;
  }

  void setEdgeIndices(Map<int, int> edge_indices) {
    _edge_indices = edge_indices;
  }
  // endregion setters

  // region functions
  // region add...
  /*
  when adding a node to the graph, the node id is added to the list along with
  the node object itself. The nodes can be referenced by id (aka node name).
   */
  void addNode(Node node) {
    // TODO: verify completion
    _nodes[node.getId()] = node;
  }

  /*
  can only add an edge between nodes that already exist in the graph.
  so before adding an edge, check to see if the nodes passed are already
  added to the graph (exist in the _nodes list).
  */
  void addEdge() {
    // TODO: implement
  }
  // endregion add...

  /*
  when deleting a node from the graph, the edges must also be deleted, since
  edges cannot exist without nodes. edge cannot be connected to a node that
  was deleted and no longer exists.
  */
  Node delNode(Node node) {
    // TODO: not finished
    return _nodes.remove(node.getId());
  }

  // endregion functions
}
