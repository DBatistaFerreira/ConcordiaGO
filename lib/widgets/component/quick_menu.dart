import 'package:concordia_go/widgets/component/sgw_campus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:concordia_go/blocs/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:concordia_go/utilities/application_constants.dart' as application_constants;


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
                color: application_constants.concordiaRed,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.flag),
            title: Text('Your Next Class'),
            onTap: () {
              Navigator.pop(context);
              // TODO
            },
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('Favorite Places'),
            onTap: () {
              Navigator.pop(context);
              // TODO
            },
          ),
          ListTile(
            leading: Icon(Icons.school),
            title: Text('SGW Campus'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => SGWCampusBuildingList()));
            },
          ),
          ListTile(
            leading: Icon(Icons.school),
            title: Text('Loyola Campus'),
            onTap: () {
              Navigator.pop(context);
              mapBloc.add(CameraMoveConcordia('H', context));
            },
          ),
          ListTile(
            leading: Icon(Icons.new_releases),
            title: Text('Points of Interest'),
            // TODO
          ),
          ListTile(
            leading: Icon(Icons.calendar_today),
            title: Text('My Schedule'),
            // TODO
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            // TODO
          ),
        ],
      ),
    );
  }
}
