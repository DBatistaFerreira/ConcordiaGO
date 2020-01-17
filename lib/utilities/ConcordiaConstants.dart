library ConcordiaConstants;

import 'package:google_maps_flutter/google_maps_flutter.dart';

// Loyola Buildings Names, Initials and Coordinates
//TODO

// SGW Building Names, Initials and Coordinates
//TODO
// Real names need to be added (https://www.concordia.ca/maps/sgw-campus.html)

const String H_BUILDING_NAME = "Hall";
const String H_BUILDING_INITIAL = "H";
const double H_BUILDING_LATITUDE = 45.497249;
const double H_BUILDING_LONGITUDE = -73.578954;

const String EV_BUILDING_NAME = "EV";
const String EV_BUILDING_INITIAL = "EV";
const double EV_BUILDING_LATITUDE = 45.495406;
const double EV_BUILDING_LONGITUDE = -73.577996;

const String LB_BUILDING_NAME = "Library";
const String LB_BUILDING_INITIAL = "LB";
const double LB_BUILDING_LATITUDE = 45.496849;
const double LB_BUILDING_LONGITUDE = -73.578053;

const String MB_BUILDING_NAME = "JMSB";
const String MB_BUILDING_INITIAL = "MB";
const double MB_BUILDING_LATITUDE = 45.495495;
const double MB_BUILDING_LONGITUDE = -73.579169;

const String FG_BUILDING_NAME = "Faubourg";
const String FG_BUILDING_INITIAL = "FG";
const double FG_BUILDING_LATITUDE = 45.494354;
const double FG_BUILDING_LONGITUDE = -73.578428;

const CameraPosition sgwCampus = CameraPosition(
  target: LatLng(45.495835, -73.578789),
  zoom: 15.5,
);

const CameraPosition loyolaCampus = CameraPosition(
  target: LatLng(45.458257, -73.640450),
  zoom: 15.5,
);
