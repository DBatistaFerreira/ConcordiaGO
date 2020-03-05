import 'edge.dart';

/// A priority queue using a min heap.
class PriorityQueue {
  // region private variables
  /// The list of edges in this queue.
  List<Edge> _pq;
  // endregion private variables

  // region constructors
  /// Default constructor to initialize this as a new empty queue.
  PriorityQueue() {
    _pq = <Edge>[];
  }

  /// Constructor to initialize this queue from a list of edges.
  PriorityQueue.fromList(List<Edge> list){
    _pq = list;
  }
  // endregion constructors

  // region private functions
  /// Returns the parent's [index] of the element at [index] in this queue.
  int _parent(int index) {
    return (index - 1) ~/ 2;
  }

  /// Returns the left child's [index] of the element at [index] in this queue.
  int _leftChild(int index) {
    return (index * 2) + 1;
  }

  /// Returns the right child's [index] of the element at [index] in this queue.
  int _rightChild(int index) {
    return (index * 2) + 2;
  }

  /// Returns `true` if the element at [index] has a left child in this queue.
  bool _hasLeftChild(int index){
    return (_leftChild(index) < _pq.length);
  }

  /// Returns `true` if the index passed has a right child in this queue.
  bool _hasRightChild(int index){
    return (_rightChild(index) < _pq.length);
  }

  /// Returns `true` if the index passed is a leaf in this queue.
  ///
  /// A leaf is an element in this queue that does not have any children.
  bool _isLeaf(int index) {
    return ((index >= (_pq.length ~/ 2)) && (index < _pq.length));
  }

  /// Swaps the elements of the first and second [index] passed in this queue.
  void _swap(int index1, int index2) {
    var tmp = _pq[index1];
    _pq[index1] = _pq[index2];
    _pq[index2] = tmp;
  }

  /// Sinks the element at [index] to the back of this queue.
  ///
  /// The appropriate position is based on the priority structure of this queue.
  /// The priority structure is the minimum weight at the front of this queue.
  /// If the element at [index] has a larger weight than any of its children,
  /// then it will swap positions with the child of smaller weight.
  void _sink(int index) {
    if (!_isLeaf(index)) {
      if (_hasLeftChild(index) && _hasRightChild(index)){
        if (_pq[index].getWeight() > _pq[_leftChild(index)].getWeight() || _pq[index].getWeight() > _pq[_rightChild(index)].getWeight()) {
          if (_pq[_leftChild(index)].getWeight() < _pq[_rightChild(index)].getWeight()) {
            _swap(index, _leftChild(index));
            _sink(_leftChild(index));
          } else {
            _swap(index, _rightChild(index));
            _sink(_rightChild(index));
          }
        }
      } else {
        if (_pq[index].getWeight() > _pq[_leftChild(index)].getWeight()){
          _swap(index, _leftChild(index));
          _sink(_leftChild(index));
        }
      }
    }
  }

  /// Swims the element at [index] to the front of this queue.
  ///
  /// The appropriate position is based on the priority structure of this queue.
  /// The priority structure is the minimum weight at the front of this queue.
  /// If the element at [index] has a smaller weight than its parent,
  /// then it will swap positions with its parent.
  void _swim(int index) {
    while (_pq[index].getWeight() < _pq[_parent(index)].getWeight()) {
      _swap(index, _parent(index));
      index = _parent(index);
    }
  }
  // endregion private functions

  // region functions
  /// Inserts an [edge] at its appropriate position based on its priority in this queue.
  void insert(Edge edge) {
    _pq.add(edge);
    _swim(_pq.length - 1);
  }

  /// Reorders the queue based on the priority of the elements in this queue.
  void prioritize() {
    for (var i = (_pq.length ~/ 2); i >= 0; i--) {
      _sink(i);
    }
  }

  /// Replace an [edge] with another [edge] passed in this queue.
  ///
  /// Returns the [edge] that has been replaced.
  Edge replace(Edge edge){
    if (_pq.isNotEmpty){
      var root = _pq.first;
      _pq.first = edge;
      _sink(0);
      return root;
    }
    return null;
  }

  /// Deletes the [edge] from the front of this queue.
  ///
  /// Returns the [edge] that was at the front of this queue.
  /// The [edge] that was at the front had the highest priority (smallest weight).
  Edge delete() {
    if (_pq.isNotEmpty){
      return _pq.removeAt(0);
    }
    return null;
  }

  /// Returns the [edge] at the front of this queue.
  ///
  /// The [edge] at the front has the highest priority (smallest weight).
  /// Does not affect the contents of this queue.
  Edge peek(){
    if (_pq.isNotEmpty) {
      return _pq.first;
    }
    return null;
  }

  /// Returns `true` if this queue is empty.
  bool isEmpty(){
    return _pq.isEmpty;
  }

  /// Returns the size of this queue.
  int size(){
    return _pq.length;
  }
  // endregion functions
}
