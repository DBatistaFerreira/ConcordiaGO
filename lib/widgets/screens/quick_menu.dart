import 'package:concordia_go/utilities/application_constants.dart' as application_constants;
import 'package:concordia_go/utilities/application_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuickMenu extends StatefulWidget {
  @override
  State<QuickMenu> createState() => QuickMenuState();
}

class QuickMenuState extends State<QuickMenu> {
  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;

    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          SizedBox(
            height: screenHeight / 6,
            child: DrawerHeader(
              child: Text(
                'Quick Menu',
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
              Navigator.pushNamed(context, '/sgwbuildings');
            },
          ),
          ListTile(
            leading: Icon(Icons.school),
            title: Text('Loyola Campus'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/loyolabuildings');
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
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/calendars');
              }),
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
