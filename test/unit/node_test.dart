import 'package:concordia_go/models/node.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // region test variables
  final node = Node('5');
  // endregion test variables

  // region test getters
  group('Getters', () {
    test('getId should return the id int of the node', () {
      expect(node.getId(), '5');
    });
  });
  // endregion test getters

  // region test setters
  group('Setters', () {
    test('setId should set the node id to the int passed', () {
      node.setId('3');

      expect(node.getId(), '3');
    });
  });
  // endregion test setters

  // region test functions
  group('Functions', () {
    test('isEqualTo should return true if the nodes are the same and false otherwise', () {
      final testNode = Node('5');
      final equalNode = Node('5');

      expect(testNode.isEqualTo(equalNode), true);
    });
  });
  // endregion test functions
}
