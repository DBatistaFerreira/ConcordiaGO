import 'dart:async';
import 'dart:collection';

import 'package:concordia_go/blocs/bloc.dart';
import 'package:concordia_go/widgets/screens/home_screen.dart';
import 'package:device_calendar/device_calendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:concordia_go/utilities/application_constants.dart' as application_constants;
import 'package:concordia_go/utilities/application_constants.dart';

import 'event_item.dart';

class CalendarEventsPage extends StatefulWidget {
  const CalendarEventsPage(this._calendar, this._deviceCalendarPlugin, {Key key}) : super(key: key);

  final Calendar _calendar;
  final DeviceCalendarPlugin _deviceCalendarPlugin;

  @override
  _CalendarEventsPageState createState() {
    return _CalendarEventsPageState(_calendar, _deviceCalendarPlugin);
  }
}

class _CalendarEventsPageState extends State<CalendarEventsPage> {
  _CalendarEventsPageState(this._calendar, this._deviceCalendarPlugin);

  final Calendar _calendar;

  final DeviceCalendarPlugin _deviceCalendarPlugin;
  List<Event> _calendarEvents;

  @override
  void initState() {
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
          centerTitle: true,
          title: Image.asset(concordiaGOHeader, height: screenHeight / 12),
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
          if (_calendarEvents?.isNotEmpty ?? false)
            Expanded(
              child: ListView.builder(
                itemCount: _calendarEvents?.length ?? 0,
                itemBuilder: (BuildContext context, int index) {
                  final bool _isFirst = index == 0;
                  return EventItem(_calendarEvents[index], _onTapped, _isFirst);
                },
              ),
            )
          else
            const Center(child: Text('No events found')),
        ],
      ),
    );
  }

  Future<void> _onTapped(Event event) async {
    if (event != null) {
      BlocProvider.of<CalendarBloc>(context).add(GetClass(event));
    }
    final HomeScreen refreshEvents =
        await Navigator.push(context, MaterialPageRoute<HomeScreen>(builder: (BuildContext context) => HomeScreen()));
    if (refreshEvents != null) {
      await _retrieveCalendarEvents();
    }
  }

  Future<void> _retrieveCalendarEvents() async {
    final DateTime startDate = DateTime.now().add(const Duration(days: 0));
    final DateTime endDate = DateTime.now().add(const Duration(days: 30));
    final Result<UnmodifiableListView<Event>> calendarEventsResult = await _deviceCalendarPlugin.retrieveEvents(
        _calendar.id, RetrieveEventsParams(startDate: startDate, endDate: endDate));
    setState(() {
      _calendarEvents = calendarEventsResult?.data;
    });
  }
}
