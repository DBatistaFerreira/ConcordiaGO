import 'Node.dart';

class Edge {
  Node _from;
  Node _to;
  int _weight;

  // region constructors
  Edge(Node from, Node to, int weight){
    _from = from;
    _to = to;
    _weight = weight;
  }
  // endregion constructors

  // region getters
  Node getFrom(){
    return _from;
  }

  Node getTo(){
    return _to;
  }

  int getWeight(){
    return _weight;
  }
  // endregion getters

  // region setters
  void setFrom(Node from){
    _from = from;
  }

  void setTo(Node to){
    _to = to;
  }

  void setWeight(int weight){
    _weight = weight;
  }
  // endregion setters

  bool isEqual(Edge edge){
    return (_to.isEqualTo(edge.getTo())) && (_from.isEqualTo(edge.getFrom())) && (_weight == edge.getWeight());
  }

  @override
  String toString(){
    return  'From:\t$_from\n'
            'To:\t$_to\n'
            'Weight:\t$_weight';
  }
}