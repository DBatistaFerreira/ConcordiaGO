class Node {
  int _id;

  Node(int id) {
    _id = id;
  }

  Node.withoutId() {
    _id = null;
  }

  int getId() {
    return _id;
  }

  void setName(int id) {
    _id = id;
  }

  bool isEqualTo(Node node) {
    return (_id == node.getId());
  }
}
