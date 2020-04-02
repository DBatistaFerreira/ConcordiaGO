import 'package:google_maps_flutter/google_maps_flutter.dart';


enum HotspotType {Restaurant, Grocery, Shopping}

class Hotspot{

  Hotspot({this.address, this.coordinates, this.hotspotName, this.isOpen, this.priceLevel, this.rating, this.hotspotType});

  String address;
  LatLng coordinates;
  String hotspotName;
  bool isOpen;
  int priceLevel;
  double rating;
  HotspotType hotspotType;



}