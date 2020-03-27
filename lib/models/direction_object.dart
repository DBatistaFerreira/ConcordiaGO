import 'package:concordia_go/models/node.dart';
import 'package:concordia_go/models/concordia_building.dart';
import 'package:concordia_go/utilities/direction.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Dobject {
  Node _node;
  ConcordiaBuilding _building;
  LatLng _coordinates;
  String _floor;
  String _name;
  ModeOfTransport _transport_mode;

  Dobject(){
    _node = null;
    _building = null;
    _coordinates = null;
    _floor = null;
    _name = null;
    _transport_mode = null;
  }

  Dobject.indoor(Node node, ConcordiaBuilding building, String floor){
    _node = node;
    _building = building;
    _floor = floor;
  }

  Dobject.outdoor({Node node, ConcordiaBuilding building, LatLng coordinates, String floor, String name, ModeOfTransport transport_mode}){
    _node = node;
    _building = building;
    _coordinates = coordinates;
    _floor = floor;
    _name = name;
    _transport_mode = transport_mode;
  }

  Node get node => _node;
  ConcordiaBuilding get building => _building;
  LatLng get coordinates => _coordinates;
  String get floor => _floor;
  String get name => _name;
  ModeOfTransport get transport_mode => _transport_mode;

  set node(Node node){
    _node = node;
  }

  set building(ConcordiaBuilding building){
    _building = building;
  }

  set coordinates(LatLng coordinates){
    _coordinates = coordinates;
  }

  set floor(String floor){
    _floor = floor;
  }

  set name(String name){
    _name = name;
  }

  set transport_mode(ModeOfTransport transport_mode){
    _transport_mode = transport_mode;
  }

  bool hasNode(){
    return (_node != null);
  }

  bool hasBuilding(){
    return (_building != null);
  }

  bool hasCoordinates(){
    return (_coordinates != null);
  }

  bool hasFloor(){
    return (_floor != null);
  }

  bool hasName(){
    return (_name != null);
  }

  bool hasTransportMode(){
    return (_transport_mode != null);
  }

  bool isIndoor(){
    return (_node != null && _building != null && _floor != null);
  }

  bool isOutdoor(){

  }
}