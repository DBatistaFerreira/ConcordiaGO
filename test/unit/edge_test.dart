import 'package:concordia_go/models/edge.dart';
import 'package:concordia_go/models/node.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // region test variables
  final from = Node('1');
  final to = Node('2');
  final weight = 3;
  final edge = Edge(from, to, weight);
  // endregion test variables

  // region test getters
  group('Getters', () {
    test('getFrom should return from node object', () {
      expect(edge.getFrom(), from);
    });

    test('getTo should return to node object', () {
      expect(edge.getTo(), to);
    });

    test('getWeight should return weight int', () {
      expect(edge.getWeight(), 3);
    });
  });
  // endregion test getters

  // region test setters
  group('Setters', () {
    test('setFrom should set the from variable to the node object passed', () {
      final setFrom = Node('4');

      edge.setFrom(setFrom);

      expect(edge.getFrom(), setFrom);
    });

    test('setTo should set the to variable to the node object passed', () {
      final setTo = Node('4');

      edge.setTo(setTo);

      expect(edge.getTo(), setTo);
    });

    test('setWeight should set the weight variable to the int passed', () {
      edge.setWeight(7);

      expect(edge.getWeight(), 7);
    });
  });
  // endregion test setters

  // region test functions
  group('Functions', () {
    test(
        'isEqual should return true if both edges are the same and false otherwise',
        () {
      final notEqual = Edge(to, from, weight);
      expect(edge.isEqual(notEqual), false);
      expect(edge.isEqual(edge), true);
    });

    test('toString should return the format specified', () {
      final format = 'From:\t${edge.getFrom()}\n'
          'To:\t${edge.getTo()}\n'
          'Weight:\t${edge.getWeight()}';

      expect(edge.toString(), format);
    });
  });
  // endregion test functions
}
