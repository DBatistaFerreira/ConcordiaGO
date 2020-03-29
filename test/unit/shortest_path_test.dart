import 'package:concordia_go/models/shortest_path.dart';
import 'package:concordia_go/models/graph.dart';
import 'package:concordia_go/models/node.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:concordia_go/utilities/concordia_constants.dart' as cc;

void main() {
  // region constructor tests
  group('constructors', () {
    // region constructor tests general fixtures
    final Graph g = Graph('H8', cc.edges['H8'], cc.edge_indices['H8']);
    final Node src = Node(cc.edge_indices['H8'][48]); // class 805
    final Node dst = Node(cc.edge_indices['H8'][82]); // class 862
    // endregion constructor tests general fixtures

    test('constructor should initialize the variables with the values passed', () {
      final DShortestPath sp = DShortestPath(g, src, dst);

      expect(sp.getGraph(), g);
      expect(sp.getSource(), src);
      expect(sp.getDestination(), dst);
      expect(sp.getDistance(), 0);
    });
  });
  // endregion constructor tests
  // region getter tests
  group('getters', () {
    // region getter tests general fixtures
    final Graph g = Graph('H8', cc.edges['H8'], cc.edge_indices['H8']);
    final Node src = Node(cc.edge_indices['H8'][48]); // class 805
    final Node dst = Node(cc.edge_indices['H8'][82]); // class 862
    final DShortestPath sp = DShortestPath(g, src, dst);
    // endregion getter tests general fixtures

    test('getGraph should return the graph of this shortest path', () {
      expect(sp.getGraph(), g);
    });

    test('getSource should return the source node of this shortest path', () {
      expect(sp.getSource(), src);
    });

    test('getDestination should return the destination node of this shortest path', () {
      expect(sp.getDestination(), dst);
    });

//    test('getDistance should return the distance of this shortest path', () {
//      expect(sp.getDistance(), 0);
//      sp.setDistance(23);
//      expect(sp.getDistance(), 23);
//    });
  });
  // endregion getter tests
  // region setter tests
  group('setters', () {
    // region setter tests general fixtures
    final DShortestPath sp = DShortestPath.withNothing();
    // endregion setter tests general fixtures
    test('setGraph should set the graph to the graph passed', () {
      final Graph g = Graph.withNothing();
      sp.setGraph(g);
      expect(g.getName(), '');
      expect(g.getNodes().isEmpty, true);
      expect(g.getEdges().isEmpty, true);
      expect(g.getEdgeIndices().isEmpty, true);
    });

    test('setSource should set the source node to the node passed', () {
      final Node source = Node('123');
      sp.setSource(source);
      expect(sp.getSource(), source);
      expect(sp.getSource().getId(), '123');
    });

    test('setDestination should set the destination node to the node passed', () {
      final Node destination = Node('321');
      sp.setDestination(destination);
      expect(sp.getDestination(), destination);
      expect(sp.getDestination().getId(), '321');
    });

    test('setDistance should set the distance to the value passed', () {
      const int distance = 34;
      sp.setDistance(distance);
      expect(sp.getDistance(), distance);
    });
  });
  // endregion setter tests

  group('calcShortestPath', () {
    // region calcShortestPath test general fixtures

    // endregion calcShortestPath test general fixtures
    test('calcShortestPath should return a list of the shortest path nodes', () {
      final Graph g = Graph('H8', cc.edges['H8'], cc.edge_indices['H8']);
      g.setNodesFromEdgeIndices(cc.edge_indices['H8']);
      final DShortestPath sp = DShortestPath(g, g.getNodes()['000003'], g.getNodes()['000000']);
      expect(sp.getShortestPath().isEmpty, true);
      sp.calcShortestPath();
      expect(sp.getShortestPath().first.isEqualTo(Node('000003')), true);
      expect(sp.getShortestPath().last.isEqualTo(Node('000000')), true);
      expect(sp.getDistance(), 11);
      final DShortestPath sp2 = DShortestPath(g, g.getNodes()['100805'], g.getNodes()['100862']);
      expect(sp2.getShortestPath().isEmpty, true);
      sp2.calcShortestPath();
      expect(sp2.getShortestPath().first.isEqualTo(Node('100805')), true);
      expect(sp2.getShortestPath().last.isEqualTo(Node('100862')), true);
      expect(sp2.getDistance(), 28);
      final DShortestPath sp3 = DShortestPath(g, g.getNodes()['100805'], g.getNodes()['100865']);
      expect(sp3.getShortestPath().isEmpty, true);
      sp3.calcShortestPath();
      expect(sp3.getShortestPath().first.isEqualTo(Node('100805')), true);
      expect(sp3.getShortestPath().last.isEqualTo(Node('100865')), true);
      expect(sp3.getDistance(), 16);
      expect(sp.getDistance(), 11);
    });
  });
}
