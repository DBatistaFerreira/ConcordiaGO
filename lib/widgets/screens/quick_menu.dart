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
              decoration: const BoxDecoration(
                color: concordiaRed,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.flag),
            title: const Text('Your Next Class'),
            onTap: () {
              Navigator.pop(context);
              // TODO(Noorzada): add link
            },
          ),
          ListTile(
            leading: Icon(Icons.school),
            title: const Text('SGW Campus'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/sgwbuildings');
            },
          ),
          ListTile(
            leading: Icon(Icons.school),
            title: const Text('Loyola Campus'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/loyolabuildings');
            },
          ),
          ListTile(
              leading: Icon(Icons.new_releases),
              title: const Text('Points of Interest'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/pointsofinterest');
              }),
          ListTile(
              leading: Icon(Icons.calendar_today),
              title: const Text('My Schedule'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/calendars');
              }),
          ListTile(
            leading: Icon(Icons.settings),
            title: const Text('Settings'),
            // TODO(Noorzada): add link
          ),
        ],
      ),
    );
  }
}
