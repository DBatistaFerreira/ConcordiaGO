import 'package:concordia_go/models/min_heap.dart';
import 'package:concordia_go/models/edge.dart';

class PriorityQueue extends MinHeap {
  MinHeap _pq;

  PriorityQueue(){
    _pq = MinHeap();
  }

  PriorityQueue.fromList(List<Edge> list){
    _pq = MinHeap.fromList(list);
  }

  void prioritize(){
    _pq.heapify();
  }

  void enqueue(Edge edge){
    _pq.insert(edge);
  }

  Edge dequeue(){
    return _pq.delete();
  }
}
