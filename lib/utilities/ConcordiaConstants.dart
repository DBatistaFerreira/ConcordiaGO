library ConcordiaConstants;
import 'package:google_maps_flutter/google_maps_flutter.dart';

// Loyola Buildings Names, Initials and Coordinates
  //TODO

// SGW Building Names, Initials and Coordinates
  //TODO

const String H_BUILDING_NAME = "Hall";
const String H_BUILDING_INITIAL = "H";
const double H_BUILDING_LATITUDE = 45.497113;
const double H_BUILDING_LONGITUDE = -73.578791;

const String FG_BUILDING_NAME = "Faubourg";
const String FG_BUILDING_INITIAL = "FG";

const Map<String, LatLng> sgwBuildingCoordinates = {
  'Hall': LatLng(45.497113, -73.578791),
  'EV': LatLng(45.495504, -73.577610),
  'Library': LatLng(45.496919, -73.578027),
  'JMSB': LatLng(45.495533, -73.579172),
  'FG': LatLng(45.494394, -73.578412)
};
const Map<String, LatLng> loyolaBuildingCoordinates = {};

const CameraPosition sgwCampus = CameraPosition(
  target: LatLng(45.495835, -73.578789),
  zoom: 15.5,
);

const CameraPosition loyolaCampus = CameraPosition(
  target: LatLng(45.458257, -73.640450),
  zoom: 15.5,
);
