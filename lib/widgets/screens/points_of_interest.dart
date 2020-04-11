import 'package:concordia_go/models/hotspot.dart';
import 'package:concordia_go/services/hotspot_search_service.dart';
import 'package:concordia_go/utilities/application_constants.dart' as application_constants;
import 'package:concordia_go/utilities/application_constants.dart';
import 'package:concordia_go/widgets/screens/outdoor_poi_results.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class POIMenu extends StatefulWidget {
  const POIMenu();

  @override
  State<POIMenu> createState() => POIMenuState();
}

class POIMenuState extends State<POIMenu> {
  HotspotSearchService hotspotSearchService = HotspotSearchService.instance;

  @override
  Widget build(BuildContext context) {
    const double iconSize = 30.0;
    const double fontSize = 20.0;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenHeight / 12),
        child: AppBar(
          title: Image.asset(concordiaGOHeader, height: screenHeight / 12),
          backgroundColor: application_constants.concordiaRed,
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'Points of Interest',
                style: TextStyle(
                  fontFamily: 'Raleway',
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: application_constants.listElementTextSize,
                ),
              ),
            ),
            color: application_constants.concordiaRed,
            height: screenHeight / 15,
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.wc, size: iconSize),
                  title: const Text(
                    'Washroom',
                    style: TextStyle(fontSize: fontSize),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    // TODO(Noorzada): add link
                  },
                ),
                ListTile(
                  leading: Icon(Icons.local_drink, size: iconSize),
                  title: const Text(
                    'Water Fountain',
                    style: TextStyle(fontSize: fontSize),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    // TODO(Noorzada): add link
                  },
                ),
                ListTile(
                  leading: Icon(Icons.unfold_more, size: iconSize),
                  title: const Text(
                    'Elevators',
                    style: TextStyle(fontSize: fontSize),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    //TODO(Noorzada): add link
                  },
                ),
                ListTile(
                  leading: Icon(Icons.restaurant, size: iconSize),
                  title: const Text(
                    'Restaurants',
                    style: TextStyle(fontSize: fontSize),
                  ),
                  onTap: () {
                    hotspotSearchService.setHotspotList(HotspotType.Restaurants).then(
                      (void value) {
                        Navigator.push(
                          context,
                          MaterialPageRoute<OutdoorPOIResults>(
                            builder: (BuildContext context) =>
                                OutdoorPOIResults(hotspotSearchService.hotspotList, HotspotType.Restaurants),
                          ),
                        );
                      },
                    );
                  },
                ),
                ListTile(
                  leading: Icon(Icons.shopping_basket, size: iconSize),
                  title: const Text(
                    'Shopping',
                    style: TextStyle(fontSize: fontSize),
                  ),
                  onTap: () {
                    hotspotSearchService.setHotspotList(HotspotType.Shopping).then(
                      (void value) {
                        Navigator.push(
                          context,
                          MaterialPageRoute<OutdoorPOIResults>(
                            builder: (BuildContext context) =>
                                OutdoorPOIResults(hotspotSearchService.hotspotList, HotspotType.Shopping),
                          ),
                        );
                      },
                    );
                  },
                ),
                ListTile(
                  leading: Icon(Icons.shopping_cart, size: iconSize),
                  title: const Text(
                    'Grocery',
                    style: TextStyle(fontSize: fontSize),
                  ),
                  onTap: () {
                    hotspotSearchService.setHotspotList(HotspotType.Grocery).then(
                      (void value) {
                        Navigator.push(
                          context,
                          MaterialPageRoute<OutdoorPOIResults>(
                            builder: (BuildContext context) =>
                                OutdoorPOIResults(hotspotSearchService.hotspotList, HotspotType.Grocery),
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
