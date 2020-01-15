import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_app/utilities/ConcordiaConstants.dart' as ConcordiaConstants;
import 'package:flutter_app/widgets/component/GoogleMapsComponent.dart';


class DrawerComponent extends StatefulWidget {
  @override
  State<DrawerComponent> createState() => DrawerComponentState();
}

class DrawerComponentState extends State<DrawerComponent> {

  Future<void> _goToBuilding(LatLng coordinates) async {
    final GoogleMapController controller = await getController().future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: coordinates, zoom: 17.5)));
    _setSingleMarker(coordinates);
    if (ConcordiaConstants.sgwBuildingCoordinates.containsValue(coordinates))
      currentCampus = 'SGW';
    else if (ConcordiaConstants.loyolaBuildingCoordinates.containsValue(coordinates)) currentCampus = 'Loyola';
  }


  void _setSingleMarker(LatLng coordinates) {
    setState(() {
      markers.clear();
      markers.add(Marker(markerId: MarkerId('currentBuilding'), position: coordinates));
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;

    return Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            SizedBox(
                height: screenHeight / 6,
                child: DrawerHeader(
                  child: Text(
                    'Concordia Buildings',
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xff800206),
                  ),
                )),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Hall Building'),
              onTap: () {
                Navigator.pop(context);
                _goToBuilding(ConcordiaConstants.sgwBuildingCoordinates['Hall']);
              },
            ),
            ListTile(
              leading: Icon(Icons.language),
              title: Text('EV Building'),
              onTap: () {
                Navigator.pop(context);
                _goToBuilding(ConcordiaConstants.sgwBuildingCoordinates['EV']);
              },
            ),
            ListTile(
              leading: Icon(Icons.import_contacts),
              title: Text('Library Building'),
              onTap: () {
                Navigator.pop(context);
                _goToBuilding(ConcordiaConstants.sgwBuildingCoordinates['Library']);
              },
            ),
            ListTile(
              leading: Icon(Icons.trending_up),
              title: Text('JMSB Building'),
              onTap: () {
                Navigator.pop(context);
                _goToBuilding(ConcordiaConstants.sgwBuildingCoordinates['JMSB']);
              },
            ),
            ListTile(
              leading: Icon(Icons.location_city),
              title: Text('FG Building'),
              onTap: () {
                Navigator.pop(context);
                _goToBuilding(ConcordiaConstants.sgwBuildingCoordinates['FG']);
              },
            ),
          ],
        ),
      );
  }
}


