import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/blocs/LocationBloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_app/utilities/ConcordiaConstants.dart'
    as ConcordiaConstants;
import 'package:flutter_app/blocs/BlocProvider.dart';

class DrawerComponent extends StatefulWidget {
  @override
  State<DrawerComponent> createState() => DrawerComponentState();
}

class DrawerComponentState extends State<DrawerComponent> {
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
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Hall Building'),
            onTap: () {
              Navigator.pop(context);
              // accesses the sink of the LocationBloc provided to HomeScreen
              BlocProvider.of<LocationBloc>(context).locationCoordinates.add(
                  LatLng(ConcordiaConstants.H_BUILDING_LATITUDE,
                      ConcordiaConstants.H_BUILDING_LONGITUDE));
            },
          ),
          ListTile(
            leading: Icon(Icons.language),
            title: Text('EV Building'),
            onTap: () {
              Navigator.pop(context);
              // accesses the sink of the LocationBloc provided to HomeScreen
              BlocProvider.of<LocationBloc>(context).locationCoordinates.add(
                  LatLng(ConcordiaConstants.EV_BUILDING_LATITUDE,
                      ConcordiaConstants.EV_BUILDING_LONGITUDE));
            },
          ),
          ListTile(
            leading: Icon(Icons.import_contacts),
            title: Text('Library Building'),
            onTap: () {
              Navigator.pop(context);
              // accesses the sink of the LocationBloc provided to HomeScreen
              BlocProvider.of<LocationBloc>(context).locationCoordinates.add(
                  LatLng(ConcordiaConstants.LB_BUILDING_LATITUDE,
                      ConcordiaConstants.LB_BUILDING_LONGITUDE));
            },
          ),
          ListTile(
            leading: Icon(Icons.trending_up),
            title: Text('JMSB Building'),
            onTap: () {
              Navigator.pop(context);
              // accesses the sink of the LocationBloc provided to HomeScreen
              BlocProvider.of<LocationBloc>(context).locationCoordinates.add(
                  LatLng(ConcordiaConstants.MB_BUILDING_LATITUDE,
                      ConcordiaConstants.MB_BUILDING_LONGITUDE));
            },
          ),
          ListTile(
            leading: Icon(Icons.location_city),
            title: Text('FG Building'),
            onTap: () {
              Navigator.pop(context);
              // accesses the sink of the LocationBloc provided to HomeScreen
              BlocProvider.of<LocationBloc>(context).locationCoordinates.add(
                  LatLng(ConcordiaConstants.FG_BUILDING_LATITUDE,
                      ConcordiaConstants.FG_BUILDING_LONGITUDE));
            },
          ),
        ],
      ),
    );
  }
}
