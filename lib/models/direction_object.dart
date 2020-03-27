
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

  Dobject.outdoor({Node node, ConcordiaBuilding building, LatLng coordinates, String floor, String name}){
    _node = node;
    _building = building;
    _coordinates = coordinates;
    _floor = floor;
    _name = name;
  }

  Node get node => _node;
  ConcordiaBuilding get building => _building;
  LatLng get coordinates => _coordinates;
  String get floor => _floor;
  String get name => _name;

  void setNode(Node node){
    _node = node;
  }

  void setBuilding(ConcordiaBuilding building){
    _building = building;
  }

  void setCoordinates(LatLng coordinates){
    _coordinates = coordinates;
  }

  void setFloor(String floor){
    _floor = floor;
  }

  void setName(String name){
    _name = name;
  }

  bool hasNode(){
    return (_node == null);
  }

  bool hasBuilding(){
    return (_building == null);
  }

  bool hasCoordinates(){
    return (_coordinates == null);
  }

  bool hasFloor(){
    return (_floor == null);
  }

  bool hasName(){
    return (_name == null);
  }

}