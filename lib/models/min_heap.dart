import 'edge.dart';

class MinHeap {
  List<Edge> _heap;

  MinHeap() {
    _heap = <Edge>[];
  }

  MinHeap.fromList(List<Edge> list){
    _heap = list;
  }

  int _parent(int index) {
    return (index - 1) ~/ 2;
  }

  int _leftChild(int index) {
    return (index * 2) + 1;
  }

  int _rightChild(int index) {
    return (index * 2) + 2;
  }

  bool _hasLeftChild(int index){
    return (_leftChild(index) < _heap.length);
  }

  bool _hasRightChild(int index){
    return (_rightChild(index) < _heap.length);
  }

  bool _isLeaf(int index) {
    return ((index >= (_heap.length ~/ 2)) && (index < _heap.length));
  }

  void _swap(int index1, int index2) {
    var tmp = _heap[index1];
    _heap[index1] = _heap[index2];
    _heap[index2] = tmp;
  }

  void _sink(int index) {
    if (!_isLeaf(index)) {
      if (_hasLeftChild(index) && _hasRightChild(index)){
        if (_heap[index].getWeight() > _heap[_leftChild(index)].getWeight() || _heap[index].getWeight() > _heap[_rightChild(index)].getWeight()) {
          if (_heap[_leftChild(index)].getWeight() < _heap[_rightChild(index)].getWeight()) {
            _swap(index, _leftChild(index));
            _sink(_leftChild(index));
          } else {
            _swap(index, _rightChild(index));
            _sink(_rightChild(index));
          }
        }
      } else {
        if (_heap[index].getWeight() > _heap[_leftChild(index)].getWeight()){
          _swap(index, _leftChild(index));
          _sink(_leftChild(index));
        }
      }
    }
  }

  void _swim(int index) {
    while (_heap[index].getWeight() < _heap[_parent(index)].getWeight()) {
      _swap(index, _parent(index));
      index = _parent(index);
    }
  }

  void insert(Edge edge) {
    _heap.add(edge);
    _swim(_heap.length - 1);
  }

  void heapify() {
    for (var i = (_heap.length ~/ 2); i >= 0; i--) {
      _sink(i);
    }
  }

  Edge replace(Edge edge){
    if (_heap.isNotEmpty){
      var root = _heap.first;
      _heap.first = edge;
      _sink(0);
      return root;
    }
    return null;
  }

  Edge delete() {
    if (_heap.isNotEmpty){
      return _heap.removeAt(0);
    }
    return null;
  }

  Edge peek(){
    if (_heap.isNotEmpty) {
      return _heap.first;
    }
    return null;
  }

  bool isEmpty(){
    return _heap.isEmpty;
  }

  int size(){
    return _heap.length;
  }
}
