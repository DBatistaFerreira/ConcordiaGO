import 'dart:collection';

import 'package:concordia_go/utilities/application_constants.dart' as application_constants;
import 'package:concordia_go/utilities/application_constants.dart';
import 'package:device_calendar/device_calendar.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

import 'calendar_events.dart';

class CalendarsPage extends StatefulWidget {
  const CalendarsPage(this._deviceCalendarPlugin, {Key key}) : super(key: key);

  final DeviceCalendarPlugin _deviceCalendarPlugin;

  @override
  _CalendarsPageState createState() {
    return _CalendarsPageState(_deviceCalendarPlugin);
  }
}

class _CalendarsPageState extends State<CalendarsPage> {
  _CalendarsPageState(this._deviceCalendarPlugin);

  final DeviceCalendarPlugin _deviceCalendarPlugin;
  List<Calendar> _calendars;

  @override
  void initState() {
    super.initState();
    _retrieveCalendars();
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenHeight / 12),
        child: AppBar(
          title: Image.asset('assets/logo.png', height: screenHeight / 12),
          backgroundColor: application_constants.concordiaRed,
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'My Calendars',
                style: TextStyle(
                  fontFamily: 'Raleway',
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: application_constants.listElementTextSize,
                ),
              ),
            ),
            color: application_constants.concordiaRed,
            height: screenHeight / 15,
          ),
          Expanded(
            flex: 1,
            child: ListView.builder(
              itemCount: _calendars?.length ?? 0,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  key: Key('${_calendars.indexWhere((Calendar calendar) => calendar.id == _calendars[index].id)}'),
                  onTap: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute<CalendarEventsPage>(
                        builder: (BuildContext context) {
                          return CalendarEventsPage(
                            _calendars[index],
                            _deviceCalendarPlugin,
                            key: const Key('calendarEventsPage'),
                          );
                        },
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Text(
                            _calendars[index].name,
                            style: Theme.of(context).textTheme.subhead,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
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
        _calendars = calendarsResult?.data;
      });
    } on PlatformException catch (e) {
      print(e);
    }
  }
}
