library concordia_constants;

import 'package:concordia_go/models/classroom.dart';
import 'package:concordia_go/models/concordia_building.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

const String concordiaUrl = 'https://www.concordia.ca';
const String concordiaPhone = '(514) 848-2424';
const String steps = 'steps';
const String instruction = 'html_instructions';
const String duration = 'duration';
const String distance = 'distance';
const String arrival_time = 'arrival_time';
const String text = 'text';
const String transit_details = 'transit_details';
const String arrival_stop = 'arrival_stop';
const String latitude = 'lat';
const String longitude = 'lng';
const String start_location = 'start_location';
const String location = 'location';
const String route = 'routes';
const String legs = 'legs';
const String polyline = 'polyline';
const String points = 'points';
const String travel_mode = 'travel_mode';
const String name = 'name';
const String driving = 'DRIVING';
const String walking = 'WALKING';
const String transit = 'TRANSIT';
const String campusSGW = 'SGW';
const String campusLoyola = 'Loyola';
const String stopCoordinates = 'stopCoordinates';
const String shuttlePath = 'shuttlePathPolyLine';
const String shuttleSchedule = 'departureSchedule';
const String restaurantHotspot = 'restaurants near me';
const String shoppingHotspot = 'shopping near me';
const String groceryHotspot = 'grocery store near me';
const String results = 'results';
const String address = 'formatted_address';
const String geometry = 'geometry';
const String icon = 'icon';
const String opening_hours = 'opening_hours';
const String open_now = 'open_now';
const String price_level = 'price_level';
const String rating = 'rating';

const Map<String, Object> sgwCampus = <String, dynamic>{
  'name': 'Sir George Williams Campus',
  'code': 'SGW',
  'coordinates': LatLng(45.495835, -73.578789),
};

const Map<String, Object> loyolaCampus = <String, dynamic>{
  'name': 'Loyola Campus',
  'code': 'LOY',
  'coordinates': LatLng(45.458257, -73.640450),
};

const double poiZoomLevel = 17.5;
const double campusZoomLevel = 16.0;
const double navZoomLevel = 16.0;

