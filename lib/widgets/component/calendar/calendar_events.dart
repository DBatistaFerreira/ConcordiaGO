import 'dart:async';

import 'package:concordia_go/blocs/bloc.dart';
import 'package:concordia_go/widgets/screens/home_screen.dart';
import 'package:device_calendar/device_calendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:concordia_go/utilities/application_constants.dart'
    as application_constants;
import 'package:concordia_go/utilities/application_constants.dart';

import 'event_item.dart';

class CalendarEventsPage extends StatefulWidget {
  final Calendar _calendar;
  final DeviceCalendarPlugin _deviceCalendarPlugin;

  CalendarEventsPage(this._calendar, this._deviceCalendarPlugin, {Key key})
      : super(key: key);

  @override
  _CalendarEventsPageState createState() {
    return _CalendarEventsPageState(_calendar, _deviceCalendarPlugin);
  }
}

class _CalendarEventsPageState extends State<CalendarEventsPage> {
  final Calendar _calendar;

  DeviceCalendarPlugin _deviceCalendarPlugin;
  List<Event> _calendarEvents;

  _CalendarEventsPageState(this._calendar, this._deviceCalendarPlugin);

  @override
  initState() {
    super.initState();
    _retrieveCalendarEvents();
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: PreferredSize(
        //title: Text('${_calendar.name} events'),
        //backgroundColor: application_constants.concordiaRed,
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
                '${_calendar.name} events',
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
          (_calendarEvents?.isNotEmpty ?? false)
              ? Expanded(
                  child: ListView.builder(
                    itemCount: _calendarEvents?.length ?? 0,
                    itemBuilder: (BuildContext context, int index) {
                      var _isFirst = index == 0;
                      return EventItem(
                          _calendarEvents[index], _onTapped, _isFirst);
                    },
                  ),
                )
              : Center(child: Text('No events found')),
        ],
      ),
    );
  }

  Future _onTapped(Event event) async {
    if (event != null) {
      BlocProvider.of<CalendarBloc>(context).add(GetClass(event));
    }
    final refreshEvents = await Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) {
      return HomeScreen();
    }));
    if (refreshEvents != null && refreshEvents) {
      await _retrieveCalendarEvents();
    }
  }

  Future _retrieveCalendarEvents() async {
    final startDate = DateTime.now().add(Duration(days: 0));
    final endDate = DateTime.now().add(Duration(days: 30));
    var calendarEventsResult = await _deviceCalendarPlugin.retrieveEvents(
        _calendar.id,
        RetrieveEventsParams(startDate: startDate, endDate: endDate));
    setState(() {
      _calendarEvents = calendarEventsResult?.data;
    });
  }
}
