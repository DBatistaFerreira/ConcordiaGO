import 'package:concordia_go/models/shortest_path.dart';
import 'package:concordia_go/models/graph.dart';
import 'package:concordia_go/models/node.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:concordia_go/utilities/concordia_constants.dart' as cc;

void main() {
  // region group
  group('description', () {
    // region group general fixtures
    final g = Graph('H8', cc.edges['H8'], cc.edge_indices['H8']);
    // endregion group general fixtures
    test('description', () {});
  });
  // endregion group
}