const Map<String, ConcordiaBuilding> buildings = <String, ConcordiaBuilding>{
  // SGW Buildings
  'H': ConcordiaBuilding(
    code: 'H',
    name: 'Hall Building',
    coordinates: LatLng(45.497282, -73.578931),
    vertices: <LatLng>[LatLng(45.4973844, -73.578354), LatLng(45.4968314, -73.5788502), LatLng(45.497175, -73.5795483), LatLng(45.4977167, -73.579045)],
    address: '1455 Maisonneuve Blvd W, Montreal, QC H3G 1M8',
    campus: Campus.SGW,
    hours: <String, String>{
      'Mon': '6:00 - 23:00',
      'Tue': '6:00 - 23:00',
      'Wed': '6:00 - 23:00',
      'Thu': '6:00 - 23:00',
      'Fri': '6:00 - 23:00',
      'Sat': '6:00 - 23:00',
      'Sun': '6:00 - 23:00',
    },
    services: <String>['Welcome Crew Office', 'DB Clarke Theatre', 'Dean of Students', 'Aboriginal Student Resource Centre', 'Concordia Student Union', 'IT Service Desk', 'Security Office', 'Student Success Centre', 'Mail Services', 'Archives', 'Career and Planning Services', 'Sexual Assault Resource Centre (SARC)'],
    departments: <String>['Geography, Planning and Environment', 'Poltiical Science, Sociology, Anthropology, and Economics', 'School of Irish Studies'],
  ),
  'LB': ConcordiaBuilding(
    code: 'LB',
    name: 'Webster Library',
    coordinates: LatLng(45.496806, -73.577878),
    vertices: <LatLng>[LatLng(45.496694, -73.578627), LatLng(45.497285, -73.578069), LatLng(45.496898, -73.577263), LatLng(45.4965677, -73.5776063), LatLng(45.4965014, -73.5774675), LatLng(45.4962589, -73.5776955)],
    address: '1400 Maisonneuve Blvd W, Montreal, QC H3G 1M8',
    campus: Campus.SGW,
    hours: <String, String>{
      'Mon': 'Open 24 h',
      'Tue': 'Open 24 h',
      'Wed': 'Open 24 h',
      'Thu': 'Open 24 h',
      'Fri': 'Open 24 h',
      'Sat': 'Open 24 h',
      'Sun': 'Open 24 h',
    },
    services: <String>['R. Howard Webster Library', 'Welcome Centre', 'Leonard and Bina Ellen Art Gallery', 'J.A. De Seve Cinema', 'Birks Students Service Centre', 'Campus Stores', 'Instructional and Information Technology Services (IITS)', '4th Space'],
    departments: <String>['English', 'History', 'French Studies', 'Mathematics and Statistics', 'Education', 'Centre for Interdisciplinary Studies in Society and Culture (CISSC)', 'Centre for the Study of Learning and Performance'],
  ),
  'MB': ConcordiaBuilding(
    code: 'MB',
    name: 'John Molson Building',
    coordinates: LatLng(45.495282, -73.579047),
    vertices: <LatLng>[LatLng(45.495367, -73.579374), LatLng(45.495532, -73.579189), LatLng(45.495191, -73.578513), LatLng(45.495014, -73.578711)],
    address: '1450 Guy St, Montreal, QC H3H 1J5',
    campus: Campus.SGW,
    hours: <String, String>{
      'none': 'Unavailable',
    },
    services: <String>[
      'Career Management Services',
      'John Molson Executive Centre',
      'Performing Arts Facilities',
    ],
    departments: <String>['Accountancy', 'Supply Chain and Business Technology Management', 'Finance', 'Management', 'Marketing', 'Goodman Institute of Investment Management', 'Executive MBA Program', 'Music', 'Theatre', 'Contemporary Dance'],
  ),
  'EV': ConcordiaBuilding(
    code: 'EV',
    name: 'EV Building',
    coordinates: LatLng(45.495541, -73.577939),
    vertices: <LatLng>[LatLng(45.495579, -73.578757), LatLng(45.4958504, -73.578472), LatLng(45.4956582, -73.5780395), LatLng(45.4960314, -73.5777019), LatLng(45.4958349, -73.5772469), LatLng(45.4952187, -73.577887)],
    address: '1515 Saint-Catherine St W, Montreal, QC H3G 2W1',
    campus: Campus.SGW,
    hours: <String, String>{
      'Mon': '6:30 - 23:00',
      'Tue': '6:30 - 23:00',
      'Wed': '6:30 - 23:00',
      'Thu': '6:30 - 23:00',
      'Fri': '6:30 - 23:00',
      'Sat': '6:30 - 23:00',
      'Sun': '6:30 - 23:00',
    },
    services: <String>[
      'LeGym',
      'FOFA Gallery',
    ],
    departments: <String>['Gina Cody School of Engineering and Computer Science', 'Electrical and Computer Engineering', 'Building, Civil and Environmental Engineering', 'Computer Science and Software Engineering', 'Mechanical, Industrial and Aerospace Engineering', 'Design and Computation Arts', 'Faculty of Fine Arts', 'Studio Arts', 'Art Education', 'Art History', 'Contemporary Dance', 'Recreation and Athletics', 'Zero Energy Building Studies', 'Centre for Pattern Recognition and Machine Intelligence', 'Centre for Composites'],
  ),
  'FG': ConcordiaBuilding(
    code: 'FG',
    name: 'Faubourg St-Catherines Building',
    coordinates: LatLng(45.494264, -73.578309),
    vertices: <LatLng>[LatLng(45.494296, -73.5785193), LatLng(45.4943677, -73.5784375), LatLng(45.494238, -73.5782266), LatLng(45.4941722, -73.5783051)],
    address: '1610 Saint-Catherine St W, Montreal, QC H3H 1L9',
    campus: Campus.SGW,
    hours: <String, String>{
      'none': 'Unavailable',
    },
    services: <String>['Classrooms'],
    departments: <String>['Education'],
  ),
  'B': ConcordiaBuilding(
    code: 'B',
    name: 'ECA B-Annex',
    coordinates: LatLng(45.497833, -73.579541),
    vertices: <LatLng>[LatLng(45.497932, -73.579502), LatLng(45.497761, -73.579663), LatLng(45.497726, -73.579595), LatLng(45.497894, -73.579428)],
    address: '2160 Bishop St, Montreal, QC H3G 2E9',
    campus: Campus.SGW,
    hours: <String, String>{
      'none': 'Unavailable',
    },
    services: <String>['Engineering and Computer Science Association'],
    departments: <String>['No departments in this building'],
  ),
  'CB': ConcordiaBuilding(
    code: 'CB',
    name: 'CB Building',
    coordinates: LatLng(45.495106, -73.574341),
    vertices: <LatLng>[LatLng(45.4952441, -73.5738566), LatLng(45.495403, -73.5741855), LatLng(45.4950591, -73.5745154), LatLng(45.4949339, -73.5742506), LatLng(45.4950613, -73.5741292), LatLng(45.4950291, -73.5740662), LatLng(45.4951059, -73.5739901), LatLng(45.4951346, -73.5740531), LatLng(45.495194, -73.5739947), LatLng(45.495163, -73.5739347)],
    address: '1425 René-Lévesque Blvd W, Montreal, QC H3G 1T7',
    campus: Campus.SGW,
    hours: <String, String>{
      'none': 'Unavailable',
    },
    services: <String>['No services in this building'],
    departments: <String>['No departments in this building'],
  ),
  'CI': ConcordiaBuilding(
    code: 'CI',
    name: 'CI Annex',
    coordinates: LatLng(45.497461, -73.579937),
    vertices: <LatLng>[LatLng(45.49737, -73.579938), LatLng(45.497402, -73.580014), LatLng(45.49758, -73.579835), LatLng(45.4975439, -73.5797592)],
    address: '2149 Mackay St, Montreal, QC H3G 2J2',
    campus: Campus.SGW,
    hours: <String, String>{
      'none': 'Unavailable',
    },
    services: <String>['No services in this building'],
    departments: <String>['School of Community and Public Affairs'],
  ),
  'CL': ConcordiaBuilding(
    code: 'CL',
    name: 'CL Annex',
    coordinates: LatLng(45.494320, -73.579283),
    vertices: <LatLng>[LatLng(45.494251, -73.578928), LatLng(45.4941404, -73.5790782), LatLng(45.494339, -73.579427), LatLng(45.494465, -73.579285)],
    address: '1665 Saint-Catherine St W, Montreal, QC H3H 1L9',
    campus: Campus.SGW,
    hours: <String, String>{
      'none': 'Unavailable',
    },
    services: <String>['Concordia Continueing Education'],
    departments: <String>['No departments in this building'],
  ),
  'D': ConcordiaBuilding(
    code: 'D',
    name: 'D Annex',
    coordinates: LatLng(45.497793, -73.579355),
    vertices: <LatLng>[LatLng(45.497857, -73.579345), LatLng(45.497752, -73.579444), LatLng(45.497726, -73.579400), LatLng(45.497738, -73.579389), LatLng(45.497726, -73.579366), LatLng(45.497822, -73.579273)],
    address: '2140 Bishop St, Montreal, QC H3G 2E9',
    campus: Campus.SGW,
    hours: <String, String>{
      'none': 'Unavailable',
    },
    services: <String>['No services in this building'],
    departments: <String>['Theological Studies'],
  ),
  'EN': ConcordiaBuilding(
    code: 'EN',
    name: 'EN Annex',
    coordinates: LatLng(45.496880, -73.579552),
    vertices: <LatLng>[LatLng(45.49693, -73.57955), LatLng(45.49689, -73.57947), LatLng(45.49679, -73.57958), LatLng(45.4968, -73.5796), LatLng(45.49667, -73.57973), LatLng(45.4967, -73.57978)],
    address: '2070 Mackay St, Montreal, QC H3G 2J1',
    campus: Campus.SGW,
    hours: <String, String>{
      'none': 'Unavailable',
    },
    services: <String>['No services in this building'],
    departments: <String>['No departments in this building'],
  ),
  'ER': ConcordiaBuilding(
    code: 'ER',
    name: 'ER Building',
    coordinates: LatLng(45.496483, -73.579756),
    vertices: <LatLng>[LatLng(45.496588, -73.579785), LatLng(45.496454, -73.579893), LatLng(45.496392, -73.579752), LatLng(45.496524, -73.579629)],
    address: '2155 Guy St, Montreal, QC H3H 2L9',
    campus: Campus.SGW,
    hours: <String, String>{
      'none': 'Unavailable',
    },
    services: <String>['No services in this building'],
    departments: <String>['No departments in this building'],
  ),
  'FA': ConcordiaBuilding(
    code: 'FA',
    name: 'FA Annex',
    coordinates: LatLng(45.496808, -73.579482),
    vertices: <LatLng>[LatLng(45.496872, -73.579488), LatLng(45.496774, -73.579586), LatLng(45.496741, -73.579496), LatLng(45.496831, -73.579395)],
    address: '2060 MacKay, Montreal, QC H3G 2J1',
    campus: Campus.SGW,
    hours: <String, String>{
      'none': 'Unavailable',
    },
    services: <String>['No services in this building'],
    departments: <String>['Religions and Cultures'],
  ),
  'FB': ConcordiaBuilding(
    code: 'FB',
    name: 'Faubourg Building',
    coordinates: LatLng(45.494736, -73.577733),
    vertices: <LatLng>[LatLng(45.494694, -73.578029), LatLng(45.494395, -73.577519), LatLng(45.494646, -73.577214), LatLng(45.494912, -73.577766)],
    address: '1250 Guy St, Montreal, QC H3H 2T4',
    campus: Campus.SGW,
    hours: <String, String>{
      'none': 'Unavailable',
    },
    services: <String>['Human Resources', 'Enrolment Services', 'Office of the Registrar', 'Student Recruitment', 'Examinations Office', 'Senior non-credit program'],
    departments: <String>['Classics, Modern Languages and Lingustics', 'Concordia Continueing Education', 'Mel Hoppenheim School of Cinema', 'Montreal Institute for Genocide and Human Rights Studies', 'District 3 Innovation Center'],
  ),
  'GA': ConcordiaBuilding(
    code: 'GA',
    name: 'Grey Nuns Annex',
    coordinates: LatLng(45.494154, -73.577851),
    vertices: <LatLng>[LatLng(45.494345, -73.577732), LatLng(45.494120, -73.577977), LatLng(45.494130, -73.578009), LatLng(45.493847, -73.578357), LatLng(45.493788, -73.578252), LatLng(45.494073, -73.577904), LatLng(45.494057, -73.577862), LatLng(45.494285, -73.577606)],
    address: '1211 - 1215 St-Mathieu St., Montreal, QC H3H 2S2',
    campus: Campus.SGW,
    hours: <String, String>{
      'none': 'Unavailable',
    },
    services: <String>['No services in this building'],
    departments: <String>['Department of Education'],
  ),
  'GM': ConcordiaBuilding(
    code: 'GM',
    name: 'Guy-De Maisonneuve Building',
    coordinates: LatLng(45.495879, -73.578704),
    vertices: <LatLng>[LatLng(45.495943, -73.578975), LatLng(45.49573, -73.578626), LatLng(45.495807, -73.578558), LatLng(45.496026, -73.578903)],
    address: '1550 De Maisonneuve West, Montreal, QC',
    campus: Campus.SGW,
    hours: <String, String>{
      'none': 'Unavailable',
    },
    services: <String>['Access Centre for Students with Disabilities', 'Environmental Health and Safety', 'Facilities Management', 'Financial Aid and Awards Office', 'Financial Services', 'Graduate Studies', 'Health Services', 'Institute for Co-operative Education', 'International Students Office', 'Offices of Rights and Responsibilities', 'Office of Sustainability', 'Office of the Chief Communications Office', 'Office of the President', 'Office of the Provost and VP, Academic', 'Office of the VP, Institutional Relations and Secretary General', 'Office of the VP Rsearch and Graduate Studies', 'Ombuds Office', 'University Communication Services'],
    departments: <String>['Contemporary Dance', 'Music', 'Theatre'],
  ),
  'GN': ConcordiaBuilding(
    code: 'GN',
    name: 'Grey Nuns Building',
    coordinates: LatLng(45.493978, -73.576233),
    vertices: <LatLng>[LatLng(45.49411, -73.576226), LatLng(45.494024, -73.576009), LatLng(45.49335, -73.576693), LatLng(45.493436, -73.576848)],
    address: '1175 St Mathieu St, Montreal, QC H3H 2P7',
    campus: Campus.SGW,
    hours: <String, String>{
      'none': 'Unavailable',
    },
    services: <String>['Residences', 'Grey Nuns Library', 'Daycare Centre', 'Summer Accommodation'],
    departments: <String>['No departments in this building'],
  ),
  'GS': ConcordiaBuilding(
    code: 'GS',
    name: 'GS Building',
    coordinates: LatLng(45.496566, -73.581150),
    vertices: <LatLng>[LatLng(45.496785, -73.581300), LatLng(45.496624, -73.581451), LatLng(45.496579, -73.581435), LatLng(45.496415, -73.580942), LatLng(45.496485, -73.580879), LatLng(45.496477, -73.580845), LatLng(45.496518, -73.580806), LatLng(45.496654, -73.581172), LatLng(45.496712, -73.581130)],
    address: '1538 Sherbrooke St W, Montreal, QC H3H 2L9',
    campus: Campus.SGW,
    hours: <String, String>{
      'none': 'Unavailable',
    },
    services: <String>['No services in this building'],
    departments: <String>['No departments in this building'],
  ),
  'K': ConcordiaBuilding(
    code: 'K',
    name: 'K Annex',
    coordinates: LatLng(45.497831, -73.579436),
    vertices: <LatLng>[LatLng(45.497890, -73.579424), LatLng(45.497643, -73.579669), LatLng(45.497604, -73.579589), LatLng(45.497687, -73.579509), LatLng(45.497713, -73.579559), LatLng(45.497760, -73.579514), LatLng(45.497753, -73.579497), LatLng(45.497782, -73.579471), LatLng(45.497770, -73.579439), LatLng(45.497861, -73.579355)],
    address: '2150 Bishop St, Montreal, QC H3G 2E9',
    campus: Campus.SGW,
    hours: <String, String>{
      'none': 'Unavailable',
    },
    services: <String>['Theological Studies'],
    departments: <String>['No departments in this building'],
  ),
  'LD': ConcordiaBuilding(
    code: 'LD',
    name: 'LD Building',
    coordinates: LatLng(45.496712, -73.577256),
    vertices: <LatLng>[LatLng(45.496860, -73.577169), LatLng(45.496558, -73.577477), LatLng(45.496532, -73.577405), LatLng(45.496822, -73.577093)],
    address: '1424 Bishop St, Montreal, QC H3G 2E6',
    campus: Campus.SGW,
    hours: <String, String>{
      'none': 'Unavailable',
    },
    services: <String>['CSU Daycare and Nursery'],
    departments: <String>['No departments in this building'],
  ),
  'LS': ConcordiaBuilding(
    code: 'LS',
    name: 'Learning Square Building',
    coordinates: LatLng(45.496344, -73.579494),
    vertices: <LatLng>[LatLng(45.496376, -73.579252), LatLng(45.496178, -73.579449), LatLng(45.496258, -73.579675), LatLng(45.496370, -73.579563), LatLng(45.496414, -73.579693), LatLng(45.496535, -73.579569)],
    address: '1535 Boul. de Maisonneuve O, Montréal, QC H3G 1M9',
    campus: Campus.SGW,
    hours: <String, String>{
      'none': 'Unavailable',
    },
    services: <String>['IT Services'],
    departments: <String>['No departments in this building'],
  ),
  'M': ConcordiaBuilding(
    code: 'M',
    name: 'M Annex',
    coordinates: LatLng(45.497344, -73.579783),
    vertices: <LatLng>[LatLng(45.497291, -73.579778), LatLng(45.497323, -73.579845), LatLng(45.49742, -73.579751), LatLng(45.49739, -73.579681)],
    address: '2135 Mackay St, Montreal, QC H3G 2J2',
    campus: Campus.SGW,
    hours: <String, String>{
      'none': 'Unavailable',
    },
    services: <String>['No services in this building'],
    departments: <String>['No departments in this building'],
  ),
  'MI': ConcordiaBuilding(
    code: 'MI',
    name: 'MI Annex',
    coordinates: LatLng(45.497758, -73.579288),
    vertices: <LatLng>[LatLng(45.497820, -73.579272), LatLng(45.497710, -73.579379), LatLng(45.497689, -73.579329), LatLng(45.497702, -73.579319), LatLng(45.497695, -73.579302), LatLng(45.497791, -73.579206)],
    address: '2130 Bishop St, Montreal, QC H3G 2E9',
    campus: Campus.SGW,
    hours: <String, String>{
      'none': 'Unavailable',
    },
    services: <String>['ACUMAE', 'SCOMM', 'CUSSU', 'CUUSS-TS', 'CULEU', 'CUPEU', 'CUCEPTFU'],
    departments: <String>['No departments in this building'],
  ),
  'MU': ConcordiaBuilding(
    code: 'MU',
    name: 'MU Annex',
    coordinates: LatLng(45.497873, -73.579610),
    vertices: <LatLng>[LatLng(45.497972, -73.579572), LatLng(45.497800, -73.579738), LatLng(45.497763, -73.579665), LatLng(45.497936, -73.579502)],
    address: '2170 Bishop St, Montreal, QC H3G 2E9',
    campus: Campus.SGW,
    hours: <String, String>{
      'none': 'Unavailable',
    },
    services: <String>['Simone de Beauvoir Institute'],
    departments: <String>['No departments in this building'],
  ),
  'P': ConcordiaBuilding(
    code: 'P',
    name: 'P Annex',
    coordinates: LatLng(45.496662, -73.579162),
    vertices: <LatLng>[LatLng(45.496584, -73.579181), LatLng(45.496675, -73.579082), LatLng(45.49672, -73.579167), LatLng(45.496626, -73.579266)],
    address: '2020 Mackay St, Montreal, QC H3G 2M2',
    campus: Campus.SGW,
    hours: <String, String>{
      'none': 'Unavailable',
    },
    services: <String>['No services in this building'],
    departments: <String>['No departments in this building'],
  ),
  'PR': ConcordiaBuilding(
    code: 'PR',
    name: 'PR Annex',
    coordinates: LatLng(45.497010, -73.579908),
    vertices: <LatLng>[LatLng(45.496961, -73.579973), LatLng(45.49706, -73.579867), LatLng(45.497045, -73.579839), LatLng(45.496947, -73.579941)],
    address: '2100 Mackay St, Montreal, QC H3G 2J1',
    campus: Campus.SGW,
    hours: <String, String>{
      'none': 'Unavailable',
    },
    services: <String>['No services in this building'],
    departments: <String>['No departments in this building'],
  ),
  'Q': ConcordiaBuilding(
    code: 'Q',
    name: 'Q Annex',
    coordinates: LatLng(45.496620, -73.579091),
    vertices: <LatLng>[LatLng(45.496554, -73.579121), LatLng(45.496582, -73.579173), LatLng(45.49667, -73.579082), LatLng(45.496643, -73.57903)],
    address: '2010 Mackay St, Montreal, QC H3G 2J1',
    campus: Campus.SGW,
    hours: <String, String>{
      'none': 'Unavailable',
    },
    services: <String>["Ethnic Students' Association"],
    departments: <String>['No departments in this building'],
  ),
  'R': ConcordiaBuilding(
    code: 'R',
    name: 'R Annex',
    coordinates: LatLng(45.496796, -73.579466),
    vertices: <LatLng>[LatLng(45.496713, -73.579424), LatLng(45.496802, -73.57933), LatLng(45.496834, -73.5794), LatLng(45.496747, -73.579483)],
    address: '2050 Mackay St, Montreal, QC H3G 2J1',
    campus: Campus.SGW,
    hours: <String, String>{
      'none': 'Unavailable',
    },
    services: <String>['No services in this building'],
    departments: <String>['Religions and Cultures'],
  ),
  'RR': ConcordiaBuilding(
    code: 'RR',
    name: 'RR Annex',
    coordinates: LatLng(45.496773, -73.579411),
    vertices: <LatLng>[LatLng(45.496649, -73.579476), LatLng(45.496791, -73.579333), LatLng(45.496756, -73.579259), LatLng(45.496613, -73.579402)],
    address: '2040 Mackay St, Montreal, QC H3G 2J1',
    campus: Campus.SGW,
    hours: <String, String>{
      'none': 'Unavailable',
    },
    services: <String>['No services in this building'],
    departments: <String>['Liberal Arts College'],
  ),
  'S': ConcordiaBuilding(
    code: 'S',
    name: 'S Annex',
    coordinates: LatLng(45.497387, -73.579850),
    vertices: <LatLng>[LatLng(45.497366, -73.579931), LatLng(45.497487, -73.579815), LatLng(45.497459, -73.579756), LatLng(45.497436, -73.579776), LatLng(45.497424, -73.579762), LatLng(45.497329, -73.57986)],
    address: '2145 Mackay St, Montreal, QC H3G 2J2',
    campus: Campus.SGW,
    hours: <String, String>{
      'none': 'Unavailable',
    },
    services: <String>['No services in this building'],
    departments: <String>['Department of Philosophy'],
  ),
  'SB': ConcordiaBuilding(
    code: 'SB',
    name: 'Samuel Bronfman Building',
    coordinates: LatLng(45.496585, -73.586140),
    vertices: <LatLng>[LatLng(45.496533, -73.586209), LatLng(45.496541, -73.586041), LatLng(45.496621, -73.585972), LatLng(45.496672, -73.586086)],
    address: '1590 Docteur Penfield, Montreal, QC',
    campus: Campus.SGW,
    hours: <String, String>{
      'none': 'Unavailable',
    },
    services: <String>['Arts and Science Research Groups'],
    departments: <String>['No departments in this building'],
  ),
  'T': ConcordiaBuilding(
    code: 'T',
    name: 'T Annex',
    coordinates: LatLng(45.496702, -73.579254),
    vertices: <LatLng>[LatLng(45.496665, -73.579336), LatLng(45.496742, -73.579256), LatLng(45.496711, -73.579189), LatLng(45.496631, -73.579269)],
    address: '2030 MacKay, Montreal, QC H3G 2J1',
    campus: Campus.SGW,
    hours: <String, String>{
      'none': 'Unavailable',
    },
    services: <String>['Graduate Students Association'],
    departments: <String>['No departments in this building'],
  ),
  'TD': ConcordiaBuilding(
    code: 'TD',
    name: 'Toronto Dominion Building',
    coordinates: LatLng(45.494677, -73.578728),
    vertices: <LatLng>[LatLng(45.494949, -73.578178), LatLng(45.495031, -73.578083), LatLng(45.495089, -73.57823), LatLng(45.495019, -73.578318)],
    address: '1410 Guy St, Montreal, QC H3H 2L7',
    campus: Campus.SGW,
    hours: <String, String>{
      'none': 'Unavailable',
    },
    services: <String>['CUSP'],
    departments: <String>['No departments in this building'],
  ),
  'V': ConcordiaBuilding(
    code: 'V',
    name: 'V Annex',
    coordinates: LatLng(45.497031, -73.579940),
    vertices: <LatLng>[LatLng(45.496968, -73.579983), LatLng(45.497069, -73.57989), LatLng(45.497085, -73.579915), LatLng(45.496981, -73.580015)],
    address: '2110 Mackay St, Montreal, QC H3G 2J1',
    campus: Campus.SGW,
    hours: <String, String>{
      'none': 'Unavailable',
    },
    services: <String>['CUTV', 'Centre 2110'],
    departments: <String>['No departments in this building'],
  ),
  'VA': ConcordiaBuilding(
    code: 'VA',
    name: 'Visual Arts Building',
    coordinates: LatLng(45.495589, -73.573750),
    vertices: <LatLng>[LatLng(45.495406, -73.573769), LatLng(45.49567, -73.574302), LatLng(45.496167, -73.573799), LatLng(45.49606, -73.573585), LatLng(45.495809, -73.573826), LatLng(45.495656, -73.573509)],
    address: '1395 René-Lévesque W, Montreal, QC H3G 2M5',
    campus: Campus.SGW,
    hours: <String, String>{
      'none': 'Unavailable',
    },
  ),
  'X': ConcordiaBuilding(
    code: 'X',
    name: 'X Annex',
    coordinates: LatLng(45.496921, -73.579760),
    vertices: <LatLng>[
      LatLng(45.4969, -73.57981),
      LatLng(45.49698, -73.57974),
      LatLng(45.49695, -73.57967),
      LatLng(45.49685, -73.57976),
      LatLng(45.49687, -73.57981),
      LatLng(45.49689, -73.57979),
    ],
    address: '2080 Mackay, Montreal, QC H3G 2J1',
    campus: Campus.SGW,
    hours: <String, String>{
      'none': 'Unavailable',
    },
    services: <String>['Concordia International'],
    departments: <String>['No departments in this building'],
  ),
  'Z': ConcordiaBuilding(
    code: 'Z',
    name: 'Z Annex',
    coordinates: LatLng(45.496964, -73.579823),
    vertices: <LatLng>[LatLng(45.49702, -73.57982), LatLng(45.49698, -73.57975), LatLng(45.49689, -73.57983), LatLng(45.49693, -73.57991)],
    address: '2090 Mackay, Montreal, QC H3G 2J1',
    campus: Campus.SGW,
    hours: <String, String>{
      'none': 'Unavailable',
    },
    services: <String>['Multi-Faith and Spirituality Centre', 'Sustainable Concordia'],
    departments: <String>['No departments in this building'],
  ),
  //******************************************************************************************************************
  // Loyola Buildings
  'AD': ConcordiaBuilding(
    code: 'AD',
    name: 'Administration Building',
    coordinates: LatLng(45.457896, -73.639878),
    vertices: <LatLng>[LatLng(45.457794, -73.639837), LatLng(45.457911, -73.640125), LatLng(45.457982, -73.640068), LatLng(45.457963, -73.64001), LatLng(45.45827, -73.639766), LatLng(45.458294, -73.63982), LatLng(45.458369, -73.639762), LatLng(45.45825, -73.639449), LatLng(45.45817, -73.639509), LatLng(45.458202, -73.639613), LatLng(45.458087, -73.63969), LatLng(45.458059, -73.639635), LatLng(45.457999, -73.639673), LatLng(45.458019, -73.639757), LatLng(45.457915, -73.639833), LatLng(45.457874, -73.639778)],
    address: '7141 Sherbrooke W, Montreal, QC H4B 1R6',
    campus: Campus.Loyola,
    hours: <String, String>{
      'none': 'Unavailable',
    },
    services: <String>['Welcome Crew Office', 'Centre for Teaching and Learning', 'Loyola International College', 'Provost and VP, Academic', 'Dean of Students', 'Concordia Multi-Faith and Spirituality Centre', 'Advocacy and Support Services', 'Access Centre for Students with Disabilities', 'Counseling and Development', 'Health Services'],
    departments: <String>['Faculty of Arts and Science'],
  ),
  'BB': ConcordiaBuilding(
    code: 'BB',
    name: 'BB Annex',
    coordinates: LatLng(45.459766, -73.639174),
    vertices: <LatLng>[LatLng(45.459695, -73.639171), LatLng(45.459782, -73.639099), LatLng(45.459809, -73.639169), LatLng(45.459723, -73.639237)],
    address: '3502 Avenue Belmore, Montréal, QC H4B 2B9',
    campus: Campus.Loyola,
    hours: <String, String>{
      'none': 'Unavailable',
    },
    services: <String>["CPE Les P'tits Profs Paycare"],
    departments: <String>['No departments in this building'],
  ),
  'BH': ConcordiaBuilding(
    code: 'BH',
    name: 'BH Annex',
    coordinates: LatLng(45.459698, -73.639083),
    vertices: <LatLng>[LatLng(45.459693, -73.63916), LatLng(45.459777, -73.639089), LatLng(45.45975, -73.639026), LatLng(45.459665, -73.639092)],
    address: '3500 Avenue Belmore, Montréal, QC H4B 2B9',
    campus: Campus.Loyola,
    hours: <String, String>{
      'none': 'Unavailable',
    },
    services: <String>["CPE Les P'tits Profs Daycare"],
    departments: <String>['No departments in this building'],
  ),
  'CC': ConcordiaBuilding(
    code: 'CC',
    name: 'Central Building',
    coordinates: LatLng(45.458354, -73.640408),
    vertices: <LatLng>[LatLng(45.458075, -73.640015), LatLng(45.458215, -73.639907), LatLng(45.458509, -73.640686), LatLng(45.458379, -73.640794)],
    address: '7141 Sherbrooke W, Montreal, QC H4B 1R6',
    campus: Campus.Loyola,
    hours: <String, String>{
      'none': 'Unavailable',
    },
    services: <String>['Concordia Student Union'],
    departments: <String>['Loyola College for Diversity and Sustainability and Loyola'],
  ),
  'CJ': ConcordiaBuilding(
    code: 'CJ',
    name: 'Communications Studies and Journalism Building',
    coordinates: LatLng(45.457297, -73.640383),
    vertices: <LatLng>[LatLng(45.457407, -73.640214), LatLng(45.457358, -73.640078), LatLng(45.457213, -73.64001), LatLng(45.457227, -73.639883), LatLng(45.457277, -73.639799), LatLng(45.457421, -73.639777), LatLng(45.45747, -73.639823), LatLng(45.457429, -73.640028), LatLng(45.457485, -73.640154), LatLng(45.457619, -73.640045), LatLng(45.457727, -73.640321), LatLng(45.457757, -73.6403), LatLng(45.457825, -73.640487), LatLng(45.457646, -73.640625), LatLng(45.4576, -73.640502), LatLng(45.457335, -73.640717), LatLng(45.457298, -73.64064), LatLng(45.457273, -73.640651), LatLng(45.457178, -73.640394)],
    address: '7141 Sherbrooke St, Montreal, QC H4B 1R2',
    campus: Campus.Loyola,
    hours: <String, String>{
      'none': 'Unavailable',
    },
    services: <String>['Campus Retail Stores'],
    departments: <String>['Communication Studies', 'Journalism'],
  ),
  'DO': ConcordiaBuilding(
    code: 'DO',
    name: 'Stinger Dome',
    coordinates: LatLng(45.457675, -73.636149),
    vertices: <LatLng>[LatLng(45.457361, -73.637086), LatLng(45.456951, -73.636361), LatLng(45.457901, -73.635263), LatLng(45.458319, -73.63597)],
    address: '7141 Sherbrooke St, Montreal, QC H4B 1R2',
    campus: Campus.Loyola,
    hours: <String, String>{
      'none': 'Unavailable',
    },
    services: <String>['No services in this building'],
    departments: <String>['Stingers.ca'],
  ),
  'FC': ConcordiaBuilding(
    code: 'FC',
    name: 'F.C. Smith Building',
    coordinates: LatLng(45.458503, -73.639233),
    vertices: <LatLng>[LatLng(45.458652, -73.639694), LatLng(45.458581, -73.639578), LatLng(45.45854, -73.639596), LatLng(45.458482, -73.639436), LatLng(45.458516, -73.63942), LatLng(45.458381, -73.639038), LatLng(45.458516, -73.638938), LatLng(45.458715, -73.639422), LatLng(45.458739, -73.63962)],
    address: '7141 Sherbrooke W, Montreal, QC H4B 1R6',
    campus: Campus.Loyola,
    hours: <String, String>{
      'none': 'Unavailable',
    },
    services: <String>['F.C. Smith Auditorium', 'Cazalet Theater', 'Concordia Multi-Faith and Spirituality Centre'],
    departments: <String>['No departments in this building'],
  ),
  'GE': ConcordiaBuilding(
    code: 'GE',
    name: 'Centre for Structural and Functional Genomics',
    coordinates: LatLng(45.456916, -73.640400),
    vertices: <LatLng>[LatLng(45.456942, -73.640739), LatLng(45.456797, -73.640355), LatLng(45.457033, -73.64018), LatLng(45.457169, -73.640566)],
    address: '7141 Sherbrooke W, Montreal, QC H4B 1R6',
    campus: Campus.Loyola,
    hours: <String, String>{
      'none': 'Unavailable',
    },
    services: <String>['Centre for Structural and Functionality Genomics'],
    departments: <String>['No departments in this building'],
  ),
  'HA': ConcordiaBuilding(
    code: 'HA',
    name: 'Hingston Hall - HA Wing',
    coordinates: LatLng(45.459424, -73.641190),
    vertices: <LatLng>[LatLng(45.459431, -73.641546), LatLng(45.459668, -73.64135), LatLng(45.459479, -73.640895), LatLng(45.459248, -73.641066)],
    address: '7141 Sherbrooke St, Montreal, QC H4B 1R2',
    campus: Campus.Loyola,
    hours: <String, String>{
      'none': 'Unavailable',
    },
    services: <String>['Student Residence'],
    departments: <String>['No departments in this building'],
  ),
  'HB': ConcordiaBuilding(
    code: 'HB',
    name: 'Hingston Hall - HB Wing',
    coordinates: LatLng(45.459122, -73.641905),
    vertices: <LatLng>[LatLng(45.459367, -73.641503), LatLng(45.45953, -73.641935), LatLng(45.459104, -73.642258), LatLng(45.458962, -73.641905), LatLng(45.459001, -73.641885), LatLng(45.458968, -73.641809)],
    address: '7141 Sherbrooke St, Montreal, QC H4B 1R2',
    campus: Campus.Loyola,
    hours: <String, String>{
      'none': 'Unavailable',
    },
    services: <String>['Student Residence', 'CUFA'],
    departments: <String>['No departments in this building'],
  ),
  'HC': ConcordiaBuilding(
    code: 'HC',
    name: 'Hingston Hall - HC Wing',
    coordinates: LatLng(45.459628, -73.641984),
    vertices: <LatLng>[LatLng(45.459526, -73.642026), LatLng(45.459817, -73.641843), LatLng(45.459886, -73.642011), LatLng(45.45962, -73.642268)],
    address: '7141 Sherbrooke St, Montreal, QC H4B 1R2',
    campus: Campus.Loyola,
    hours: <String, String>{
      'none': 'Unavailable',
    },
    services: <String>['Student Residence'],
    departments: <String>['No departments in this building'],
  ),
  'HU': ConcordiaBuilding(
    code: 'HU',
    name: 'Applied Science Hub',
    coordinates: LatLng(45.458610, -73.641825),
    vertices: <LatLng>[LatLng(45.458201, -73.641672), LatLng(45.458635, -73.641371), LatLng(45.459225, -73.642782), LatLng(45.458789, -73.643153)],
    address: '7141 Sherbrooke St, Montreal, QC H4B 1R2',
    campus: Campus.Loyola,
    hours: <String, String>{
      'none': 'Unavailable',
    },
    services: <String>['No services in this building'],
    departments: <String>['No departments in this building'],
  ),
  'JR': ConcordiaBuilding(
    code: 'JR',
    name: 'Jesuit Residence',
    coordinates: LatLng(45.458521, -73.643241),
    vertices: <LatLng>[LatLng(45.458401, -73.643157), LatLng(45.458539, -73.643065), LatLng(45.458627, -73.643307), LatLng(45.458491, -73.643392)],
    address: '7141 Sherbrooke W, Montreal, QC H4B 1R6',
    campus: Campus.Loyola,
    hours: <String, String>{
      'none': 'Unavailable',
    },
    services: <String>['Student Residence'],
    departments: <String>['No departments in this building'],
  ),
  'PC': ConcordiaBuilding(
    code: 'PC',
    name: 'Perform Centre',
    coordinates: LatLng(45.457083, -73.637636),
    vertices: <LatLng>[LatLng(45.457018, -73.637827), LatLng(45.456692, -73.636991), LatLng(45.456939, -73.636797), LatLng(45.457266, -73.63762)],
    address: '7200 Sherbrooke St W, Montreal, QC H4B 1R2',
    campus: Campus.Loyola,
    hours: <String, String>{
      'none': 'Unavailable',
    },
    services: <String>['PERFORM Centre'],
    departments: <String>['No departments in this building'],
  ),
  'PS': ConcordiaBuilding(
    code: 'PS',
    name: 'Physical Services Building',
    coordinates: LatLng(45.459713, -73.639762),
    vertices: <LatLng>[LatLng(45.4597016, -73.640309), LatLng(45.459403, -73.639525), LatLng(45.459332, -73.639574), LatLng(45.459286, -73.639461), LatLng(45.459597, -73.639221), LatLng(45.459964, -73.640121)],
    address: '7200 Sherbrooke St W, Montreal, QC H4B 1R2',
    campus: Campus.Loyola,
    hours: <String, String>{
      'none': 'Unavailable',
    },
    services: <String>['Environmental Health and Safety', 'Facilities Management'],
    departments: <String>['No departments in this building'],
  ),
  'PT': ConcordiaBuilding(
    code: 'PT',
    name: 'Oscar Peterson Concert Hall',
    coordinates: LatLng(45.459068, -73.638630),
    vertices: <LatLng>[LatLng(45.459216, -73.638938), LatLng(45.459344, -73.639228), LatLng(45.459477, -73.639135), LatLng(45.459351, -73.638829)],
    address: '7200 Sherbrooke St W, Montreal, QC H4B 1R2',
    campus: Campus.Loyola,
    hours: <String, String>{
      'none': 'Unavailable',
    },
    services: <String>['Concert Hall'],
    departments: <String>['Oscar Peterson Concert Hall'],
  ),
  'PY': ConcordiaBuilding(
    code: 'PY',
    name: 'Psychology Building',
    coordinates: LatLng(45.458899, -73.640494),
    vertices: <LatLng>[LatLng(45.45927, -73.64052), LatLng(45.458875, -73.640812), LatLng(45.458759, -73.6404), LatLng(45.459107, -73.640121)],
    address: '7141 Sherbrooke W, Montreal, QC H4B 1R6',
    campus: Campus.Loyola,
    hours: <String, String>{
      'none': 'Unavailable',
    },
    services: <String>['No services in this building'],
    departments: <String>['Psychology', 'Centre for Clinical Research in Health'],
  ),
  'RA': ConcordiaBuilding(
    code: 'RA',
    name: 'Recreation and Athletics Complex',
    coordinates: LatLng(45.456624, -73.637358),
    vertices: <LatLng>[LatLng(45.457002, -73.637889), LatLng(45.456704, -73.637133), LatLng(45.456397, -73.637384), LatLng(45.456691, -73.63813)],
    address: '7200 Sherbrooke St W, Montreal, QC H4B 1R2',
    campus: Campus.Loyola,
    hours: <String, String>{
      'none': 'Unavailable',
    },
    services: <String>['Ed Meagher Arena', 'Gymnasium'],
    departments: <String>['No departments in this building'],
  ),
  'RF': ConcordiaBuilding(
    code: 'RF',
    name: 'Jesuit Hall and Conference Centre',
    coordinates: LatLng(45.458442, -73.640920),
    vertices: <LatLng>[LatLng(45.458806, -73.641156), LatLng(45.458505, -73.641373), LatLng(45.458484, -73.641318), LatLng(45.458548, -73.641264), LatLng(45.458509, -73.641138), LatLng(45.458427, -73.641199), LatLng(45.45838, -73.641079), LatLng(45.458473, -73.641009), LatLng(45.458418, -73.640854), LatLng(45.458538, -73.640762), LatLng(45.458591, -73.640876), LatLng(45.458681, -73.640802)],
    address: '7141 Sherbrooke W, Montreal, QC H4B 1R6',
    campus: Campus.Loyola,
    hours: <String, String>{
      'none': 'Unavailable',
    },
    services: <String>['Loyola Jesuit Hall and Conference Centre', 'Conference Services'],
    departments: <String>['No departments in this building'],
  ),
  'SC': ConcordiaBuilding(
    code: 'SC',
    name: 'Student Centre',
    coordinates: LatLng(45.459122, -73.639237),
    vertices: <LatLng>[LatLng(45.459279, -73.639276), LatLng(45.459158, -73.638991), LatLng(45.458995, -73.639122), LatLng(45.459106, -73.639414)],
    address: '7141 Sherbrooke W, Montreal, QC H4B 1R6',
    campus: Campus.Loyola,
    hours: <String, String>{
      'none': 'Unavailable',
    },
    services: <String>['Campus Centre', 'Food Services', 'Cafeteria', 'Cafe'],
    departments: <String>['No departments in this building'],
  ),
  'SI': ConcordiaBuilding(
    code: 'SI',
    name: 'Saint Ignatius of Loyola',
    coordinates: LatLng(45.457796, -73.642391),
    vertices: <LatLng>[LatLng(45.457642, -73.642569), LatLng(45.458045, -73.642281), LatLng(45.457964, -73.64206), LatLng(45.457576, -73.642402)],
    address: '7141 Sherbrooke W, Montreal, QC H4B 1R6',
    campus: Campus.Loyola,
    hours: <String, String>{
      'none': 'Unavailable',
    },
    services: <String>['No services in this building'],
    departments: <String>['No departments in this building'],
  ),
  'SP': ConcordiaBuilding(
    code: 'SP',
    name: 'Richard J. Renaud Science Complex',
    coordinates: LatLng(45.457599, -73.641775),
    vertices: <LatLng>[LatLng(45.456991, -73.64083), LatLng(45.457199, -73.640683), LatLng(45.457529, -73.641478), LatLng(45.458163, -73.641006), LatLng(45.458321, -73.641422), LatLng(45.457676, -73.641946), LatLng(45.457638, -73.641845), LatLng(45.457433, -73.641996)],
    address: '7141 Sherbrooke W, Montreal, QC H4B 1R6',
    campus: Campus.Loyola,
    hours: <String, String>{
      'none': 'Unavailable',
    },
    services: <String>['Science College', 'Science Technical Centre', 'Animal Care Facilities', 'Security Office', 'Cafe'],
    departments: <String>[
      'Biology',
      'Chemistry and Biochemistry',
      'Health, Kinesiology and Applied Physiology',
      'Physics',
      'Psychology',
      'Centre for Biological Applications of Mass Spectrometry',
      'Centre for NanoScience Research',
      'Center for Studies in Behavioral Neurobiology',
      'Centre for Research in Molecular Modeling',
    ],
  ),
  'TA': ConcordiaBuilding(
    code: 'TA',
    name: 'Terrebonne Building',
    coordinates: LatLng(45.459997, -73.640904),
    vertices: <LatLng>[LatLng(45.459934, -73.640868), LatLng(45.45998, -73.640966), LatLng(45.460074, -73.640891), LatLng(45.460036, -73.6408)],
    address: '7079 Rue de Terrebonne, Montreal, QC H4B 1E1',
    campus: Campus.Loyola,
    hours: <String, String>{
      'none': 'Unavailable',
    },
    services: <String>['No services in this building'],
    departments: <String>['No departments in this building'],
  ),
  'VE': ConcordiaBuilding(
    code: 'VE',
    name: 'Vanier Extension',
    coordinates: LatLng(45.458714, -73.638604),
    vertices: <LatLng>[LatLng(45.458823, -73.638272), LatLng(45.45904, -73.638853), LatLng(45.458853, -73.639007), LatLng(45.458619, -73.638457)],
    address: '7141 Sherbrooke W, Montreal, QC H4B 1R6',
    campus: Campus.Loyola,
    hours: <String, String>{
      'none': 'Unavailable',
    },
    services: <String>['Library'],
    departments: <String>['Applied Human Sciences'],
  ),
  'VL': ConcordiaBuilding(
    code: 'VL',
    name: 'Vanier Library',
    coordinates: LatLng(45.459102, -73.638568),
    vertices: <LatLng>[LatLng(45.458886, -73.638176), LatLng(45.459108, -73.638796), LatLng(45.459295, -73.638651), LatLng(45.459127, -73.638209), LatLng(45.459208, -73.638133), LatLng(45.459083, -73.637873), LatLng(45.458909, -73.638), LatLng(45.458939, -73.638191)],
    address: '7141 Sherbrooke W, Montreal, QC H4B 1R6',
    campus: Campus.Loyola,
    hours: <String, String>{
      'none': 'Unavailable',
    },
    services: <String>['Library'],
    departments: <String>['No departments in this building'],
  ),
};

