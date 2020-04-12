import 'dart:async';
import 'dart:collection';

import 'package:concordia_go/blocs/search_bloc/search_bloc.dart';
import 'package:concordia_go/models/classroom.dart';
import 'package:concordia_go/models/direction_object.dart';
import 'package:concordia_go/utilities/concordia_constants.dart';
import 'package:concordia_go/widgets/component/google_maps_component.dart';
import 'package:concordia_go/widgets/screens/home_screen.dart';
import 'package:device_calendar/device_calendar.dart';
import 'package:flutter/material.dart';
import 'package:concordia_go/utilities/application_constants.dart' as application_constants;
import 'package:concordia_go/utilities/application_constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                'My Schedule',
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
                  return EventItem(
                      _calendarEvents[index], _onTapped, index == 0, validateEvent(_calendarEvents[index]));
                },
              ),
            )
          else
            const Center(child: Text('No events found')),
        ],
      ),
    );
  }

  Future<void> _onTapped(Classroom classroom) async {
    if (classroom != null) {
      Navigator.pop(context);
      Navigator.pop(context);
      final Dobject source = Dobject.hotspot(currentLocation, 'Your Location');
      final Dobject destination = Dobject.indoor(
          classroom.node, classroom.building, classroom.floor, classroom.building.code + classroom.number);
      BlocProvider.of<SearchBloc>(mapContext).add(SearchDirectionsEvent(source: source, destination: destination));
    }
  }

  Future<void> _retrieveCalendarEvents() async {
    final DateTime startDate = DateTime.now().add(const Duration(days: 0));
    final DateTime endDate = DateTime.now().add(const Duration(days: 30));
    final Result<UnmodifiableListView<Event>> calendarEventsResult = await _deviceCalendarPlugin.retrieveEvents(
        _calendar.id, RetrieveEventsParams(startDate: startDate, endDate: endDate));
    setState(() {
      _calendarEvents = calendarEventsResult?.data?.where((Event e) => validateEvent(e) != null)?.toList();
    });
  }
}

Classroom validateEvent(Event event) {
  final List<String> classroomInfo = event.location.split('-');
  if (buildings.containsKey(classroomInfo[0])) {
    final Classroom classroom = Classroom(buildings[classroomInfo[0]], classroomInfo[1], classroomInfo[2]);
    if (rooms.contains(classroom)) {
      return classroom;
    }
  }
  return null;
}
