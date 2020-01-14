import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:floating_search_bar/floating_search_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => HomePageState();
}

class HomePageState extends State<HomeScreen> {
  Completer<GoogleMapController> _controller = Completer();
  String currentCampus = 'SGW';
  Map<String, LatLng> sgwBuildingCoordinates = {
    'Hall': LatLng(45.497113, -73.578791),
    'EV': LatLng(45.495504, -73.577610),
    'Library': LatLng(45.496919, -73.578027),
    'JMSB': LatLng(45.495533, -73.579172),
    'FG': LatLng(45.494394, -73.578412)
  };
  Map<String, LatLng> loyolaBuildingCoordinates = {};

  Set<Marker> markers = Set();

  static final CameraPosition _sgwCampus = CameraPosition(
    target: LatLng(45.495835, -73.578789),
    zoom: 15.5,
  );

  static final CameraPosition _loyolaCampus = CameraPosition(
    target: LatLng(45.458257, -73.640450),
    zoom: 15.5,
  );

  Future<void> _goToBuilding(LatLng coordinates) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: coordinates, zoom: 17.5)));
    _setSingleMarker(coordinates);
    if (sgwBuildingCoordinates.containsValue(coordinates))
      currentCampus = 'SGW';
    else if (loyolaBuildingCoordinates.containsValue(coordinates)) currentCampus = 'Loyola';
  }

  Future<void> _switchCampus() async {
    final GoogleMapController controller = await _controller.future;
    if (currentCampus == 'SGW') {
      controller.animateCamera(CameraUpdate.newCameraPosition(_loyolaCampus));
      currentCampus = 'Loyola';
    } else {
      controller.animateCamera(CameraUpdate.newCameraPosition(_sgwCampus));
      currentCampus = 'SGW';
    }
  }

  void _setSingleMarker(LatLng coordinates) {
    setState(() {
      markers.clear();
      markers.add(Marker(markerId: MarkerId('currentBuilding'), position: coordinates));
    });
  }

  Future<void> _zoomIn() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.zoomIn());
  }

  Future<void> _zoomOut() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.zoomOut());
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(screenHeight / 12),
          child: AppBar(
            title: Image.asset('assets/logo.png', height: screenHeight / 12),
            backgroundColor: Color(0xff800206),
          )),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: Stack(children: <Widget>[
                GoogleMap(
                  mapType: MapType.normal,
                  initialCameraPosition: _sgwCampus,
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                  },
                  markers: markers,
                ),
                SizedBox(
                    height: screenHeight / 9,
                    width: screenWidth,
                    child: Padding(
                      padding: EdgeInsets.all((10.0)),
                      child: MapSearchBar(),
                    ))
              ])),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            height: screenHeight / 13,
            width: screenHeight / 13,
            padding: EdgeInsets.all(5.0),
            child: FloatingActionButton(
              child: Icon(Icons.zoom_in, size: screenWidth / 12),
              backgroundColor: Color(0xff800206),
              onPressed: () {
                _zoomIn();
              },
            ),
          ),
          Container(
            height: screenHeight / 13,
            width: screenHeight / 13,
            padding: EdgeInsets.all(5.0),
            child: FloatingActionButton(
              child: Icon(Icons.zoom_out, size: screenWidth / 12),
              backgroundColor: Color(0xff800206),
              onPressed: () {
                _zoomOut();
              },
            ),
          ),
          Container(
            height: screenHeight / 10,
            width: screenHeight / 10,
            padding: EdgeInsets.all(5.0),
            child: FloatingActionButton(
              child: Icon(Icons.sync, size: screenWidth / 10),
              backgroundColor: Color(0xff800206),
              onPressed: () {
                _switchCampus();
              },
            ),
          ),
        ],
      ),
      drawer: Drawer(
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
                _goToBuilding(sgwBuildingCoordinates['Hall']);
              },
            ),
            ListTile(
              leading: Icon(Icons.language),
              title: Text('EV Building'),
              onTap: () {
                Navigator.pop(context);
                _goToBuilding(sgwBuildingCoordinates['EV']);
              },
            ),
            ListTile(
              leading: Icon(Icons.import_contacts),
              title: Text('Library Building'),
              onTap: () {
                Navigator.pop(context);
                _goToBuilding(sgwBuildingCoordinates['Library']);
              },
            ),
            ListTile(
              leading: Icon(Icons.trending_up),
              title: Text('JMSB Building'),
              onTap: () {
                Navigator.pop(context);
                _goToBuilding(sgwBuildingCoordinates['JMSB']);
              },
            ),
            ListTile(
              leading: Icon(Icons.location_city),
              title: Text('FG Building'),
              onTap: () {
                Navigator.pop(context);
                _goToBuilding(sgwBuildingCoordinates['FG']);
              },
            ),
          ],
        ),
      ),
    );
  }
}


class MapSearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingSearchBar(
      onChanged: (String value) {},
      onTap: () {},
      decoration: InputDecoration.collapsed(
        hintText: "Where to?",
      ),
      children: [],
    );
  }
}
