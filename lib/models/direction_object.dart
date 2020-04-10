import 'package:concordia_go/models/node.dart';
import 'package:concordia_go/models/concordia_building.dart';
import 'package:concordia_go/utilities/direction.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Dobject {
  Dobject() {
    node = null;
    building = null;
    coordinates = null;
    floor = null;
    name = null;
    transportMode = null;
    isIndoorHotspot = false;
  }

  Dobject.indoor(this.node, this.building, this.floor, [this.name]) {
    coordinates = building.coordinates;
    transportMode = null;
  }

  Dobject.building(this.building) {
    coordinates = building.coordinates;
    name = building.name;
  }

  Dobject.hotspot(this.coordinates, this.name);

  Dobject.outdoor({this.node, this.building, this.coordinates, this.floor, this.name, this.transportMode});

  Dobject.indoorHotspot(this.node,this.name, {this.isIndoorHotspot=true});

  Node node;
  ConcordiaBuilding building;
  LatLng coordinates;
  String floor;
  String name;
  ModeOfTransport transportMode;
  bool isIndoorHotspot=false;

  bool hasNode() {
    return node != null;
  }

  bool hasBuilding() {
    return building != null;
  }

  bool hasCoordinates() {
    return coordinates != null;
  }

  bool hasFloor() {
    return floor != null;
  }

  bool hasName() {
    return name != null;
  }

  bool hasTransportMode() {
    return transportMode != null;
  }

  bool isIndoor() {
    return node != null && building != null && floor != null;
  }

  bool isBuilding() {
    return node == null && building != null && floor == null;
  }

  bool isOutdoor() {
    // TODO(username): implement is outdoor checks
    return true;
  }

  // The only building that can handle Indoor POIs is Hall
  bool canHandleIndoorPOI(){
    return building!=null&&building.code=='H';
  }
}
