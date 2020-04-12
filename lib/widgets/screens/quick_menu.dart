import 'dart:collection';

import 'package:concordia_go/blocs/bloc.dart';
import 'package:concordia_go/models/classroom.dart';
import 'package:concordia_go/models/direction_object.dart';
import 'package:concordia_go/utilities/application_constants.dart';
import 'package:concordia_go/widgets/component/calendar/calendar_events.dart';
import 'package:concordia_go/widgets/component/google_maps_component.dart';
import 'package:device_calendar/device_calendar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_screen.dart';

class QuickMenu extends StatefulWidget {
  @override
  State<QuickMenu> createState() => QuickMenuState(DeviceCalendarPlugin());
}

class QuickMenuState extends State<QuickMenu> {
  QuickMenuState(this._deviceCalendarPlugin);
  Calendar _calendar;
  final DeviceCalendarPlugin _deviceCalendarPlugin;
  @override
  void initState() {
    super.initState();
  }

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
            onTap: () async {
              if (_calendar == null) {
                _retrieveCalendars();
              }
              if (_calendar != null) {
                Navigator.pop(context);
                final Classroom classroom = await _retrieveFirstCalendarEvent();
                final Dobject source = Dobject.hotspot(currentLocation, 'Your Location');
                final Dobject destination = Dobject.indoor(
                    classroom.node, classroom.building, classroom.floor, classroom.building.code + classroom.number);
                BlocProvider.of<SearchBloc>(mapContext)
                    .add(SearchDirectionsEvent(source: source, destination: destination));
              } else {
                showAlert('No Calendars Found!',
                    "You must have a calendar named 'School' on your device (not case sensitive)");
              }
            },
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: const Text('Favorite Places'),
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
            // TODO(Noorzada): add link
          ),
          ListTile(
              leading: Icon(Icons.calendar_today),
              title: const Text('My Schedule'),
              onTap: () async {
                if (_calendar == null) {
                  _retrieveCalendars();
                }
                if (_calendar != null) {
                  await Navigator.push(context, MaterialPageRoute<CalendarEventsPage>(builder: (BuildContext context) {
                    return CalendarEventsPage(_calendar, _deviceCalendarPlugin, key: const Key('calendarEventsPage'));
                  }));
                } else {
                  showAlert('No Calendars Found!',
                      "You must have a calendar named 'School' on your device (not case sensitive)");
                }
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

  Future<Classroom> _retrieveFirstCalendarEvent() async {
    final DateTime startDate = DateTime.now().add(const Duration(days: 0));
    final DateTime endDate = DateTime.now().add(const Duration(days: 1));
    final Result<UnmodifiableListView<Event>> calendarEventsResult = await _deviceCalendarPlugin.retrieveEvents(
        _calendar.id, RetrieveEventsParams(startDate: startDate, endDate: endDate));
    return validateEvent(calendarEventsResult?.data?.where((Event e) => validateEvent(e) != null)?.toList()[0]);
  }

  Future<void> _retrieveCalendars() async {
    try {
      Result<bool> permissionsGranted = await _deviceCalendarPlugin.hasPermissions();
      if (permissionsGranted.isSuccess && !permissionsGranted.data) {
        permissionsGranted = await _deviceCalendarPlugin.requestPermissions();
        if (!permissionsGranted.isSuccess || !permissionsGranted.data) {
          return;
        }
      }

      final Result<UnmodifiableListView<Calendar>> calendarsResult = await _deviceCalendarPlugin.retrieveCalendars();
      setState(() {
        _calendar = calendarsResult?.data?.where((Calendar e) => e?.name?.toLowerCase() == 'school')?.toList()[0];
      });
    } on Exception catch (e) {
      print(e);
    }
  }

  void showAlert(String title, String message) {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            FlatButton(
              child: const Text('Okay'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
