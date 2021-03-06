import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

enum Campus { SGW, Loyola }

class ConcordiaBuilding {
  const ConcordiaBuilding({
    this.code,
    this.name,
    this.address,
    this.campus,
    this.coordinates,
    this.vertices,
    this.hours,
    this.departments,
    this.services,
  });

  final String code;
  final String name;
  final String address;
  final Campus campus;
  final LatLng coordinates;
  final List<LatLng> vertices;
  final Map<String, String> hours;
  final List<String> departments;
  final List<String> services;

  String campusName() {
    return describeEnum(campus);
  }

  String campusString() {
    final String name = campusName();
    return '$name Campus';
  }
}

String campusString(Campus campus) {
  final String campusName = describeEnum(campus);
  return '$campusName Campus';
}
