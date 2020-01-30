import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:concordia_go/blocs/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:concordia_go/utilities/concordia_constants.dart' as concordia_constants;

class QuickMenu extends StatefulWidget {
  @override
  State<QuickMenu> createState() => QuickMenuState();
}

class QuickMenuState extends State<QuickMenu> {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    final bloc = BlocProvider.of<MapBloc>(context);

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
              bloc.add(CameraMove(
                  LatLng(concordia_constants.H_BUILDING_LATITUDE, concordia_constants.H_BUILDING_LONGITUDE),
                  17.5,
                  true));
            },
          ),
          ListTile(
            leading: Icon(Icons.language),
            title: Text('EV Building'),
            onTap: () {
              Navigator.pop(context);
              bloc.add(CameraMove(
                  LatLng(concordia_constants.EV_BUILDING_LATITUDE, concordia_constants.EV_BUILDING_LONGITUDE),
                  17.5,
                  true));
            },
          ),
          ListTile(
            leading: Icon(Icons.import_contacts),
            title: Text('Library Building'),
            onTap: () {
              Navigator.pop(context);
              bloc.add(CameraMove(
                  LatLng(concordia_constants.LB_BUILDING_LATITUDE, concordia_constants.LB_BUILDING_LONGITUDE),
                  17.5,
                  true));
            },
          ),
          ListTile(
            leading: Icon(Icons.trending_up),
            title: Text('JMSB Building'),
            onTap: () {
              Navigator.pop(context);
              bloc.add(CameraMove(
                  LatLng(concordia_constants.MB_BUILDING_LATITUDE, concordia_constants.MB_BUILDING_LONGITUDE),
                  17.5,
                  true));
            },
          ),
          ListTile(
            leading: Icon(Icons.location_city),
            title: Text('FG Building'),
            onTap: () {
              Navigator.pop(context);
              bloc.add(CameraMove(
                  LatLng(concordia_constants.FG_BUILDING_LATITUDE, concordia_constants.FG_BUILDING_LONGITUDE),
                  17.5,
                  true));
            },
          ),
        ],
      ),
    );
  }
}
