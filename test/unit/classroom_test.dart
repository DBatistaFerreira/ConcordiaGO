import 'package:concordia_go/models/classroom.dart';
import 'package:concordia_go/models/node.dart';
import 'package:concordia_go/utilities/concordia_constants.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final Classroom classroom = Classroom(buildings['H'], '8', '801');

  test('Test Classroom getters', () {
    expect(classroom.building, buildings['H']);
    expect(classroom.floor, '8');
    expect(classroom.number, '801');
    expect(classroom.node.toString(), Node('100801').toString());
  });
}
