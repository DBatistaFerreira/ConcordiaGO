import 'package:concordia_go/models/classroom.dart';
import 'package:device_calendar/device_calendar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EventItem extends StatelessWidget {
  const EventItem(this._calendarEvent, this._onTapped, this._isFirst, this.classroom);

  final Event _calendarEvent;
  final Function(Classroom) _onTapped;
  final bool _isFirst;
  final Classroom classroom;

  double get _eventFieldNameWidth => 75.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _onTapped(classroom);
      },
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Padding(padding: EdgeInsets.symmetric(vertical: 10.0)
                //child: FlutterLogo(),
                ),
            ListTile(
                title: Text(_calendarEvent.title ?? ''),
                subtitle: Text(_calendarEvent.description ?? ''),
                trailing: _isFirst ? const Text('My next class') : const Text('')),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: _eventFieldNameWidth,
                          child: const Text('Starts'),
                        ),
                        Text(_calendarEvent == null ? '' : DateFormat.yMd().add_jm().format(_calendarEvent.start)),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.0),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: _eventFieldNameWidth,
                          child: const Text('Ends'),
                        ),
                        Text(_calendarEvent.end == null ? '' : DateFormat.yMd().add_jm().format(_calendarEvent.end)),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: _eventFieldNameWidth,
                          child: const Text('All day?'),
                        ),
                        Text(_calendarEvent.allDay != null && _calendarEvent.allDay ? 'Yes' : 'No')
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: _eventFieldNameWidth,
                          child: const Text('Location'),
                        ),
                        Expanded(
                          child: Text(
                            _calendarEvent?.location ?? '',
                            overflow: TextOverflow.ellipsis,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: _eventFieldNameWidth,
                          child: const Text('URL'),
                        ),
                        Expanded(
                          child: Text(
                            _calendarEvent?.url?.data?.contentText ?? '',
                            overflow: TextOverflow.ellipsis,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: _eventFieldNameWidth,
                          child: const Text('Attendees'),
                        ),
                        Expanded(
                          child: Text(
                            _calendarEvent?.attendees
                                    ?.where((Attendee a) => a.name?.isNotEmpty ?? false)
                                    ?.map((Attendee a) => a.name)
                                    ?.join(', ') ??
                                '',
                            overflow: TextOverflow.ellipsis,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
