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

  Node node;
  ConcordiaBuilding building;
  LatLng coordinates;
  String floor;
  String name;
  ModeOfTransport transportMode;

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

  bool isOutdoor() {
    // TODO(username): implement is outdoor checks
    return true;
  }
}