final List<Classroom> rooms = <Classroom>[
  // region H building rooms
  /// H1
  Classroom(buildings['H'], '1', '110'),

  /// H8
  Classroom(buildings['H'], '8', '801'),
  Classroom(buildings['H'], '8', '803'),
  Classroom(buildings['H'], '8', '805'),
  Classroom(buildings['H'], '8', '807'),
  Classroom(buildings['H'], '8', '811'),
  Classroom(buildings['H'], '8', '813'),
  Classroom(buildings['H'], '8', '815'),
  Classroom(buildings['H'], '8', '817'),
  Classroom(buildings['H'], '8', '819'),
  Classroom(buildings['H'], '8', '820'),
  Classroom(buildings['H'], '8', '821'),
  Classroom(buildings['H'], '8', '822'),
  Classroom(buildings['H'], '8', '823'),
  Classroom(buildings['H'], '8', '825'),
  Classroom(buildings['H'], '8', '827'),
  Classroom(buildings['H'], '8', '829'),
  Classroom(buildings['H'], '8', '831'),
  Classroom(buildings['H'], '8', '832'),
  Classroom(buildings['H'], '8', '833'),
  Classroom(buildings['H'], '8', '835'),
  Classroom(buildings['H'], '8', '837'),
  Classroom(buildings['H'], '8', '841'),
  Classroom(buildings['H'], '8', '842'),
  Classroom(buildings['H'], '8', '843'),
  Classroom(buildings['H'], '8', '845'),
  Classroom(buildings['H'], '8', '847'),
  Classroom(buildings['H'], '8', '849'),
  Classroom(buildings['H'], '8', '851'),
  Classroom(buildings['H'], '8', '852'),
  Classroom(buildings['H'], '8', '853'),
  Classroom(buildings['H'], '8', '854'),
  Classroom(buildings['H'], '8', '855'),
  Classroom(buildings['H'], '8', '857'),
  Classroom(buildings['H'], '8', '859'),
  Classroom(buildings['H'], '8', '861'),
  Classroom(buildings['H'], '8', '862'),
  Classroom(buildings['H'], '8', '863'),
  Classroom(buildings['H'], '8', '865'),
  Classroom(buildings['H'], '8', '867'),

  /// H9
  Classroom(buildings['H'], '9', '903'),
  Classroom(buildings['H'], '9', '907'),
  Classroom(buildings['H'], '9', '909'),
  Classroom(buildings['H'], '9', '911'),
  Classroom(buildings['H'], '9', '913'),
  Classroom(buildings['H'], '9', '914'),
  Classroom(buildings['H'], '9', '915'),
  Classroom(buildings['H'], '9', '917'),
  Classroom(buildings['H'], '9', '919'),
  Classroom(buildings['H'], '9', '920'),
  Classroom(buildings['H'], '9', '921'),
  Classroom(buildings['H'], '9', '923'),
  Classroom(buildings['H'], '9', '925'),
  Classroom(buildings['H'], '9', '927'),
  Classroom(buildings['H'], '9', '928'),
  Classroom(buildings['H'], '9', '929'),
  Classroom(buildings['H'], '9', '933'),
  Classroom(buildings['H'], '9', '937'),
  Classroom(buildings['H'], '9', '941'),
  Classroom(buildings['H'], '9', '943'),
  Classroom(buildings['H'], '9', '945'),
  Classroom(buildings['H'], '9', '961'),
  Classroom(buildings['H'], '9', '962'),
  Classroom(buildings['H'], '9', '963'),
  Classroom(buildings['H'], '9', '964'),
  Classroom(buildings['H'], '9', '965'),
  Classroom(buildings['H'], '9', '966'),
  Classroom(buildings['H'], '9', '967'),
  Classroom(buildings['H'], '9', '968'),
  Classroom(buildings['H'], '9', '980'),
  Classroom(buildings['H'], '9', '981'),

  // endregion H building rooms

  //Region MB building Rooms
//  Classroom(buildings['MB'], '1', '115'),
//  Classroom(buildings['MB'], '1', '130'),
  Classroom(buildings['MB'], '1', '210'),
//  Classroom(buildings['MB'], '1', '301'),
//  Classroom(buildings['MB'], '1', '347'),
//  Classroom(buildings['MB'], '1', '349'),
//  Classroom(buildings['MB'], '1', '410'),
//  Classroom(buildings['MB'], '1', '424'),
//  Classroom(buildings['MB'], '1', '432'),
//  Classroom(buildings['MB'], '1', '437'),
//  Classroom(buildings['MB'], '1', '493'),
];

