import 'dart:convert';
import 'dart:io';
import 'package:concordia_go/models/hotspot.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:concordia_go/utilities/concordia_constants.dart' as concordia_constants;

String _apiKey = Platform.environment['GOOGLE_API'];

class HotspotSearchService {
  HotspotSearchService._privateConstructor();

  static final HotspotSearchService instance = HotspotSearchService._privateConstructor();

  List<Hotspot> hotspotList = <Hotspot>[];

  Future<void> setHotspotList(HotspotType locationType) async {
    hotspotList = <Hotspot>[];
    final dynamic jsonReturn = await googlePlacesRequest(locationType);
    final List<dynamic> hotspotMap = jsonReturn[concordia_constants.results] as List<dynamic>;
    for (int i = 0; i < hotspotMap.length; i++) {
      hotspotList.add(hotspotBuilder(hotspotMap[i] as Map<dynamic, dynamic>, locationType));
    }
  }

  Hotspot hotspotBuilder(Map<dynamic, dynamic> hotspotMap, HotspotType locationType) {
    bool isOpen = true;
    if (hotspotMap[concordia_constants.opening_hours] != null) {
      if (hotspotMap[concordia_constants.opening_hours][concordia_constants.open_now] != null) {
        isOpen = hotspotMap[concordia_constants.opening_hours][concordia_constants.open_now] as bool;
      }
    }
    dynamic priceLevel = 0;
    if (hotspotMap[concordia_constants.price_level] != null) {
      priceLevel = hotspotMap[concordia_constants.price_level];
    }

    return Hotspot(
      address: hotspotMap[concordia_constants.address] as String,
      coordinates: LatLng(
          hotspotMap[concordia_constants.geometry][concordia_constants.location][concordia_constants.latitude]
              as double,
          hotspotMap[concordia_constants.geometry][concordia_constants.location][concordia_constants.longitude]
              as double),
      name: hotspotMap[concordia_constants.name] as String,
      hotspotType: locationType,
      isOpen: isOpen,
      priceLevel: priceLevel,
      rating: hotspotMap[concordia_constants.rating],
    );
  }

  Future<dynamic> googlePlacesRequest(HotspotType locationType) async {
    final String query = getQuery(locationType);
    final String url = 'https://maps.googleapis.com/maps/api/place/textsearch/json?query=$query&key=$_apiKey';
    final http.Response response = await http.get(url);
    return jsonDecode(response.body);
  }

  String getQuery(HotspotType locationType) {
    switch (locationType) {
      case HotspotType.Restaurants:
        return concordia_constants.restaurantHotspot;
        break;
      case HotspotType.Grocery:
        return concordia_constants.groceryHotspot;
      case HotspotType.Shopping:
        return concordia_constants.shoppingHotspot;
      default:
        return '';
    }
  }
}
