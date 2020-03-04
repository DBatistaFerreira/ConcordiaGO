class Node {
  int _id;

  Node(int id) {
    _id = id;
  }

  int getId() {
    return _id;
  }

  void setId(int id) {
    _id = id;
  }

  bool isEqualTo(Node node) {
    return (_id == node.getId());
  }
}
