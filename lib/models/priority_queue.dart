import 'edge.dart';

class PriorityQueue {
  List<Edge> _pq;

  PriorityQueue() {
    _pq = <Edge>[];
  }

  PriorityQueue.fromList(List<Edge> list){
    _pq = list;
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
    return (_leftChild(index) < _pq.length);
  }

  bool _hasRightChild(int index){
    return (_rightChild(index) < _pq.length);
  }

  bool _isLeaf(int index) {
    return ((index >= (_pq.length ~/ 2)) && (index < _pq.length));
  }

  void _swap(int index1, int index2) {
    var tmp = _pq[index1];
    _pq[index1] = _pq[index2];
    _pq[index2] = tmp;
  }

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

  void _swim(int index) {
    while (_pq[index].getWeight() < _pq[_parent(index)].getWeight()) {
      _swap(index, _parent(index));
      index = _parent(index);
    }
  }

  void insert(Edge edge) {
    _pq.add(edge);
    _swim(_pq.length - 1);
  }

  void prioritize() {
    for (var i = (_pq.length ~/ 2); i >= 0; i--) {
      _sink(i);
    }
  }

  Edge replace(Edge edge){
    if (_pq.isNotEmpty){
      var root = _pq.first;
      _pq.first = edge;
      _sink(0);
      return root;
    }
    return null;
  }

  Edge delete() {
    if (_pq.isNotEmpty){
      return _pq.removeAt(0);
    }
    return null;
  }

  Edge peek(){
    if (_pq.isNotEmpty) {
      return _pq.first;
    }
    return null;
  }

  bool isEmpty(){
    return _pq.isEmpty;
  }

  int size(){
    return _pq.length;
  }
}
