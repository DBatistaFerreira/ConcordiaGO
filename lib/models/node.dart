/// A unique node.
class Node {
  // region private variables
  /// The unique ID of this node.
  int _id;
  // endregion private variables

  // region constructors
  /// Default constructor that initializes this node with a unique [ID].
  Node(int id) {
    _id = id;
  }
  // endregion constructors

  // region getters
  /// Returns this node's unique [ID].
  int getId() {
    return _id;
  }
  // endregion getters

  // region setters
  /// Sets this node's unique [ID].
  void setId(int id) {
    _id = id;
  }
  // endregion setters

  // region functions
  /// Returns `true` if this node has the same [ID] as the node passed.
  bool isEqualTo(Node node) {
    return (_id == node.getId());
  }
  // endregion functions
}
