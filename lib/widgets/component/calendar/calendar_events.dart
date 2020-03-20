import 'dart:async';

import 'package:concordia_go/blocs/bloc.dart';
import 'package:concordia_go/widgets/screens/home_screen.dart';
import 'package:device_calendar/device_calendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'event_item.dart';

class CalendarEventsPage extends StatefulWidget {
  final Calendar _calendar;

  CalendarEventsPage(this._calendar, {Key key}) : super(key: key);

  @override
  _CalendarEventsPageState createState() {
    return _CalendarEventsPageState(_calendar);
  }
}

class _CalendarEventsPageState extends State<CalendarEventsPage> {
  final Calendar _calendar;
  BuildContext _scaffoldContext;

  DeviceCalendarPlugin _deviceCalendarPlugin;
  List<Event> _calendarEvents;
  bool _isLoading = true;

  _CalendarEventsPageState(this._calendar) {
    _deviceCalendarPlugin = DeviceCalendarPlugin();
  }

  @override
  initState() {
    super.initState();
    _retrieveCalendarEvents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${_calendar.name} events')),
      body: (_calendarEvents?.isNotEmpty ?? false)
          ? Stack(
              children: [
                ListView.builder(
                  itemCount: _calendarEvents?.length ?? 0,
                  itemBuilder: (BuildContext context, int index) {
                    return EventItem(
                        _calendarEvents[index],
                        _deviceCalendarPlugin,
                        _onLoading,
                        _onDeletedFinished,
                        _onTapped);
                  },
                ),
                if (_isLoading)
                  Center(
                    child: CircularProgressIndicator(),
                  )
              ],
            )
          : Center(child: Text('No events found')),
    );
  }

  void _onLoading() {
    setState(() {
      _isLoading = true;
    });
  }

  Future _onDeletedFinished(bool deleteSucceeded) async {
    if (deleteSucceeded) {
      await _retrieveCalendarEvents();
    } else {
      Scaffold.of(_scaffoldContext).showSnackBar(SnackBar(
        content: Text('Oops, we ran into an issue deleting the event'),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 5),
      ));
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future _onTapped(Event event) async {
    if(event != null) {
      BlocProvider.of<CalendarBloc>(context).add(GetCurrentClass(event));
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
      _isLoading = false;
    });
  }
}
