class MinHeap {
  List<int> _heap;

  MinHeap() {
    _heap = List<int>();
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

  bool _isLeaf(int index) {
    return ((index >= (_heap.length ~/ 2)) && (index < _heap.length));
  }

  void _swap(int index1, int index2) {
    int tmp = _heap[index1];
    _heap[index1] = _heap[index2];
    _heap[index2] = tmp;
  }

  void _sink(int index) {
    if (!_isLeaf(index)) {
      if (_heap[index] > _heap[_leftChild(index)] || _heap[index] > _heap[_rightChild(index)]) {
        if (_heap[_leftChild(index)] < _heap[_rightChild(index)]) {
          _swap(index, _leftChild(index));
          _sink(_leftChild(index));
        } else {
          _swap(index, _rightChild(index));
          _sink(_rightChild(index));
        }
      }
    }
  }

  void _swim(int index) {
    while (_heap[index] > _heap[_parent(index)]) {
      _swap(index, _parent(index));
      index = _parent(index);
    }
  }

  void insert(int element) {
    _heap.add(element);
    int current = _heap.length - 1;
    _swim(current);
  }

  void minHeap() {
    for (int i = (_heap.length ~/ 2); i >= 0; i--) {
      _sink(i);
    }
  }

  int remove() {
    int removed = _heap[0];
    _heap.removeAt(0);
    return removed;
  }
}
