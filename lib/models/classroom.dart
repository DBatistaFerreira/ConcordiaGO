import 'package:concordia_go/models/concordia_building.dart';
import 'package:concordia_go/models/node.dart';

class Classroom {
  final ConcordiaBuilding building;
  final String floor;
  final String number;
  Node _node;

  Classroom({this.building, this.floor, this.number}) {
    _node = Node('100' + number);
  }

  Node get node => _node;
}
