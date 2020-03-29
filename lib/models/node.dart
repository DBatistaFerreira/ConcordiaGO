/// A unique node.
class Node {
  // region constructors
  /// Default constructor that initializes this node with a unique [ID].
  Node(String id) {
    _id = id;
  }
  // endregion constructors

  // region private variables
  /// The unique ID of this node.
  String _id;
  // endregion private variables

  // region getters
  /// Returns this node's unique [ID].
  String getId() {
    return _id;
  }
  // endregion getters

  // region setters
  /// Sets this node's unique [ID].
  void setId(String id) {
    _id = id;
  }
  // endregion setters

  // region functions
  /// Returns `true` if this node has the same [ID] as the node passed.
  bool isEqualTo(Node node) => _id == node.getId();
  // endregion functions
}
