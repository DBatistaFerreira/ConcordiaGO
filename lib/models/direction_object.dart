
import 'dart:html';

import 'package:concordia_go/models/concordia_building.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Dobject {
  Node _node;
  ConcordiaBuilding _building;
  LatLng _coordinates;
  String _floor;
  String _name;

  Dobject(){
    _node = null;
    _building = null;
    _coordinates = null;
    _floor = null;
    _name = null;
  }

  Dobject.indoor(Node node, ConcordiaBuilding building, String floor){
    _node = node;
    _building = building;
    _floor = floor;
  }

  Node get node => _node;
  ConcordiaBuilding get building => _building;
  LatLng get coordinates => _coordinates;
  String get floor => _floor;
  String get name => _name;
}