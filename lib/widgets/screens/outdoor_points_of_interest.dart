import 'package:concordia_go/models/hotspot.dart';
import 'package:concordia_go/utilities/application_constants.dart' as application_constants;
import 'package:concordia_go/utilities/application_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OutdoorPOIMenu extends StatefulWidget {
  const OutdoorPOIMenu();


  @override
  State<OutdoorPOIMenu> createState() => OutdoorPOIMenuState();
}

class OutdoorPOIMenuState extends State<OutdoorPOIMenu> {
  OutdoorPOIMenuState();


  @override
  Widget build(BuildContext context) {


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
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.wc, size:30),
                  title: const Text('Washroom', style: TextStyle(fontSize: 20),),
                  onTap: () {
                    Navigator.pop(context);
                    // TODO(Noorzada): add link
                  },
                ),
                ListTile(
                  leading: Icon(Icons.local_drink, size:30),
                  title: const Text('Water Foutain', style: TextStyle(fontSize: 20),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    // TODO(Noorzada): add link
                  },
                ),
                ListTile(
                    leading: Icon(Icons.unfold_more, size:30),
                    title: const Text('Elevators', style: TextStyle(fontSize: 20),),
                    onTap: () {
                      Navigator.pop(context);
                      //TODO: add link
                    },
                ),
                ListTile(
                    leading: Icon(Icons.restaurant, size:30),
                    title: const Text('Food', style: TextStyle(fontSize: 20),),
                    onTap: () {
                      //TODO
                      },
                ),
                ListTile(
                  leading: Icon(Icons.shopping_cart, size:30),
                  title: const Text('Shops', style: TextStyle(fontSize: 20),),
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
