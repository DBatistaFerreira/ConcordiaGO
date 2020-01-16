import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/blocs/BlocProvider.dart';
import 'package:flutter_app/blocs/LocationBloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_app/utilities/ConcordiaConstants.dart'
    as ConcordiaConstants;

class GoogleMapsComponent extends StatefulWidget {
  @override
  State<GoogleMapsComponent> createState() => GoogleMapsComponentState();
}

class GoogleMapsComponentState extends State<GoogleMapsComponent> {
  Completer<GoogleMapController> _controller = Completer();
  String currentCampus = 'SGW';

  Future<void> _switchCampus() async {
    final GoogleMapController controller = await _controller.future;
    if (currentCampus == 'SGW') {
      controller.animateCamera(
          CameraUpdate.newCameraPosition(ConcordiaConstants.loyolaCampus));
      currentCampus = 'Loyola';
    } else {
      controller.animateCamera(
          CameraUpdate.newCameraPosition(ConcordiaConstants.sgwCampus));
      currentCampus = 'SGW';
    }
  }

  Future<void> goToBuilding(LatLng coordinates) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: coordinates, zoom: 17.5)));
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
          // listens to the LocationBloc's stream and rebuilds the GoogleMap widget whenever data is received
          StreamBuilder(
            stream: BlocProvider.of<LocationBloc>(context).locationStream,
            initialData: ConcordiaConstants.sgwCampus.target,
            builder: (BuildContext context, AsyncSnapshot<LatLng> snapshot) {
              goToBuilding(snapshot.data);
              return Expanded(
                child: GoogleMap(
                  mapType: MapType.normal,
                  initialCameraPosition:
                      CameraPosition(target: snapshot.data, zoom: 15.5),
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                  },
                  markers: {
                    Marker(
                        markerId: MarkerId('some marker'),
                        position: snapshot.data),
                  },
                ),
              );
            },
          ),
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
