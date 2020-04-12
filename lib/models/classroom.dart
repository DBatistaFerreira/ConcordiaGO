import 'package:concordia_go/models/concordia_building.dart';
import 'package:concordia_go/models/node.dart';

class Classroom {
  Classroom(this._building, this._floor, this._number) {
    _node = Node('100' + _number);
  }

  final ConcordiaBuilding _building;
  final String _floor;
  final String _number;
  Node _node;

  ConcordiaBuilding get building => _building;

  Node get node => _node;

  String get floor => _floor;

  String get number => _number;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Classroom &&
              _building == other._building &&
              _floor == other._floor &&
              _number == other._number;
}
