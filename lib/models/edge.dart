import 'node.dart';

/// An edge that connects two nodes with a weight.
class Edge {
  // region private variables
  /// The node that this edge is coming from.
  Node _from;

  /// The Node that this edge is going to.
  Node _to;

  /// The weight of this edge between the two connected Nodes as a non-negative int.
  int _weight;
  // endregion private variables

  // region constructors
  /// Default constructor to initialize this edge with the values passed.
  Edge(Node from, Node to, int weight) {
    _from = from;
    _to = to;
    _weight = weight;
  }
  // endregion constructors

  // region getters
  /// Returns the [node] that this edge is coming from.
  Node getFrom() {
    return _from;
  }

  /// Returns the [node] that this edge is going to.
  Node getTo() {
    return _to;
  }

  /// Returns the [weight] of this edge between the two connected nodes as a non-negative int.
  int getWeight() {
    return _weight;
  }
  // endregion getters

  // region setters
  /// Sets the [node] that this edge is coming from.
  void setFrom(Node from) {
    _from = from;
  }

  /// Sets the node that this edge is going to.
  void setTo(Node to) {
    _to = to;
  }

  /// Sets the weight of this edge between the two connected nodes as a non-negative int.
  void setWeight(int weight) {
    _weight = weight;
  }
  // endregion setters

  /// Returns `true` if this edge has the same values as the edge passed.
  bool isEqual(Edge edge) {
    return (_to.isEqualTo(edge.getTo())) && (_from.isEqualTo(edge.getFrom())) && (_weight == edge.getWeight());
  }

  /// Returns a pretty print format for this edge's values.
  @override
  String toString() {
    return 'From:\t$_from\n'
        'To:\t$_to\n'
        'Weight:\t$_weight';
  }
}
