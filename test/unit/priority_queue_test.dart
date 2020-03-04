import 'package:concordia_go/models/edge.dart';
import 'package:concordia_go/models/node.dart';
import 'package:concordia_go/models/priority_queue.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  // region test variables
  final edge1 = Edge(Node(2), Node(5), 5);
  final edge2 = Edge(Node(2), Node(4), 5);
  final edge3 = Edge(Node(2), Node(7), 7);
  final edge4 = Edge(Node(5), Node(7), 3);
  final edge5 = Edge(Node(6), Node(4), 9);
  final edge6 = Edge(Node(7), Node(2), 2);
  // endregion test variables

  // region test functions
  group('Functions', (){
    test('isEmpty should return true if the heap is empty and false otherwise', (){
      final pq = PriorityQueue();

      expect(pq.isEmpty(), true);

      pq.insert(edge1);

      expect(pq.isEmpty(), false);
    });

    test('size should return the size of the heap', (){
      final pq = PriorityQueue();

      expect(pq.size(), 0);

      pq.insert(edge1);
      pq.insert(edge2);
      pq.insert(edge3);

      expect(pq.size(), 3);
    });

    test('insert should add an Edge to the heap and reorder it', (){
      final pq = PriorityQueue();

      pq.insert(edge2);
      pq.insert(edge3);
      pq.insert(edge4);
      pq.insert(edge5);

      expect(pq.size(), 4);
      expect(pq.peek(), edge4);
    });

    test('peek should return the first Edge, with the lowest weight, in the heap', (){
      final pq = PriorityQueue();

      expect(pq.peek(), null);

      pq.insert(edge2);
      pq.insert(edge5);
      pq.insert(edge3);

      expect(pq.peek(), edge2);

      pq.insert(edge4);

      expect(pq.peek(), edge4);
    });

    test('heapify should reorder the heap to min heap', (){
      final list = [edge1, edge2, edge3, edge4, edge5];
      final pq = PriorityQueue.fromList(list);

      pq.prioritize();

      expect(pq.peek(), edge4);
    });

    test('delete should remove and return the min value of the heap', (){
      final pq = PriorityQueue();

      expect(pq.delete(), null);

      pq.insert(edge1);
      pq.insert(edge2);
      pq.insert(edge3);
      pq.insert(edge4);
      pq.insert(edge5);

      expect(pq.delete(), edge4);
      expect(pq.size(), 4);
    });

    test('replace should insert the edge passed as the root then reorder as min heap and return the previous root', (){
      final pq = PriorityQueue();

      expect(pq.replace(edge1), null);
      expect(pq.size(), 0);
      expect(pq.isEmpty(), true);

      pq.insert(edge1); // weight = 5
      pq.insert(edge2); // weight = 5
      pq.insert(edge3); // weight = 7
      pq.insert(edge4); // weight = 3
      pq.insert(edge6); // weight = 2

      expect(pq.size(), 5);
      expect(pq.replace(edge5), edge6);
      expect(pq.peek(), edge4);
    });
  });
  // endregion test functions
}