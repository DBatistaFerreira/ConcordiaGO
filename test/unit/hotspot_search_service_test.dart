import 'package:concordia_go/models/hotspot.dart';
import 'package:concordia_go/services/hotspot_search_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:concordia_go/utilities/concordia_constants.dart' as concordia_constants;

void main() {
  final HotspotSearchService hotspotSearchService = HotspotSearchService.instance;

  final Map<String, Object> testMap = {
    'formatted_address': '3420 Jean Yves St, Kirkland, Quebec H9J 2R6, Canada',
    'geometry': {
      'location': {'lat': 45.4416251, 'lng': -73.88989309999999},
      'viewport': {
        'northeast': {'lat': 45.44294377989272, 'lng': -73.88875132010726},
        'southwest': {'lat': 45.44024412010727, 'lng': -73.89145097989271}
      }
    },
    'icon': 'httpsmaps.gstatic.commapfilesplace_apiiconsrestaurant-71.png',
    'id': 'b028492390eaab95c009030c466356ecb5d6c997',
    'name': 'Thai Express',
    'opening_hours': {'open_now': true},
    'photos': [
      {
        'height': 1531,
        'html_attributions': [
          'u003ca href="httpsmaps.google.commapscontrib114533629603123897770"u003eWalter Santelliu003cau003e'
        ],
        'photo_reference':
            'CmRaAAAA0TEer8AzwVeV1evhIFx2L8kuCXUC23rs78Gm-CSSU6Pq2hCAV5_GV0VFCv7S0I3jVC6r93cVpX4vF4ltJedChOfzDuEn0e1OVzQA0aRCSPpVEDeuP6TLKY-LByKVrqFAEhAv3Fw9VZEaYGZRDOL6_5IJGhS3CKqM3Y2nSGh3fsMpWDbN7OZysw',
        'width': 2048,
      }
    ],
    'place_id': 'ChIJ19vCaWE5yUwRIMYpTbsT0oU',
    'plus_code': {'compound_code': 'C4R6+M2 Kirkland, Quebec', 'global_code': '87Q8C4R6+M2'},
    'price_level': 1,
    'rating': 4.1,
    'reference': 'ChIJ19vCaWE5yUwRIMYpTbsT0oU',
    'types': ['restaurant', 'food', 'point_of_interest', 'establishment'],
    'user_ratings_total': 200,
  };

  test('hotspotBuilder Test', () async {
    final Hotspot testHotspot = hotspotSearchService.hotspotBuilder(testMap, HotspotType.Restaurants);
    expect(testHotspot.priceLevel, 1);
    expect(testHotspot.name, 'Thai Express');
    expect(testHotspot.hotspotType, HotspotType.Restaurants);
    expect(testHotspot.rating, 4.1);
  });

  test('getQueryType Test', () async {
    expect(hotspotSearchService.getQuery(HotspotType.Restaurants), concordia_constants.restaurantHotspot);
    expect(hotspotSearchService.getQuery(HotspotType.Grocery), concordia_constants.groceryHotspot);
    expect(hotspotSearchService.getQuery(HotspotType.Shopping), concordia_constants.shoppingHotspot);
  });
}
