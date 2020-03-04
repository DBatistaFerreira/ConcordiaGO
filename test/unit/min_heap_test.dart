import 'package:concordia_go/models/edge.dart';
import 'package:concordia_go/models/node.dart';
import 'package:concordia_go/models/min_heap.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  // region test variables
  final edge1 = Edge(Node(2), Node(5), 5);
  final edge2 = Edge(Node(2), Node(4), 5);
  final edge3 = Edge(Node(2), Node(7), 7);
  final edge4 = Edge(Node(5), Node(7), 3);
  final edge5 = Edge(Node(6), Node(4), 9);
  // endregion test variables

  // region test functions
  group('Functions', (){
    test('isEmpty should return true if the heap is empty and false otherwise', (){
      final minHeap = MinHeap();

      expect(minHeap.isEmpty(), true);

      minHeap.insert(edge1);

      expect(minHeap.isEmpty(), false);
    });

    test('size should return the size of the heap', (){
      final minHeap = MinHeap();

      expect(minHeap.size(), 0);

      minHeap.insert(edge1);
      minHeap.insert(edge2);
      minHeap.insert(edge3);

      expect(minHeap.size(), 3);
    });

    test('insert should add an Edge to the heap and reorder it', (){
      final minHeap = MinHeap();

      minHeap.insert(edge2);
      minHeap.insert(edge3);
      minHeap.insert(edge4);
      minHeap.insert(edge5);

      expect(minHeap.size(), 4);
      expect(minHeap.peek(), edge4);
    });

    test('peek should return the first Edge, with the lowest weight, in the heap', (){
      final minHeap = MinHeap();

      expect(minHeap.peek(), null);

      minHeap.insert(edge2);
      minHeap.insert(edge5);
      minHeap.insert(edge3);

      expect(minHeap.peek(), edge2);

      minHeap.insert(edge4);

      expect(minHeap.peek(), edge4);
    });

    test('heapify should reorder the heap to min heap', (){
      final list = [edge1, edge2, edge3, edge4, edge5];
      final minHeap = MinHeap.fromList(list);

      minHeap.heapify();

      expect(minHeap.peek(), edge4);
    });

    test('delete should remove and return the min value of the heap', (){
      final minHeap = MinHeap();

      expect(minHeap.delete(), null);

      minHeap.insert(edge1);
      minHeap.insert(edge2);
      minHeap.insert(edge3);
      minHeap.insert(edge4);
      minHeap.insert(edge5);

      expect(minHeap.delete(), edge4);
      expect(minHeap.size(), 4);
    });
  });
  // endregion test functions
}