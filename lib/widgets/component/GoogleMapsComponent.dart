import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_app/widgets/component/MapSearchBarComponent.dart';
import 'package:flutter_app/utilities/ConcordiaConstants.dart' as ConcordiaConstants;


Completer<GoogleMapController> _controller = Completer();
String currentCampus = 'SGW';
Set<Marker> markers = Set();

Completer<GoogleMapController> getController(){
  return _controller;
}

class GoogleMapsComponent extends StatefulWidget {
  @override
  State<GoogleMapsComponent> createState() => GoogleMapsComponentState();
}


class GoogleMapsComponentState extends State<GoogleMapsComponent> {


  Future<void> _switchCampus() async {
    final GoogleMapController controller = await _controller.future;
    if (currentCampus == 'SGW') {
      controller.animateCamera(CameraUpdate.newCameraPosition(ConcordiaConstants.loyolaCampus));
      currentCampus = 'Loyola';
    } else {
      controller.animateCamera(CameraUpdate.newCameraPosition(ConcordiaConstants.sgwCampus));
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: Stack(children: <Widget>[
                GoogleMap(
                  mapType: MapType.normal,
                  initialCameraPosition: ConcordiaConstants.sgwCampus,
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
    );
  }
}


