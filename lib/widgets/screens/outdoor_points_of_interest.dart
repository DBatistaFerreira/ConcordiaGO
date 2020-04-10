import 'package:concordia_go/blocs/bloc.dart';
import 'package:concordia_go/models/direction_object.dart';
import 'package:concordia_go/models/hotspot.dart';
import 'package:concordia_go/models/node.dart';
import 'package:concordia_go/services/hotspot_search_service.dart';
import 'package:concordia_go/services/shared_preferences_service.dart';
import 'package:concordia_go/utilities/application_constants.dart' as application_constants;
import 'package:concordia_go/utilities/application_constants.dart';
import 'package:concordia_go/utilities/concordia_constants.dart';
import 'package:concordia_go/widgets/screens/home_screen.dart';
import 'package:concordia_go/widgets/screens/outdoor_poi_results.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          title: Image.asset('assets/logo.png', height: screenHeight / 12),
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
                  onTap: () async {
                    Navigator.pop(context);
                    var preferredWashroom = await SharedPreferencesService.getPreferredWashroom();
                    BlocProvider.of<SearchBloc>(context).add(
                      SearchDirectionsEvent(
                        source: Dobject.building(buildings['H']),
                        destination: Dobject.indoorHotspot(Node(preferredWashroom=='Male'?'150001':'150000'), 'Washroom'),
                      ),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(Icons.local_drink, size: iconSize),
                  title: const Text(
                    'Water Foutain',
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
                    'Food',
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
                  leading: Icon(Icons.shopping_cart, size: iconSize),
                  title: const Text(
                    'Shops',
                    style: TextStyle(fontSize: fontSize),
                  ),
                  onTap: () {
                    //TODO
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
