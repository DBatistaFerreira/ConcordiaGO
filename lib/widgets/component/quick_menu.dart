import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:concordia_go/blocs/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuickMenu extends StatefulWidget {
  @override
  State<QuickMenu> createState() => QuickMenuState();
}

class QuickMenuState extends State<QuickMenu> {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    final mapBloc = BlocProvider.of<MapBloc>(context);

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
              mapBloc.add(CameraMoveConcordia('H', context));
            },
          ),
          ListTile(
            leading: Icon(Icons.language),
            title: Text('EV Building'),
            onTap: () {
              Navigator.pop(context);
              mapBloc.add(CameraMoveConcordia('EV', context));
            },
          ),
          ListTile(
            leading: Icon(Icons.import_contacts),
            title: Text('Library Building'),
            onTap: () {
              Navigator.pop(context);
              mapBloc.add(CameraMoveConcordia('LB', context));
            },
          ),
          ListTile(
            leading: Icon(Icons.trending_up),
            title: Text('JMSB Building'),
            onTap: () {
              Navigator.pop(context);
              mapBloc.add(CameraMoveConcordia('MB', context));
            },
          ),
          ListTile(
            leading: Icon(Icons.location_city),
            title: Text('FG Building'),
            onTap: () {
              Navigator.pop(context);
              mapBloc.add(CameraMoveConcordia('FG', context));
            },
          ),
        ],
      ),
    );
  }
}
