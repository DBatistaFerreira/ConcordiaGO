library concordia_constants;

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

var buildingCoords = [
  {
    'Building': 'Hall Building',
    'code': 'H',
    'xcoords': [45.4973844, 45.4968314, 45.4971750, 45.4977167],
    'ycoords': [-73.5783540, -73.5788502, -73.5795483, -73.5790450],
  },
  {
    'Building': 'Webster Library',
    'code': 'LB',
    'xcoords': [45.496694, 45.497285, 45.496898, 45.4965677, 45.4965014, 45.4962589],
    'ycoords': [-73.578627, -73.578069, -73.577263, -73.5776063, -73.5774675, -73.5776955],
  },
  {
    'Building': 'John Molson Building',
    'code': 'MB',
    'xcoords': [45.495367, 45.495532, 45.495191, 45.495014],
    'ycoords': [-73.579374, -73.579189, -73.578513, -73.578711],
  },
  {
    'Building': 'EV Building',
    'code': 'EV',
    'xcoords': [45.4955790, 45.4958504, 45.4956582, 45.4960314, 45.4958349, 45.4952187],
    'ycoords': [-73.5787570, -73.5784720, -73.5780395, -73.5777019, -73.5772469, -73.5778870],
  },
  {
    'Building': 'Faubourg St-Catherines Building',
    'code': 'FG',
    'xcoords': [45.4942960, 45.4943677, 45.4942380, 45.4941722],
    'ycoords': [-73.5785193, -73.5784375, -73.5782266, -73.5783051],
  },
  {
    'Building': 'ECA B-Annex',
    'code': 'B',
    'xcoords': [45.497805, 45.497846, 45.497915, 45.497882],
    'ycoords': [-73.579460, -73.579522, -73.579456, -73.579391],
  },
  {
    'Building': 'CB Building',
    'code': 'CB',
    'xcoords': [
      45.4952441,
      45.4954030,
      45.4950591,
      45.4949339,
      45.4950613,
      45.4950291,
      45.4951059,
      45.4951346,
      45.4951940,
      45.4951630
    ],
    'ycoords': [
      -73.5738566,
      -73.5741855,
      -73.5745154,
      -73.5742506,
      -73.5741292,
      -73.5740662,
      -73.5739901,
      -73.5740531,
      -73.5739947,
      -73.5739347
    ],
  },
  {
    'Building': 'CI Annex',
    'code': 'CI',
    'xcoords': [45.497370, 45.497402, 45.497580, 45.4975439],
    'ycoords': [-73.579938, -73.580014, -73.579835, -73.5797592],
  },
  {
    'Building': 'CL Annex',
    'code': 'CL',
    'xcoords': [45.494251, 45.4941404, 45.4943390, 45.494465],
    'ycoords': [-73.578928, -73.5790782, -73.579427, -73.579285],
  },
  {
    'Building': 'D Annex',
    'code': 'D',
    'xcoords': [45.497742, 45.4977059, 45.497810, 45.497848],
    'ycoords': [-73.579410, -73.5793390, -73.579235, -73.579311],
  },
  {
    'Building': 'EN Annex',
    'code': 'EN',
    'xcoords': [45.496874, 45.4968502, 45.4969461, 45.496964],
    'ycoords': [-73.579808, -73.5797612, -73.5796669, -73.579705],
  },
  {
    'Building': 'ER Building',
    'code': 'ER',
    'xcoords': [45.496588, 45.496454, 45.496392, 45.496524],
    'ycoords': [-73.579785, -73.579893, -73.579752, -73.579629],
  },
  {
    'Building': 'FA Annex',
    'code': 'FA',
    'xcoords': [45.496852, 45.496945, 45.4969075, 45.496817],
    'ycoords': [-73.5797514, -73.579659, -73.579581, -73.579675],
  },
  {
    'Building': 'Faubourg Building',
    'code': 'FB',
    'xcoords': [45.494694, 45.494395, 45.494646, 45.494912],
    'ycoords': [-73.578029, -73.577519, -73.577214, -73.577766],
  },
  {
    'Building': 'Guy-De Maisonneuve Building',
    'code': 'GM',
    'xcoords': [45.495943, 45.495730, 45.495807, 45.496026],
    'ycoords': [-73.578975, -73.578626, -73.578558, -73.578903],
  },
  {
    'Building': 'Grey Nuns Building',
    'code': 'GN',
    'xcoords': [45.494110, 45.494024, 45.493350, 45.493436],
    'ycoords': [-73.576226, -73.576009, -73.576693, -73.576848],
  },
  {
    'Building': 'GS Building',
    'code': 'GS',
    'xcoords': [45.496639, 45.496507, 45.496473, 45.496592],
    'ycoords': [-73.581134, -73.581239, -73.581118, -73.581031],
  },
  {
    'Building': 'K Annex',
    'code': 'K',
    'xcoords': [45.497834, 45.497794, 45.497705, 45.497737],
    'ycoords': [-73.579535, -73.579470, -73.579558, -73.579630],
  },
  {
    'Building': 'LD Building',
    'code': 'LD',
    'xcoords': [45.496525, 45.496561, 45.496856, 45.496856],
    'ycoords': [-73.577388, -73.577459, -73.577164, -73.577164],
  },
  {
    'Building': 'Learning Square Building',
    'code': 'LS',
    'xcoords': [45.495952, 45.496111, 45.496177, 45.496156, 45.496188, 45.496052],
    'ycoords': [-73.579633, -73.579479, -73.579643, -73.579669, -73.579741, -73.579866],
  },
  {
    'Building': 'M Annex',
    'code': 'M',
    'xcoords': [45.497291, 45.497323, 45.497420, 45.497390],
    'ycoords': [-73.579778, -73.579845, -73.579751, -73.579681],
  },
  {
    'Building': 'MI Annex',
    'code': 'MI',
    'xcoords': [45.497777, 45.497809, 45.497645, 45.497621, 45.497694, 45.497682],
    'ycoords': [-73.579171, -73.579230, -73.579398, -73.579352, -73.579282, -73.579259],
  },
  {
    'Building': 'MU Annex',
    'code': 'MU',
    'xcoords': [45.497750, 45.497919, 45.497957, 45.497783],
    'ycoords': [-73.579628, -73.579464, -73.579541, -73.579698],
  },
  {
    'Building': 'P Annex',
    'code': 'P',
    'xcoords': [45.496584, 45.496675, 45.496720, 45.496626],
    'ycoords': [-73.579181, -73.579082, -73.579167, -73.579266],
  },
  {
    'Building': 'PR Annex',
    'code': 'PR',
    'xcoords': [45.496961, 45.497060, 45.497045, 45.496947],
    'ycoords': [-73.579973, -73.579867, -73.579839, -73.579941],
  },
  {
    'Building': 'Q Annex',
    'code': 'Q',
    'xcoords': [45.496554, 45.496582, 45.496670, 45.496643],
    'ycoords': [-73.579121, -73.579173, -73.579082, -73.579030],
  },
  {
    'Building': 'R Annex',
    'code': 'R',
    'xcoords': [45.496713, 45.496802, 45.496834, 45.496747],
    'ycoords': [-73.579424, -73.579330, -73.579400, -73.579483],
  },
  {
    'Building': 'RR Annex',
    'code': 'RR',
    'xcoords': [45.496649, 45.496791, 45.496756, 45.496613],
    'ycoords': [-73.579476, -73.579333, -73.579259, -73.579402],
  },
  {
    'Building': 'S Annex',
    'code': 'S',
    'xcoords': [45.497366, 45.497487, 45.497459, 45.497436, 45.497424, 45.497329],
    'ycoords': [-73.579931, -73.579815, -73.579756, -73.579776, -73.579762, -73.579860],
  },
  {
    'Building': 'Samuel Bronfman Building',
    'code': 'SB',
    'xcoords': [45.496533, 45.496541, 45.496621, 45.496672],
    'ycoords': [-73.586209, -73.586041, -73.585972, -73.586086],
  },
  {
    'Building': 'T Annex',
    'code': 'T',
    'xcoords': [45.496665, 45.496742, 45.496711, 45.496631],
    'ycoords': [-73.579336, -73.579256, -73.579189, -73.579269],
  },
  {
    'Building': 'Toronto Dominion Building',
    'code': 'TD',
    'xcoords': [45.494949, 45.495031, 45.495089, 45.495019],
    'ycoords': [-73.578178, -73.578083, -73.578230, -73.578318],
  },
  {
    'Building': 'V Annex',
    'code': 'V',
    'xcoords': [45.496968, 45.497069, 45.497085, 45.496981],
    'ycoords': [-73.579983, -73.579890, -73.579915, -73.580015],
  },
  {
    'Building': 'Visual Arts Building',
    'code': 'VA',
    'xcoords': [45.495406, 45.495670, 45.496167, 45.496060, 45.495809, 45.495656],
    'ycoords': [-73.573769, -73.574302, -73.573799, -73.573585, -73.573826, -73.573509],
  },
];

const CameraPosition sgwCampus = CameraPosition(
  target: LatLng(45.495835, -73.578789),
  zoom: 15.5,
);

const CameraPosition loyolaCampus = CameraPosition(
  target: LatLng(45.458257, -73.640450),
  zoom: 15.5,
);
