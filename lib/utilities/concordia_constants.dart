library concordia_constants;

import 'package:google_maps_flutter/google_maps_flutter.dart';

const concordiaUrl = 'https://www.concordia.ca';
const concordiaPhone = '(514) 848-2424';

const sgwCampus = {
  'name': 'Sir George Williams Campus',
  'code': 'SGW',
  'coordinates': LatLng(45.495835, -73.578789),
};

const loyolaCampus = {
  'name': 'Loyola Campus',
  'code': 'LOY',
  'coordinates': LatLng(45.458257, -73.640450),
};

const double poiZoomLevel = 17.5;
const double campusZoomLevel = 16.5;

const buildings = {
  // SGW Buildings
  'H': {
    'name': 'Hall Building',
    'coordinates': LatLng(45.497249, -73.578954),
    'vertices': [
      LatLng(45.4973844, -73.578354),
      LatLng(45.4968314, -73.5788502),
      LatLng(45.497175, -73.5795483),
      LatLng(45.4977167, -73.579045)
    ],
    'address': '1455 Maisonneuve Blvd W, Montreal, QC H3G 1M8',
    'campus': 'SGW Campus',
  },
  'LB': {
    'name': 'Webster Library',
    'coordinates': LatLng(45.496849, -73.578053),
    'vertices': [
      LatLng(45.496694, -73.578627),
      LatLng(45.497285, -73.578069),
      LatLng(45.496898, -73.577263),
      LatLng(45.4965677, -73.5776063),
      LatLng(45.4965014, -73.5774675),
      LatLng(45.4962589, -73.5776955)
    ],
    'address': '1400 Maisonneuve Blvd W, Montreal, QC H3G 1M8',
    'campus': 'SGW Campus',
  },
  'MB': {
    'name': 'John Molson Building',
    'coordinates': LatLng(45.495495, -73.579169),
    'vertices': [
      LatLng(45.495367, -73.579374),
      LatLng(45.495532, -73.579189),
      LatLng(45.495191, -73.578513),
      LatLng(45.495014, -73.578711)
    ],
    'address': '1450 Guy St, Montreal, QC H3H 1J5',
    'campus': 'SGW Campus',
  },
  'EV': {
    'name': 'EV Building',
    'coordinates': LatLng(45.495406, -73.577996),
    'vertices': [
      LatLng(45.495579, -73.578757),
      LatLng(45.4958504, -73.578472),
      LatLng(45.4956582, -73.5780395),
      LatLng(45.4960314, -73.5777019),
      LatLng(45.4958349, -73.5772469),
      LatLng(45.4952187, -73.577887)
    ],
    'address': '1515 Saint-Catherine St W, Montreal, QC H3G 2W1',
    'campus': 'SGW Campus',
  },
  'FG': {
    'name': 'Faubourg St-Catherines Building',
    'coordinates': LatLng(45.494354, -73.578428),
    'vertices': [
      LatLng(45.494296, -73.5785193),
      LatLng(45.4943677, -73.5784375),
      LatLng(45.494238, -73.5782266),
      LatLng(45.4941722, -73.5783051)
    ],
    'address': '1610 Saint-Catherine St W, Montreal, QC H3H 1L9',
    'campus': 'SGW Campus',
  },
  'B': {
    'name': 'ECA B-Annex',
    'coordinates': LatLng(0, 0),
    'vertices': [
      LatLng(45.497805, -73.57946),
      LatLng(45.497846, -73.579522),
      LatLng(45.497915, -73.579456),
      LatLng(45.497882, -73.579391)
    ],
    'address': '2160 Bishop St, Montreal, QC H3G 2E9',
    'campus': 'SGW Campus',
  },
  'CB': {
    'name': 'CB Building',
    'coordinates': LatLng(0, 0),
    'vertices': [
      LatLng(45.4952441, -73.5738566),
      LatLng(45.495403, -73.5741855),
      LatLng(45.4950591, -73.5745154),
      LatLng(45.4949339, -73.5742506),
      LatLng(45.4950613, -73.5741292),
      LatLng(45.4950291, -73.5740662),
      LatLng(45.4951059, -73.5739901),
      LatLng(45.4951346, -73.5740531),
      LatLng(45.495194, -73.5739947),
      LatLng(45.495163, -73.5739347)
    ],
    'address': '1425 René-Lévesque Blvd W, Montreal, QC H3G 1T7',
    'campus': 'SGW Campus',
  },
  'CI': {
    'name': 'CI Annex',
    'coordinates': LatLng(0, 0),
    'vertices': [
      LatLng(45.49737, -73.579938),
      LatLng(45.497402, -73.580014),
      LatLng(45.49758, -73.579835),
      LatLng(45.4975439, -73.5797592)
    ],
    'address': '2149 Mackay St, Montreal, QC H3G 2J2',
    'campus': 'SGW Campus',
  },
  'CL': {
    'name': 'CL Annex',
    'coordinates': LatLng(0, 0),
    'vertices': [
      LatLng(45.494251, -73.578928),
      LatLng(45.4941404, -73.5790782),
      LatLng(45.494339, -73.579427),
      LatLng(45.494465, -73.579285)
    ],
    'address': '1665 Saint-Catherine St W, Montreal, QC H3H 1L9',
    'campus': 'SGW Campus',
  },
  'D': {
    'name': 'D Annex',
    'coordinates': LatLng(0, 0),
    'vertices': [
      LatLng(45.497742, -73.57941),
      LatLng(45.4977059, -73.579339),
      LatLng(45.49781, -73.579235),
      LatLng(45.497848, -73.579311)
    ],
    'address': '2140 Bishop St, Montreal, QC H3G 2E9',
    'campus': 'SGW Campus',
  },
  'EN': {
    'name': 'EN Annex',
    'coordinates': LatLng(0, 0),
    'vertices': [
      LatLng(45.496874, -73.579808),
      LatLng(45.4968502, -73.5797612),
      LatLng(45.4969461, -73.5796669),
      LatLng(45.496964, -73.579705)
    ],
    'address': '2070 Mackay St, Montreal, QC H3G 2J1',
    'campus': 'SGW Campus',
  },
  'ER': {
    'name': 'ER Building',
    'coordinates': LatLng(0, 0),
    'vertices': [
      LatLng(45.496588, -73.579785),
      LatLng(45.496454, -73.579893),
      LatLng(45.496392, -73.579752),
      LatLng(45.496524, -73.579629)
    ],
    'address': '2155 Guy St, Montreal, QC H3H 2L9',
    'campus': 'SGW Campus',
  },
  'FA': {
    'name': 'FA Annex',
    'coordinates': LatLng(0, 0),
    'vertices': [
      LatLng(45.496852, -73.5797514),
      LatLng(45.496945, -73.579659),
      LatLng(45.4969075, -73.579581),
      LatLng(45.496817, -73.579675)
    ],
    'address': '2060 MacKay, Montreal, QC H3G 2J1',
    'campus': 'SGW Campus',
  },
  'FB': {
    'name': 'Faubourg Building',
    'coordinates': LatLng(0, 0),
    'vertices': [
      LatLng(45.494694, -73.578029),
      LatLng(45.494395, -73.577519),
      LatLng(45.494646, -73.577214),
      LatLng(45.494912, -73.577766)
    ],
    'address': '1250 Guy St, Montreal, QC H3H 2T4',
    'campus': 'SGW Campus',
  },
  'GM': {
    'name': 'Guy-De Maisonneuve Building',
    'coordinates': LatLng(0, 0),
    'vertices': [
      LatLng(45.495943, -73.578975),
      LatLng(45.49573, -73.578626),
      LatLng(45.495807, -73.578558),
      LatLng(45.496026, -73.578903)
    ],
    'address': '1550 De Maisonneuve West, Montreal, QC',
    'campus': 'SGW Campus',
  },
  'GN': {
    'name': 'Grey Nuns Building',
    'coordinates': LatLng(0, 0),
    'vertices': [
      LatLng(45.49411, -73.576226),
      LatLng(45.494024, -73.576009),
      LatLng(45.49335, -73.576693),
      LatLng(45.493436, -73.576848)
    ],
    'address': '1175 St Mathieu St, Montreal, QC H3H 2P7',
    'campus': 'SGW Campus',
  },
  'GS': {
    'name': 'GS Building',
    'coordinates': LatLng(0, 0),
    'vertices': [
      LatLng(45.496639, -73.581134),
      LatLng(45.496507, -73.581239),
      LatLng(45.496473, -73.581118),
      LatLng(45.496592, -73.581031)
    ],
    'address': '1538 Sherbrooke St W, Montreal, QC H3H 2L9',
    'campus': 'SGW Campus',
  },
  'K': {
    'name': 'K Annex',
    'coordinates': LatLng(0, 0),
    'vertices': [
      LatLng(45.497834, -73.579535),
      LatLng(45.497794, -73.57947),
      LatLng(45.497705, -73.579558),
      LatLng(45.497737, -73.57963)
    ],
    'address': '2150 Bishop St, Montreal, QC H3G 2E9',
    'campus': 'SGW Campus',
  },
  'LD': {
    'name': 'LD Building',
    'coordinates': LatLng(0, 0),
    'vertices': [
      LatLng(45.496525, -73.577388),
      LatLng(45.496561, -73.577459),
      LatLng(45.496856, -73.577164),
      LatLng(45.496856, -73.577164)
    ],
    'address': '1424 Bishop St, Montreal, QC H3G 2E6',
    'campus': 'SGW Campus',
  },
  'LS': {
    'name': 'Learning Square Building',
    'coordinates': LatLng(0, 0),
    'vertices': [
      LatLng(45.495952, -73.579633),
      LatLng(45.496111, -73.579479),
      LatLng(45.496177, -73.579643),
      LatLng(45.496156, -73.579669),
      LatLng(45.496188, -73.579741),
      LatLng(45.496052, -73.579866)
    ],
    'address': '1535 Boul. de Maisonneuve O, Montréal, QC H3G 1M9',
    'campus': 'SGW Campus',
  },
  'M': {
    'name': 'M Annex',
    'coordinates': LatLng(0, 0),
    'vertices': [
      LatLng(45.497291, -73.579778),
      LatLng(45.497323, -73.579845),
      LatLng(45.49742, -73.579751),
      LatLng(45.49739, -73.579681)
    ],
    'address': '2135 Mackay St, Montreal, QC H3G 2J2',
    'campus': 'SGW Campus',
  },
  'MI': {
    'name': 'MI Annex',
    'coordinates': LatLng(0, 0),
    'vertices': [
      LatLng(45.497777, -73.579171),
      LatLng(45.497809, -73.57923),
      LatLng(45.497645, -73.579398),
      LatLng(45.497621, -73.579352),
      LatLng(45.497694, -73.579282),
      LatLng(45.497682, -73.579259)
    ],
    'address': '2130 Bishop St, Montreal, QC H3G 2E9',
    'campus': 'SGW Campus',
  },
  'MU': {
    'name': 'MU Annex',
    'coordinates': LatLng(0, 0),
    'vertices': [
      LatLng(45.49775, -73.579628),
      LatLng(45.497919, -73.579464),
      LatLng(45.497957, -73.579541),
      LatLng(45.497783, -73.579698)
    ],
    'address': '2170 Bishop St, Montreal, QC H3G 2E9',
    'campus': 'SGW Campus',
  },
  'P': {
    'name': 'P Annex',
    'coordinates': LatLng(0, 0),
    'vertices': [
      LatLng(45.496584, -73.579181),
      LatLng(45.496675, -73.579082),
      LatLng(45.49672, -73.579167),
      LatLng(45.496626, -73.579266)
    ],
    'address': '2020 Mackay St, Montreal, QC H3G 2M2',
    'campus': 'SGW Campus',
  },
  'PR': {
    'name': 'PR Annex',
    'coordinates': LatLng(0, 0),
    'vertices': [
      LatLng(45.496961, -73.579973),
      LatLng(45.49706, -73.579867),
      LatLng(45.497045, -73.579839),
      LatLng(45.496947, -73.579941)
    ],
    'address': '2100 Mackay St, Montreal, QC H3G 2J1',
    'campus': 'SGW Campus',
  },
  'Q': {
    'name': 'Q Annex',
    'coordinates': LatLng(0, 0),
    'vertices': [
      LatLng(45.496554, -73.579121),
      LatLng(45.496582, -73.579173),
      LatLng(45.49667, -73.579082),
      LatLng(45.496643, -73.57903)
    ],
    'address': '2010 Mackay St, Montreal, QC H3G 2J1',
    'campus': 'SGW Campus',
  },
  'R': {
    'name': 'R Annex',
    'coordinates': LatLng(0, 0),
    'vertices': [
      LatLng(45.496713, -73.579424),
      LatLng(45.496802, -73.57933),
      LatLng(45.496834, -73.5794),
      LatLng(45.496747, -73.579483)
    ],
    'address': '2050 Mackay St, Montreal, QC H3G 2J1',
    'campus': 'SGW Campus',
  },
  'RR': {
    'name': 'RR Annex',
    'coordinates': LatLng(0, 0),
    'vertices': [
      LatLng(45.496649, -73.579476),
      LatLng(45.496791, -73.579333),
      LatLng(45.496756, -73.579259),
      LatLng(45.496613, -73.579402)
    ],
    'address': '2040 Mackay St, Montreal, QC H3G 2J1',
    'campus': 'SGW Campus',
  },
  'S': {
    'name': 'S Annex',
    'coordinates': LatLng(0, 0),
    'vertices': [
      LatLng(45.497366, -73.579931),
      LatLng(45.497487, -73.579815),
      LatLng(45.497459, -73.579756),
      LatLng(45.497436, -73.579776),
      LatLng(45.497424, -73.579762),
      LatLng(45.497329, -73.57986)
    ],
    'address': '2145 Mackay St, Montreal, QC H3G 2J2',
    'campus': 'SGW Campus',
  },
  'SB': {
    'name': 'Samuel Bronfman Building',
    'coordinates': LatLng(0, 0),
    'vertices': [
      LatLng(45.496533, -73.586209),
      LatLng(45.496541, -73.586041),
      LatLng(45.496621, -73.585972),
      LatLng(45.496672, -73.586086)
    ],
    'address': '1590 Docteur Penfield, Montreal, QC',
    'campus': 'SGW Campus',
  },
  'T': {
    'name': 'T Annex',
    'coordinates': LatLng(0, 0),
    'vertices': [
      LatLng(45.496665, -73.579336),
      LatLng(45.496742, -73.579256),
      LatLng(45.496711, -73.579189),
      LatLng(45.496631, -73.579269)
    ],
    'address': '2030 MacKay, Montreal, QC H3G 2J1',
    'campus': 'SGW Campus',
  },
  'TD': {
    'name': 'Toronto Dominion Building',
    'coordinates': LatLng(0, 0),
    'vertices': [
      LatLng(45.494949, -73.578178),
      LatLng(45.495031, -73.578083),
      LatLng(45.495089, -73.57823),
      LatLng(45.495019, -73.578318)
    ],
    'address': '1410 Guy St, Montreal, QC H3H 2L7',
    'campus': 'SGW Campus',
  },
  'V': {
    'name': 'V Annex',
    'coordinates': LatLng(0, 0),
    'vertices': [
      LatLng(45.496968, -73.579983),
      LatLng(45.497069, -73.57989),
      LatLng(45.497085, -73.579915),
      LatLng(45.496981, -73.580015)
    ],
    'address': '2110 Mackay St, Montreal, QC H3G 2J1',
    'campus': 'SGW Campus',
  },
  'VA': {
    'name': 'Visual Arts Building',
    'coordinates': LatLng(0, 0),
    'vertices': [
      LatLng(45.495406, -73.573769),
      LatLng(45.49567, -73.574302),
      LatLng(45.496167, -73.573799),
      LatLng(45.49606, -73.573585),
      LatLng(45.495809, -73.573826),
      LatLng(45.495656, -73.573509)
    ],
    'address': '1395 René-Lévesque W, Montreal, QC H3G 2M5',
    'campus': 'SGW Campus',
  },
  //******************************************************************************************************************
  // Loyola Buildings
  'AD': {
    'name': 'Administration Building',
    'coordinates': LatLng(0, 0),
    'vertices': [
      LatLng(45.457794, -73.639837),
      LatLng(45.457911, -73.640125),
      LatLng(45.457982, -73.640068),
      LatLng(45.457963, -73.64001),
      LatLng(45.45827, -73.639766),
      LatLng(45.458294, -73.63982),
      LatLng(45.458369, -73.639762),
      LatLng(45.45825, -73.639449),
      LatLng(45.45817, -73.639509),
      LatLng(45.458202, -73.639613),
      LatLng(45.458087, -73.63969),
      LatLng(45.458059, -73.639635),
      LatLng(45.457999, -73.639673),
      LatLng(45.458019, -73.639757),
      LatLng(45.457915, -73.639833),
      LatLng(45.457874, -73.639778)
    ],
    'address': '7141 Sherbrooke W, Montreal, QC H4B 1R6',
    'campus': 'Loyola Campus'
  },
  'BB': {
    'name': 'BB Annex',
    'coordinates': LatLng(0, 0),
    'vertices': [
      LatLng(45.459695, -73.639171),
      LatLng(45.459782, -73.639099),
      LatLng(45.459809, -73.639169),
      LatLng(45.459723, -73.639237)
    ],
    'address': '3502 Avenue Belmore, Montréal, QC H4B 2B9',
    'campus': 'Loyola Campus'
  },
  'BH': {
    'name': 'BH Annex',
    'coordinates': LatLng(0, 0),
    'vertices': [
      LatLng(45.459693, -73.63916),
      LatLng(45.459777, -73.639089),
      LatLng(45.45975, -73.639026),
      LatLng(45.459665, -73.639092)
    ],
    'address': '3500 Avenue Belmore, Montréal, QC H4B 2B9',
    'campus': 'Loyola Campus'
  },
  'CC': {
    'name': 'Central Building',
    'coordinates': LatLng(0, 0),
    'vertices': [
      LatLng(45.458075, -73.640015),
      LatLng(45.458215, -73.639907),
      LatLng(45.458509, -73.640686),
      LatLng(45.458379, -73.640794)
    ],
    'address': '7141 Sherbrooke W, Montreal, QC H4B 1R6',
    'campus': 'Loyola Campus'
  },
  'CJ': {
    'name': 'Communications Studies and Journalism Building',
    'coordinates': LatLng(0, 0),
    'vertices': [
      LatLng(45.457407, -73.640214),
      LatLng(45.457358, -73.640078),
      LatLng(45.457213, -73.64001),
      LatLng(45.457227, -73.639883),
      LatLng(45.457277, -73.639799),
      LatLng(45.457421, -73.639777),
      LatLng(45.45747, -73.639823),
      LatLng(45.457429, -73.640028),
      LatLng(45.457485, -73.640154),
      LatLng(45.457619, -73.640045),
      LatLng(45.457727, -73.640321),
      LatLng(45.457757, -73.6403),
      LatLng(45.457825, -73.640487),
      LatLng(45.457646, -73.640625),
      LatLng(45.4576, -73.640502),
      LatLng(45.457335, -73.640717),
      LatLng(45.457298, -73.64064),
      LatLng(45.457273, -73.640651),
      LatLng(45.457178, -73.640394)
    ],
    'address': '7141 Sherbrooke St, Montreal, QC H4B 1R2',
    'campus': 'Loyola Campus'
  },
  'DO': {
    'name': 'Stinger Dome',
    'coordinates': LatLng(0, 0),
    'vertices': [
      LatLng(45.457361, -73.637086),
      LatLng(45.456951, -73.636361),
      LatLng(45.457901, -73.635263),
      LatLng(45.458319, -73.63597)
    ],
    'address': '7141 Sherbrooke St, Montreal, QC H4B 1R2',
    'campus': 'Loyola Campus'
  },
  'FC': {
    'name': 'F.C. Smith Building',
    'coordinates': LatLng(0, 0),
    'vertices': [
      LatLng(45.458652, -73.639694),
      LatLng(45.458581, -73.639578),
      LatLng(45.45854, -73.639596),
      LatLng(45.458482, -73.639436),
      LatLng(45.458516, -73.63942),
      LatLng(45.458381, -73.639038),
      LatLng(45.458516, -73.638938),
      LatLng(45.458715, -73.639422),
      LatLng(45.458739, -73.63962)
    ],
    'address': '7141 Sherbrooke W, Montreal, QC H4B 1R6',
    'campus': 'Loyola Campus'
  },
  'GE': {
    'name': 'Centre for Structural and Functional Genomics',
    'coordinates': LatLng(0, 0),
    'vertices': [
      LatLng(45.456942, -73.640739),
      LatLng(45.456797, -73.640355),
      LatLng(45.457033, -73.64018),
      LatLng(45.457169, -73.640566)
    ],
    'address': '7141 Sherbrooke W, Montreal, QC H4B 1R6',
    'campus': 'Loyola Campus'
  },
  'HA': {
    'name': 'Hingston Hall - HA Wing',
    'coordinates': LatLng(0, 0),
    'vertices': [
      LatLng(45.459431, -73.641546),
      LatLng(45.459668, -73.64135),
      LatLng(45.459479, -73.640895),
      LatLng(45.459248, -73.641066)
    ],
    'address': '7141 Sherbrooke St, Montreal, QC H4B 1R2',
    'campus': 'Loyola Campus'
  },
  'HB': {
    'name': 'Hingston Hall - HB Wing',
    'coordinates': LatLng(0, 0),
    'vertices': [
      LatLng(45.459367, -73.641503),
      LatLng(45.45953, -73.641935),
      LatLng(45.459104, -73.642258),
      LatLng(45.458962, -73.641905),
      LatLng(45.459001, -73.641885),
      LatLng(45.458968, -73.641809)
    ],
    'address': '7141 Sherbrooke St, Montreal, QC H4B 1R2',
    'campus': 'Loyola Campus'
  },
  'HC': {
    'name': 'Hingston Hall - HC Wing',
    'coordinates': LatLng(0, 0),
    'vertices': [
      LatLng(45.459526, -73.642026),
      LatLng(45.459817, -73.641843),
      LatLng(45.459886, -73.642011),
      LatLng(45.45962, -73.642268)
    ],
    'address': '7141 Sherbrooke St, Montreal, QC H4B 1R2',
    'campus': 'Loyola Campus'
  },
  'HU': {
    'name': 'Applied Science Hub',
    'coordinates': LatLng(0, 0),
    'vertices': [
      LatLng(45.458201, -73.641672),
      LatLng(45.458635, -73.641371),
      LatLng(45.459225, -73.642782),
      LatLng(45.458789, -73.643153)
    ],
    'address': '7141 Sherbrooke St, Montreal, QC H4B 1R2',
    'campus': 'Loyola Campus'
  },
  'JR': {
    'name': 'Jesuit Residence',
    'coordinates': LatLng(0, 0),
    'vertices': [
      LatLng(45.458401, -73.643157),
      LatLng(45.458539, -73.643065),
      LatLng(45.458627, -73.643307),
      LatLng(45.458491, -73.643392)
    ],
    'address': '7141 Sherbrooke W, Montreal, QC H4B 1R6',
    'campus': 'Loyola Campus'
  },
  'PC': {
    'name': 'Perform Centre',
    'coordinates': LatLng(0, 0),
    'vertices': [
      LatLng(45.457018, -73.637827),
      LatLng(45.456692, -73.636991),
      LatLng(45.456939, -73.636797),
      LatLng(45.457266, -73.63762)
    ],
    'address': '7200 Sherbrooke St W, Montreal, QC H4B 1R2',
    'campus': 'Loyola Campus'
  },
  'PS': {
    'name': 'Physical Services Building',
    'coordinates': LatLng(0, 0),
    'vertices': [
      LatLng(45.4597016, -73.640309),
      LatLng(45.459403, -73.639525),
      LatLng(45.459332, -73.639574),
      LatLng(45.459286, -73.639461),
      LatLng(45.459597, -73.639221),
      LatLng(45.459964, -73.640121)
    ],
    'address': '7200 Sherbrooke St W, Montreal, QC H4B 1R2',
    'campus': 'Loyola Campus'
  },
  'PT': {
    'name': 'Oscar Peterson Concert Hall',
    'coordinates': LatLng(0, 0),
    'vertices': [
      LatLng(45.459216, -73.638938),
      LatLng(45.459344, -73.639228),
      LatLng(45.459477, -73.639135),
      LatLng(45.459351, -73.638829)
    ],
    'address': '7200 Sherbrooke St W, Montreal, QC H4B 1R2',
    'campus': 'Loyola Campus'
  },
  'PY': {
    'name': 'Psychology Building',
    'coordinates': LatLng(0, 0),
    'vertices': [
      LatLng(45.45927, -73.64052),
      LatLng(45.458875, -73.640812),
      LatLng(45.458759, -73.6404),
      LatLng(45.459107, -73.640121)
    ],
    'address': '7141 Sherbrooke W, Montreal, QC H4B 1R6',
    'campus': 'Loyola Campus'
  },
  'RA': {
    'name': 'Recreation and Athletics Complex',
    'coordinates': LatLng(0, 0),
    'vertices': [
      LatLng(45.457002, -73.637889),
      LatLng(45.456704, -73.637133),
      LatLng(45.456397, -73.637384),
      LatLng(45.456691, -73.63813)
    ],
    'address': '7200 Sherbrooke St W, Montreal, QC H4B 1R2',
    'campus': 'Loyola Campus'
  },
  'RF': {
    'name': 'Jesuit Hall and Conference Centre',
    'coordinates': LatLng(0, 0),
    'vertices': [
      LatLng(45.458806, -73.641156),
      LatLng(45.458505, -73.641373),
      LatLng(45.458484, -73.641318),
      LatLng(45.458548, -73.641264),
      LatLng(45.458509, -73.641138),
      LatLng(45.458427, -73.641199),
      LatLng(45.45838, -73.641079),
      LatLng(45.458473, -73.641009),
      LatLng(45.458418, -73.640854),
      LatLng(45.458538, -73.640762),
      LatLng(45.458591, -73.640876),
      LatLng(45.458681, -73.640802)
    ],
    'address': '7141 Sherbrooke W, Montreal, QC H4B 1R6',
    'campus': 'Loyola Campus'
  },
  'SC': {
    'name': 'Student Centre',
    'coordinates': LatLng(0, 0),
    'vertices': [
      LatLng(45.459279, -73.639276),
      LatLng(45.459158, -73.638991),
      LatLng(45.458995, -73.639122),
      LatLng(45.459106, -73.639414)
    ],
    'campus': 'Loyola Campus'
  },
  'SI': {
    'name': 'Saint Ignatius of Loyola',
    'coordinates': LatLng(0, 0),
    'vertices': [
      LatLng(45.457642, -73.642569),
      LatLng(45.458045, -73.642281),
      LatLng(45.457964, -73.64206),
      LatLng(45.457576, -73.642402)
    ],
    'address': '7141 Sherbrooke W, Montreal, QC H4B 1R6',
    'campus': 'Loyola Campus'
  },
  'SP': {
    'name': 'Richard J. Renaud Science Complex',
    'coordinates': LatLng(0, 0),
    'vertices': [
      LatLng(45.456991, -73.64083),
      LatLng(45.457199, -73.640683),
      LatLng(45.457529, -73.641478),
      LatLng(45.458163, -73.641006),
      LatLng(45.458321, -73.641422),
      LatLng(45.457676, -73.641946),
      LatLng(45.457638, -73.641845),
      LatLng(45.457433, -73.641996)
    ],
    'address': '7141 Sherbrooke W, Montreal, QC H4B 1R6',
    'campus': 'Loyola Campus'
  },
  'TA': {
    'name': 'Terrebonne Building',
    'coordinates': LatLng(0, 0),
    'vertices': [
      LatLng(45.459934, -73.640868),
      LatLng(45.45998, -73.640966),
      LatLng(45.460074, -73.640891),
      LatLng(45.460036, -73.6408)
    ],
    'address': '7079 Rue de Terrebonne, Montreal, QC H4B 1E1',
    'campus': 'Loyola Campus'
  },
  'VE': {
    'name': 'Vanier Extension',
    'coordinates': LatLng(0, 0),
    'vertices': [
      LatLng(45.458823, -73.638272),
      LatLng(45.45904, -73.638853),
      LatLng(45.458853, -73.639007),
      LatLng(45.458619, -73.638457)
    ],
    'address': '7141 Sherbrooke W, Montreal, QC H4B 1R6',
    'campus': 'Loyola Campus'
  },
  'VL': {
    'name': 'Vanier Library',
    'coordinates': LatLng(0, 0),
    'vertices': [
      LatLng(45.458886, -73.638176),
      LatLng(45.459108, -73.638796),
      LatLng(45.459295, -73.638651),
      LatLng(45.459127, -73.638209),
      LatLng(45.459208, -73.638133),
      LatLng(45.459083, -73.637873),
      LatLng(45.458909, -73.638),
      LatLng(45.458939, -73.638191)
    ],
    'address': '7141 Sherbrooke W, Montreal, QC H4B 1R6',
    'campus': 'Loyola Campus'
  },
};