// region floor plan edges
const Map<String, List<List<int>>> edges = <String, List<List<int>>>{
  /*
     -1 : not connected
      0 : itself
      1 : [ 1,  5)mm
      2 : [ 5, 10)mm
      3 : [10, 15)mm
      4 : [15, 20)mm
      5 : [20, 25)mm
      6 : [25, 30)mm
      7 : [30, 35)mm
      8 : [35, 40)mm
      9 : [40, ++)mm
   */
  // region H1 floor plan edges
  'H1': <List<int>>[
    //  0, 1, 2, 3, 4, 5, 6, 7, 8, 9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30
    /* 0*/ <int>[0, 4, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /* 1*/ <int>[4, 0, 8, -1, -1, -1, -1, -1, -1, 4, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /* 2*/ <int>[-1, 8, 0, 7, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1],
    /* 3*/ <int>[-1, -1, 7, 0, 8, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1],
    /* 4*/ <int>[-1, -1, -1, 8, 0, 4, 3, 5, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /* 5*/ <int>[-1, -1, -1, -1, 4, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /* 6*/ <int>[-1, -1, -1, -1, 3, -1, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 2],
    /* 7*/ <int>[-1, -1, -1, -1, 5, -1, -1, 0, 9, -1, -1, -1, -1, -1, -1, -1, -1, -1, 8, -1, -1, -1, -1, -1, 1, 1, 1, 1, 1, 1, -1],
    /* 8*/ <int>[-1, -1, -1, -1, -1, -1, -1, 9, 0, 4, 3, -1, -1, -1, -1, -1, -1, -1, 3, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /* 9*/ <int>[-1, 4, -1, -1, -1, -1, -1, -1, 3, 0, 5, 4, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*10*/ <int>[-1, -1, -1, -1, -1, -1, -1, -1, 3, 5, 0, 4, 5, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*11*/ <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, 4, 4, 0, 6, 7, -1, -1, -1, -1, -1, 9, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*12*/ <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 5, 6, 0, 4, -1, 1, -1, 8, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*13*/ <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 7, 4, 0, 6, -1, -1, 6, -1, 9, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*14*/ <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 6, 0, -1, -1, 4, -1, 9, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*15*/ <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*16*/ <int>[-1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*17*/ <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 8, 6, 4, -1, -1, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*18*/ <int>[-1, -1, -1, -1, -1, -1, -1, 8, 3, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*19*/ <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 9, -1, 9, 9, -1, -1, -1, -1, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*20*/ <int>[-1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*21*/ <int>[1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*22*/ <int>[-1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1, -1, -1, -1, -1, -1, -1, -1],
    /*23*/ <int>[-1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1, -1, -1, -1, -1, -1, -1],
    /*24*/ <int>[-1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1, -1, -1, -1, -1, -1],
    /*25*/ <int>[-1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1, -1, -1, -1, -1],
    /*26*/ <int>[-1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1, -1, -1, -1],
    /*27*/ <int>[-1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1, -1, -1],
    /*28*/ <int>[-1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1, -1],
    /*29*/ <int>[-1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1],
    /*30*/ <int>[-1, -1, -1, -1, -1, -1, 2, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0],
  ],
  // endregion H1 floor plan edges

  // region H8 floor plan edges
  'H8': <List<int>>[
    //  0, 1, 2, 3, 4, 5, 6, 7, 8, 9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92
    /* 0*/
    <int>[0, 6, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 5, 2, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /* 1*/
    <int>[6, 0, 2, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /* 2*/
    <int>[-1, 2, 0, 3, 5, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /* 3*/
    <int>[-1, -1, 3, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /* 4*/
    <int>[-1, -1, 5, -1, 0, 4, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /* 5*/
    <int>[-1, -1, -1, -1, 4, 0, 4, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 7, -1, -1, 5, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /* 6*/
    <int>[-1, -1, -1, -1, -1, 4, 0, 4, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /* 7*/
    <int>[-1, -1, -1, -1, -1, -1, 4, 0, 4, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1],
    /* 8*/
    <int>[-1, -1, -1, -1, -1, -1, -1, 4, 0, 2, 5, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /* 9*/
    <int>[-1, -1, -1, -1, -1, -1, -1, -1, 2, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*10*/
    <int>[-1, -1, -1, -1, -1, -1, -1, -1, 5, -1, 0, 5, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*11*/
    <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 3, 0, 5, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*12*/
    <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 5, 0, 4, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 9, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*13*/
    <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 4, 0, 4, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 9, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*14*/
    <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 4, 0, 4, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*15*/
    <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 4, 0, 2, 4, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*16*/
    <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 2, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*17*/
    <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 4, -1, 0, 4, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1],
    /*18*/
    <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 4, 0, 4, 4, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*19*/
    <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 4, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*20*/
    <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 4, -1, 0, 4, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 7, 5, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*21*/
    <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 4, 0, 3, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*22*/
    <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 3, 0, 4, 2, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*23*/
    <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 4, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*24*/
    <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 2, -1, 0, 4, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*25*/
    <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 4, 0, 4, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1],
    /*26*/
    <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 4, 0, 4, 6, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*27*/
    <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 4, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*28*/
    <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 6, -1, 0, 3, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*29*/
    <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 3, 0, 4, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*30*/
    <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 4, 0, 4, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*31*/
    <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 4, 0, 4, -1, -1, 4, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*32*/
    <int>[5, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 4, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*33*/
    <int>[2, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*34*/
    <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, 1, -1, -1, -1, -1, -1, -1, -1],
    /*35*/
    <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 4, -1, -1, -1, 0, 2, -1, -1, 4, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1],
    /*36*/
    <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 2, 0, 2, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*37*/
    <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 2, 0, 2, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*38*/
    <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 2, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*39*/
    <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 4, -1, -1, -1, 0, 4, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1],
    /*40*/
    <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 4, 0, 3, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1],
    /*41*/
    <int>[-1, -1, -1, -1, -1, 7, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 3, 0, 9, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*42*/
    <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 7, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 9, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1],
    /*43*/
    <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 5, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*44*/
    <int>[-1, -1, -1, -1, -1, 5, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*45*/
    <int>[1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*46*/
    <int>[-1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*47*/
    <int>[-1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*48*/
    <int>[-1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*49*/
    <int>[-1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*50*/
    <int>[-1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*51*/
    <int>[-1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*52*/
    <int>[-1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*53*/
    <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*54*/
    <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*55*/
    <int>[-1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*56*/
    <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 9, 9, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*57*/
    <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*58*/
    <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*59*/
    <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*60*/
    <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*61*/
    <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*62*/
    <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*63*/
    <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*64*/
    <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*65*/
    <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*66*/
    <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*67*/
    <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*68*/
    <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*69*/
    <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*70*/
    <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*71*/
    <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*72*/
    <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*73*/
    <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*74*/
    <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*75*/
    <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*76*/
    <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*77*/
    <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*78*/
    <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*79*/
    <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*80*/
    <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*81*/
    <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*82*/
    <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*83*/
    <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*84*/
    <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1, -1, -1, -1, -1, -1, -1, -1],
    /*85*/
    <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1, -1, -1, -1, -1, -1, -1],
    /*86*/
    <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1, -1, -1, -1, -1, -1],
    /*87*/
    <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1, -1, -1, -1, -1],
    /*88*/
    <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1, -1, -1, -1],
    /*89*/
    <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1, -1, -1],
    /*90*/
    <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1, -1],
    /*91*/
    <int>[-1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1],
    /*92*/
    <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0],
  ],
  // endregion H8 floor plan edges

  // region H9 floor plan edges
  'H9': <List<int>>[
    //  0, 1, 2, 3, 4, 5, 6, 7, 8, 9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79
    /* 0*/ <int>[0, 9, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 4, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /* 1*/ <int>[9, 0, 4, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /* 2*/ <int>[-1, 4, 0, 4, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 4, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /* 3*/ <int>[-1, -1, 4, 0, 4, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /* 4*/ <int>[-1, -1, -1, 4, 0, 5, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1],
    /* 5*/ <int>[-1, -1, -1, -1, 5, 0, 2, 4, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /* 6*/ <int>[-1, -1, -1, -1, -1, 2, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /* 7*/ <int>[-1, -1, -1, -1, -1, 4, -1, 0, 4, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /* 8*/ <int>[-1, -1, -1, -1, -1, -1, -1, 4, 0, 5, 4, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 9, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /* 9*/ <int>[-1, -1, -1, -1, -1, -1, -1, -1, 5, 0, 2, 3, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 9, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*10*/ <int>[-1, -1, -1, -1, -1, -1, -1, -1, 4, 2, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*11*/ <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, 3, -1, 0, 3, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 9, -1, -1, -1, -1, -1, -1, -1, -1],
    /*12*/ <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 3, 0, 3, -1, -1, -1, 4, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*13*/ <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 3, 0, 6, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*14*/ <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 6, 0, 5, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, 1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*15*/ <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 5, 0, 4, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*16*/ <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 4, 0, -1, 4, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 9, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*17*/ <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 4, -1, -1, -1, -1, 0, 2, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1],
    /*18*/ <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 4, 2, 0, 4, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*19*/ <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 4, 0, 2, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 9, -1, -1, -1, -1, -1, -1, -1, -1],
    /*20*/ <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 2, 0, 2, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 4, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*21*/ <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 2, 0, 3, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 9, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*22*/ <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 3, 0, 4, -1, -1, -1, -1, -1, -1, -1, 5, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*23*/ <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 4, 0, 2, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1],
    /*24*/ <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 2, 0, 2, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*25*/ <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 2, 0, 3, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*26*/ <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 3, 0, 9, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*27*/ <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 9, 0, 4, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*28*/ <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 4, 0, 6, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*29*/ <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 6, 0, 6, 8, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*30*/ <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 6, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*31*/ <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 5, -1, -1, -1, -1, -1, -1, 8, -1, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, 1, -1, -1, -1, -1, -1],
    /*32*/ <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 4, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, 6, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1],
    /*33*/ <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 6, 0, 3, -1, -1, -1, -1, 4, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*34*/ <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 3, 0, 4, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1],
    /*35*/ <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 4, 0, 4, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1],
    /*36*/ <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 4, 0, 4, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1],
    /*37*/ <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 4, 0, 4, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*38*/ <int>[4, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 4, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*39*/ <int>[-1, -1, 4, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 4, -1, -1, -1, -1, -1, 0, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*40*/ <int>[-1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*41*/ <int>[1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*42*/ <int>[-1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*43*/ <int>[-1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*44*/ <int>[-1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*45*/ <int>[-1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*46*/ <int>[-1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*47*/ <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*48*/ <int>[-1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*49*/ <int>[-1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*50*/ <int>[-1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*51*/ <int>[-1, -1, -1, -1, -1, -1, -1, -1, 9, 9, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*52*/ <int>[-1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*53*/ <int>[-1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*54*/ <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*55*/ <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*56*/ <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*57*/ <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*58*/ <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*59*/ <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 9, -1, -1, -1, -1, 9, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*60*/ <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*61*/ <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*62*/ <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*63*/ <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*64*/ <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*65*/ <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*66*/ <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*67*/ <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*68*/ <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*69*/ <int>[1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*70*/ <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*71*/ <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 9, -1, -1, -1, -1, -1, -1, -1, 9, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1, -1, -1, -1, -1, -1, -1, -1],
    /*72*/ <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1, -1, -1, -1, -1, -1, -1],
    /*73*/ <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1, -1, -1, -1, -1, -1],
    /*74*/ <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1, -1, -1, -1, -1],
    /*75*/ <int>[-1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1, -1, -1, -1],
    /*76*/ <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1, -1, -1],
    /*77*/ <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1, -1],
    /*78*/ <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1],
    /*79*/ <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0],
  ],
  // endregion H9 floor plans edges

  // region MB1 floor plan edges
  'MB1': <List<int>>[
    //  0, 1, 2, 3, 4, 5, 6, 7, 8, 9,10,11,12,13,14,15,16,17,18,19,20,21,22
    /* 0*/ <int>[0, 3, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, 4, -1, -1],
    /* 1*/ <int>[3, 0, 2, 6, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 4, -1, -1],
    /* 2*/ <int>[-1, 2, 0, -1, -1, -1, 9, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, 3, -1, -1, -1, -1, -1],
    /* 3*/ <int>[-1, 6, -1, 0, 2, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 3, -1, -1],
    /* 4*/ <int>[-1, -1, -1, 2, 0, 5, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1],
    /* 5*/ <int>[-1, -1, -1, -1, 5, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /* 6*/ <int>[-1, -1, 9, -1, -1, -1, 0, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, 4, -1, 4, 4],
    /* 7*/ <int>[-1, -1, -1, -1, -1, -1, -1, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 6, 5],
    /* 8*/ <int>[-1, -1, -1, -1, -1, -1, -1, -1, 0, 4, 4, 6, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 3],
    /* 9*/ <int>[-1, -1, -1, -1, -1, -1, -1, -1, 4, 0, 3, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*10*/ <int>[-1, -1, -1, -1, -1, -1, -1, -1, 4, 3, 0, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1],
    /*11*/ <int>[-1, -1, -1, -1, -1, -1, -1, -1, 6, -1, -1, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*12*/ <int>[1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*13*/ <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1],
    /*14*/ <int>[-1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, 0, -1, -1, -1, -1, -1, -1, -1, -1],
    /*15*/ <int>[-1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1, -1, -1, -1, -1, -1, -1],
    /*16*/ <int>[-1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1, -1, -1, -1, -1, -1],
    /*17*/ <int>[-1, -1, 3, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1, -1, -1, -1, -1],
    /*18*/ <int>[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, 0, -1, -1, -1, -1],
    /*19*/ <int>[-1, -1, -1, -1, -1, -1, 4, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1, 3, -1],
    /*20*/ <int>[4, 4, -1, 3, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1, -1],
    /*21*/ <int>[-1, -1, -1, -1, -1, -1, 4, 6, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 3, -1, 0, -1],
    /*22*/ <int>[-1, -1, -1, -1, -1, -1, 4, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0],
  ],
  // endregion MB1 floor plan edges
};

// endregion floor plan edges

// region floor plan edge matrix indices

const Map<String, List<String>> edge_indices = <String, List<String>>{
  // region H1 edge matrix indices
  'H1': <String>[
    // index
    '000000', // 0,
    '000001', // 1,
    '000002', // 2,
    '000003', // 3,
    '000004', // 4,
    '000005', // 5,
    '000006', // 6,
    '000007', // 7,
    '000008', // 8,
    '000009', // 9,
    '000010', // 10
    '000011', // 11
    '000012', // 12
    '000013', // 13
    '000014', // 14
    '990000', // 15
    '990001', // 16
    '140000', // 17
    '180000', // 18
    '100110', // 19
    '150001', // 20
    '150000', // 21
    '170000', // 22
    '130000', // 23
    '120000', // 24
    '120001', // 25
    '110000', // 26
    '110001', // 27
    '110002', // 28
    '110003', // 29
    '110004', // 30
  ],
  // endregion H1 edge matrix indices
  // region H8 edge matrix indices
  'H8': <String>[
    // index
    '000000', // 0,
    '000001', // 1,
    '000002', // 2,
    '000003', // 3,
    '000004', // 4,
    '000005', // 5,
    '000006', // 6,
    '000007', // 7,
    '000008', // 8,
    '000009', // 9,
    '000010', // 10
    '000011', // 11
    '000012', // 12
    '000013', // 13
    '000014', // 14
    '000015', // 15
    '000016', // 16
    '000017', // 17
    '000018', // 18
    '000019', // 19
    '000020', // 20
    '000021', // 21
    '000022', // 22
    '000023', // 23
    '000024', // 24
    '000025', // 25
    '000026', // 26
    '000027', // 27
    '000028', // 28
    '000029', // 29
    '000030', // 30
    '000031', // 31
    '000032', // 32
    '000033', // 33
    '000034', // 34
    '000035', // 35
    '000036', // 36
    '000037', // 37
    '000038', // 38
    '000039', // 39
    '000040', // 40
    '000041', // 41
    '000042', // 42
    '140000', // 43
    '140001', // 44
    '100801', // 45
    '150000', // 46
    '100803', // 47
    '100805', // 48
    '100807', // 49
    '150001', // 50
    '100811', // 51
    '100813', // 52
    '100815', // 53
    '100817', // 54
    '100819', // 55
    '100820', // 56
    '100821', // 57
    '100822', // 58
    '100823', // 59
    '100825', // 60
    '100827', // 61
    '100829', // 62
    '100831', // 63
    '100832', // 64
    '100833', // 65
    '100835', // 66
    '100837', // 67
    '100841', // 68
    '100842', // 69
    '100843', // 70
    '100845', // 71
    '100847', // 72
    '100849', // 73
    '100851', // 74
    '100852', // 75
    '100853', // 76
    '100854', // 77
    '100855', // 78
    '100857', // 79
    '100859', // 80
    '100861', // 81
    '100862', // 82
    '100863', // 83
    '100865', // 84
    '100867', // 85
    '120000', // 86
    '120001', // 87
    '110000', // 88
    '110001', // 89
    '110002', // 90
    '110003', // 91
    '130000', // 92
  ],
  // endregion H8 edge matrix indices
  // region H9 edge matrix indices
  'H9': <String>[
    // index
    '000000', // 0,
    '000001', // 1,
    '000002', // 2,
    '000003', // 3,
    '000004', // 4,
    '000005', // 5,
    '000006', // 6,
    '000007', // 7,
    '000008', // 8,
    '000009', // 9,
    '000010', // 10
    '000011', // 11
    '000012', // 12
    '000013', // 13
    '000014', // 14
    '000015', // 15
    '000016', // 16
    '000017', // 17
    '000018', // 18
    '000019', // 19
    '000020', // 20
    '000021', // 21
    '000022', // 22
    '000023', // 23
    '000024', // 24
    '000025', // 25
    '000026', // 26
    '000027', // 27
    '000028', // 28
    '000029', // 29
    '000030', // 30
    '000031', // 31
    '000032', // 32
    '000033', // 33
    '000034', // 34
    '000035', // 35
    '000036', // 36
    '000037', // 37
    '000038', // 38
    '000039', // 39
    '150000', // 40
    '100903', // 41
    '100907', // 42
    '100909', // 43
    '150001', // 44
    '100911', // 45
    '100913', // 46
    '100914', // 47
    '100915', // 48
    '100917', // 49
    '100919', // 50
    '100920', // 51
    '100921', // 52
    '100923', // 53
    '100925', // 54
    '100927', // 55
    '100928', // 56
    '100929', // 57
    '100933', // 58
    '100937', // 59
    '100941', // 60
    '100943', // 61
    '100945', // 62
    '100961', // 63
    '100962', // 64
    '100963', // 65
    '100964', // 66
    '100965', // 67
    '100966', // 68
    '100967', // 69
    '100968', // 70
    '100980', // 71
    '100981', // 72
    '110000', // 73
    '110001', // 74
    '110002', // 75
    '110003', // 76
    '130000', // 77
    '120000', // 78
    '120001', // 79
  ],
  // endregion H9 edge matrix indices
  // region MB1 edge matrix indices
  'MB1': <String>[
    // index
    '000000', // 0,
    '000001', // 1,
    '000002', // 2,
    '000003', // 3,
    '000004', // 4,
    '000005', // 5,
    '000006', // 6,
    '000007', // 7,
    '000008', // 8,
    '000009', // 9,
    '000010', // 10
    '000011', // 11
    '990000', // 12
    '990001', // 13
    '100210', // 14
    '170000', // 15
    '150000', // 16
    '120000', // 17
    '120001', // 18
    '120002', // 19
    '140000', // 20
    '140001', // 21
    '140002', // 22
  ],
  // endregion MB1 edge matrix indices
};

// endregion floor plan edge matrix indices
Map<String, Map<String, dynamic>> shuttleStops = <String, Map<String, dynamic>>{
  'SGW': <String, dynamic>{
    'stopCoordinates': const LatLng(45.497275, -73.5783332),
    'shuttlePathPolyLine': <String>[
      'iqmtG|nm`MxAhBTTHSt@|@pA|AxAxApHlFfBuGf@aBfA}E~A_EFGw@yDo@sDMs@}@cE]iAg@kAoBiDYYmAqBU]{@iB]W',
      'aemtGval`M{@qA}@eBeCcGcAkB}@oAK_@JSu@{@q@s@_@[c@[cAk@qB}@w@m@SWCQKQS[o@wAuBiF[y@]o@ICQc@_@aAUw@[sAi@qDqBiPWsBa@mBQs@Si@sAgDw@_BCSq@gAm@gAi@iA_@mBSmBQkCOw@e@oBc@oASSgAkCo@_B[y@i@kCWuAMF{@mEMu@Ok@Wo@[o@}C_F{@{A{@uBOS',
      'muotGr{f`MyFxP',
      'o}otGlmg`MeAmAa@y@a@o@]g@i@g@[Ow@OkAK{@Sy@_@OGGK}@mAw@aA{CqD_E_FsAcB',
      'u~ptGvlf`MbAoDBy@Gm@c@eBe@gAMSi@m@iIiK[a@K][[W}@Mc@_@o@w@}@}AuBmCgD}EeGqHcJwJkM',
      'wtrtGd|c`Ma@a@s@k@cGuEmGoF',
      '_hstGpkc`MuEuFeByBu@eAcCyCmByBmEsFeBwBqBeC',
      'ihttGteb`MkA{AqG{H{BkCyGwG',
      '}_utGxka`MSS',
      'q`utGdka`MaA~BgB~E',
    ],
    'departureSchedule': <List<int>>[
      <int>[465, 485, 500, 515, 535, 550, 570, 585, 605, 620, 655, 670, 705, 735, 765, 795, 825, 860, 890, 920, 950, 980, 1010, 1040, 1070, 1100, 1135, 1170, 1200, 1230, 1245, 1265, 1290, 1320, 1350, 1380],
      <int>[465, 485, 500, 515, 535, 550, 570, 585, 605, 620, 655, 670, 705, 735, 765, 795, 825, 860, 890, 920, 950, 980, 1010, 1040, 1070, 1100, 1135, 1170, 1200, 1230, 1245, 1265, 1290, 1320, 1350, 1380],
      <int>[465, 485, 500, 515, 535, 550, 570, 585, 605, 620, 655, 670, 705, 735, 765, 795, 825, 860, 890, 920, 950, 980, 1010, 1040, 1070, 1100, 1135, 1170, 1200, 1230, 1245, 1265, 1290, 1320, 1350, 1380],
      <int>[465, 485, 500, 515, 535, 550, 570, 585, 605, 620, 655, 670, 705, 735, 765, 795, 825, 860, 890, 920, 950, 980, 1010, 1040, 1070, 1100, 1135, 1170, 1200, 1230, 1245, 1265, 1290, 1320, 1350, 1380],
      <int>[465, 500, 535, 570, 585, 605, 655, 670, 705, 725, 740, 775, 810, 825, 860, 875, 895, 930, 950, 965, 985, 1035, 1050, 1085, 1120, 1155, 1190],
      <int>[],
      <int>[]
    ],
  },
  'Loyola': <String, dynamic>{
    'stopCoordinates': const LatLng(45.4583, -73.6384),
    'shuttlePathPolyLine': <String>['eeutGxva`MzChCp@d@j@VNDv@Tn@j@t@x@lGxHbEdFnA|AxHhJlCbD', 'sxstGnec`MV^xAuCP]j@mA^c@`CwCfAiApEvJjBhEr@nAx@rAZZzB~BfA|@\\d@Pn@Fb@?f@?@', 'uurtGjyc`MCv@VRbDfEtCvDfAxAnC`DhB~BdBtBnEvFjCbD|AtBj@r@Rd@^rAD\\Pf@BDXZvAbBbArAnDvE~@pAJPb@tATxA?ZEXw@|B', '{~ptGhkf`MQd@PTxAhB~D~EzCpDv@`A|@lAPd@VPATd@p@z@`Az@`A`@t@dAhC`B~D|EbLhC`GzCnHtD`JrA|CpAhDP|@^dAlCjGnBrEbDnHhAzBrFzMzBnF|CbHQRKTeA|DkCdJYfAMTnDhIzClHpBtEZj@lA`Dv@`BNXnAdBJTtCrD'],
    'departureSchedule': <List<int>>[
      <int>[450, 460, 475, 500, 515, 535, 550, 570, 585, 620, 635, 655, 670, 690, 720, 750, 780, 810, 840, 870, 900, 930, 960, 990, 1020, 1050, 1080, 1120, 1150, 1170, 1200, 1230, 1245, 1265, 1290, 1320, 1350],
      <int>[450, 460, 475, 500, 515, 535, 550, 570, 585, 620, 635, 655, 670, 690, 720, 750, 780, 810, 840, 870, 900, 930, 960, 990, 1020, 1050, 1080, 1120, 1150, 1170, 1200, 1230, 1245, 1265, 1290, 1320, 1350],
      <int>[450, 460, 475, 500, 515, 535, 550, 570, 585, 620, 635, 655, 670, 690, 720, 750, 780, 810, 840, 870, 900, 930, 960, 990, 1020, 1050, 1080, 1120, 1150, 1170, 1200, 1230, 1245, 1265, 1290, 1320, 1350],
      <int>[450, 460, 475, 500, 515, 535, 550, 570, 585, 620, 635, 655, 670, 690, 720, 750, 780, 810, 840, 870, 900, 930, 960, 990, 1020, 1050, 1080, 1120, 1150, 1170, 1200, 1230, 1245, 1265, 1290, 1320, 1350],
      <int>[460, 495, 535, 550, 570, 620, 635, 670, 690, 705, 740, 760, 775, 810, 845, 860, 880, 915, 930, 950, 985, 1000, 1020, 1085, 1120, 1155, 1190],
      <int>[],
      <int>[]
    ],
  }
};
