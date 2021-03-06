Map<String, Object> testJSON = <String, dynamic>{
  'geocoded_waypoints': <Map<String, dynamic>>[
    <String, dynamic>{
      'geocoder_status': 'OK',
      'place_id': 'ChIJr5yWRy4XyUwRHtqIFS1eEoI',
      'types': <String>['street_address']
    },
    <String, dynamic>{
      'geocoder_status': 'OK',
      'place_id': 'ChIJAcTa3zEXyUwRAHQnQj9LdGg',
      'types': <String>['premise']
    }
  ],
  'routes': <Map<String, dynamic>>[
    <String, dynamic>{
      'bounds': <String, Map<String, double>>{
        'northeast': <String, double>{'lat': 45.4593638, 'lng': -73.6382773},
        'southwest': <String, double>{'lat': 45.4576737, 'lng': -73.64197469999999}
      },
      'copyrights': 'Map data ©2020 Google',
      'legs': <Map<String, dynamic>>[
        <String, dynamic>{
          'distance': <String, dynamic>{'text': '0.5 km', 'value': 451},
          'duration': <String, dynamic>{'text': '6 mins', 'value': 332},
          'end_address': 'Refectory, Montreal, QC H4B 1R6, Canada',
          'end_location': <String, dynamic>{'lat': 45.4582947, 'lng': -73.63839059999999},
          'start_address': '3475 Rue West Broadway, Montréal, QC H4B 2A6, Canada',
          'start_location': <String, dynamic>{'lat': 45.4576737, 'lng': -73.64197469999999},
          'steps': <Map<String, dynamic>>[
            <String, dynamic>{
              'distance': <String, dynamic>{'text': '0.2 km', 'value': 209},
              'duration': <String, dynamic>{'text': '3 mins', 'value': 153},
              'end_location': <String, double>{'lat': 45.4593638, 'lng': -73.640704},
              'html_instructions': 'Head \u003cb\u003enortheast\u003c/b\u003e',
              'polyline': <String, String>{'points': 'mmmtGhen`M_BeAgBmAiAy@g@[KIKI'},
              'start_location': <String, double>{'lat': 45.4576737, 'lng': -73.64197469999999},
              'travel_mode': 'WALKING'
            },
            <String, dynamic>{
              'distance': <String, dynamic>{'text': '0.2 km', 'value': 227},
              'duration': <String, dynamic>{'text': '3 mins', 'value': 168},
              'end_location': <String, double>{'lat': 45.4583939, 'lng': -73.6382773},
              'html_instructions': 'Turn \u003cb\u003eright\u003c/b\u003e',
              'maneuver': 'turn-right',
              'polyline': <String, String>{'points': '_xmtGj}m`MXeAV{@Ja@X_A\\qANk@JYZkAJKFO'},
              'start_location': <String, double>{'lat': 45.4593638, 'lng': -73.640704},
              'travel_mode': 'WALKING'
            },
            <String, dynamic>{
              'distance': <String, dynamic>{'text': '15 m', 'value': 15},
              'duration': <String, dynamic>{'text': '1 min', 'value': 11},
              'end_location': <String, double>{'lat': 45.4582947, 'lng': -73.63839059999999},
              'html_instructions':
                  'Turn \u003cb\u003eright\u003c/b\u003e onto \u003cb\u003eRue Sherbrooke\u003c/b\u003e/\u003cwbr/\u003e\u003cb\u003eRue Sherbrooke Ouest\u003c/b\u003e\u003cdiv style=\'font-size:0.9em\'\u003eDestination will be on the right\u003c/div\u003e',
              'maneuver': 'turn-right',
              'polyline': <String, String>{'points': '}qmtGfnm`MRT'},
              'start_location': <String, double>{'lat': 45.4583939, 'lng': -73.6382773},
              'travel_mode': 'WALKING'
            }
          ],
          'traffic_speed_entry': <dynamic>[],
          'via_waypoint': <dynamic>[]
        }
      ],
      'overview_polyline': <String, String>{'points': 'mmmtGhen`MyHiFWSp@aCrA_Ff@eBJKFORT'},
      'summary': 'Rue Sherbrooke/Rue Sherbrooke Ouest',
      'warnings': <String>[
        'Walking directions are in beta. Use caution – This route may be missing sidewalks or pedestrian paths.'
      ],
      'waypoint_order': <dynamic>[]
    }
  ],
  'status': 'OK'
};
