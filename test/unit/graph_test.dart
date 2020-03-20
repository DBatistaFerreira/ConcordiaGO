import 'package:concordia_go/utilities/concordia_constants.dart' as cc;
import 'package:concordia_go/models/graph.dart';
import 'package:concordia_go/models/node.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  // region test functions

  // region constructor tests
  group('Constructors', (){
    // region constructor general fixtures
    final building_name = 'H8';
    final edges = cc.edges[building_name];
    final edge_indices = cc.edge_indices[building_name];
    // endregion constructor general fixtures

    test('constructor should create a graph object with the values passed', (){
      final g = Graph(building_name, edges, edge_indices);

      expect(g.getName(), building_name);
      expect(g.getEdges(), edges);
      expect(g.getEdgeIndices(), edge_indices);
    });

    test('constructorWithNothing should create a graph object with empty values', (){
      final g = Graph.withNothing();

      expect(g.getName(), '');
      expect(g.getNodes().isEmpty, true);
      expect(g.getEdges().isEmpty, true);
      expect(g.getEdgeIndices().isEmpty, true);
    });

    test('constructorWithNodes should create a graph object with values passed', (){
      final nodeMap = {
        '100857' : Node('100857'),
        '100859' : Node('100859'),
        '100861' : Node('100861'),
        '100862' : Node('100862'),
        '100863' : Node('100863'),
        '120002' : Node('120002'),
      };

      final g = Graph.withNodes(building_name, nodeMap, edges, edge_indices);

      expect(g.getName(), building_name);
      expect(g.getNodes(), nodeMap);
      expect(g.getNodes().containsKey('100857'), true);
      expect(g.getEdges()[34][86], edges[34][86]);
      expect(g.getEdgeIndices()[69], edge_indices[69]);
    });

    test('constructorFromGraph should create a graph object from the graph passed', (){
      final graph = Graph('name', edges, edge_indices);
      final g = Graph.fromGraph(graph);

      expect(g.getName(), 'name');
      expect(g.getNodes().isEmpty, true);
      expect(g.getEdges()[12][80], edges[12][80]);
      expect(g.getEdgeIndices()[44], edge_indices[44]);
    });
  });
  // endregion constructor tests

  // region getters and setters tests
  group('Getters and Setters', (){
    // region getters and setters general fixtures

    // endregion getters and setters general fixtures
    test('setName should set the name of the graph to the string passed', (){
      final g = Graph.withNothing();

      g.setName('testName');

      expect(g.getName(), 'testName');
    });

    test('setNodes should set the nodes of the graph to the Map<String, Node> passed', (){
      final g = Graph.withNothing();
      final nodeMap = {
        '100857' : Node('100857'),
        '100859' : Node('100859'),
        '100861' : Node('100861'),
        '100862' : Node('100862'),
        '100863' : Node('100863'),
        '120002' : Node('120002'),
      };

      g.setNodes(nodeMap);

      expect(g.getNodes(), nodeMap);
      expect(g.getNodes().containsKey('100862'), true);
      expect(g.getNodes().length, nodeMap.length);
    });

    test('setNodesFromEdgeIndices should create a Map<String, Node> from the edge indices list passed', (){
      final g = Graph.withNothing();
      final edge_indices = [
        '100842',
        '100843',
        '100845',
        '100847',
        '140001',
      ];

      g.setNodesFromEdgeIndices(edge_indices);

      expect(g.getNodes().containsKey('140001'), true);
      expect(g.getNodes().length, edge_indices.length);
    });

    test('setEdges should set the edges of the graph to the 2D matrix List<List<int>> passed', (){
      final g = Graph.withNothing();
      final edges = cc.edges['H8'];

      g.setEdges(edges);

      expect(g.getEdges(), edges);
      expect(g.getEdges()[52][21], edges[52][21]);
      expect(g.getEdges().length, edges.length);
    });

    test('setEdgeIndices should set the edge indices of the graph to the list of edge indices passed', (){
      final g = Graph.withNothing();
      final edge_indices = [
        '100842',
        '100843',
        '100845',
        '100847',
        '140001',
      ];

      g.setEdgeIndices(edge_indices);

      expect(g.getEdgeIndices(), edge_indices);
      expect(g.getEdgeIndices()[2], edge_indices[2]);
      expect(g.getEdgeIndices().length, edge_indices.length);
    });

    test('getName should return the name of the graph as a string', (){
      final g = Graph.withNothing();
      g.setName('name');

      expect(g.getName(), 'name');
    });

    test('getNodes should return the nodes of the graph as a Map<String, Node>', (){
      final g = Graph.withNothing();
      final nodeMap = {
        '100857' : Node('100857'),
        '100859' : Node('100859'),
        '100861' : Node('100861'),
        '100862' : Node('100862'),
        '100863' : Node('100863'),
        '120002' : Node('120002'),
      };

      g.setNodes(nodeMap);

      expect(g.getNodes(), nodeMap);
      expect(g.getNodes().length, nodeMap.length);
      expect(g.getNodes().containsKey('100859'), true);
    });

    test('getNodesAsList should return the nodes of the graph as a List<Node>', (){
      final g = Graph.withNothing();
      final nodeMap = {
        '100857' : Node('100857'),
        '100859' : Node('100859'),
        '100861' : Node('100861'),
        '100862' : Node('100862'),
        '100863' : Node('100863'),
        '120002' : Node('120002'),
      };
      final nodeList = [
        Node('100857'),
        Node('100859'),
        Node('100861'),
        Node('100862'),
        Node('100863'),
        Node('120002'),
      ];

      g.setNodes(nodeMap);

      expect(g.getNodesAsList().length, nodeList.length);
      expect(g.getNodesAsList()[3].getId(), '100862');
    });

    test('getNodesIDsAsList should return the node IDs of the graph as a List<String>', (){
      final g = Graph.withNothing();
      final nodeMap = {
        '100857' : Node('100857'),
        '100859' : Node('100859'),
        '100861' : Node('100861'),
        '100862' : Node('100862'),
        '100863' : Node('100863'),
        '120002' : Node('120002'),
      };
      final nodeList = [
        '100857',
        '100859',
        '100861',
        '100862',
        '100863',
        '120002',
      ];

      g.setNodes(nodeMap);

      expect(g.getNodeIDsAsList().length, nodeList.length);
      expect(g.getNodeIDsAsList()[2], '100861');
    });

    test('getConnectedNodes should return a list of nodes that are connected to the node passed.', (){
      final g = Graph('H8', cc.edges['H8'], cc.edge_indices['H8']);

      g.setNodesFromEdgeIndices(cc.edge_indices['H8']);

      expect(g.getConnectedNodes(g.getNodes()['000001']).length, 4);
    });

    test('getEdges should return the edges of the graph as a 2D Matrix List<List<int>>', (){
      final g = Graph.withNothing();
      g.setEdges(cc.edges['H8']);

      expect(g.getEdges(), cc.edges['H8']);
      expect(g.getEdges().length, cc.edges['H8'].length);
      expect(g.getEdges()[44][9], cc.edges['H8'][44][9]);
    });

    test('getEdgeIndices should return the edge indices of the graph as a List<String>', (){
      final g = Graph.withNothing();
      g.setEdgeIndices(cc.edge_indices['H8']);

      expect(g.getEdgeIndices(), cc.edge_indices['H8']);
      expect(g.getEdgeIndices().length, cc.edge_indices['H8'].length);
      expect(g.getEdgeIndices()[33], cc.edge_indices['H8'][33]);
    });
    // endregion getters and setters tests

  });
  // endregion test functions
}