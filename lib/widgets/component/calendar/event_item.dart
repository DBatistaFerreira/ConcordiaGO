import 'package:device_calendar/device_calendar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EventItem extends StatelessWidget {
  final Event _calendarEvent;

  final Function(Event) _onTapped;

  final bool _isFirst;

  final double _eventFieldNameWidth = 75.0;

  EventItem(this._calendarEvent, this._onTapped, this._isFirst);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _onTapped(_calendarEvent);
      },
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(padding: const EdgeInsets.symmetric(vertical: 10.0)
                //child: FlutterLogo(),
                ),
            ListTile(
                title: Text(_calendarEvent.title ?? ''),
                subtitle: Text(_calendarEvent.description ?? ''),
                trailing: _isFirst ? Text('My next class') : Text('')),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: [
                        Container(
                          width: _eventFieldNameWidth,
                          child: Text('Starts'),
                        ),
                        Text(_calendarEvent == null ? '' : DateFormat.yMd().add_jm().format(_calendarEvent.start)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.0),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: [
                        Container(
                          width: _eventFieldNameWidth,
                          child: Text('Ends'),
                        ),
                        Text(_calendarEvent.end == null ? '' : DateFormat.yMd().add_jm().format(_calendarEvent.end)),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: [
                        Container(
                          width: _eventFieldNameWidth,
                          child: Text('All day?'),
                        ),
                        Text(_calendarEvent.allDay != null && _calendarEvent.allDay ? 'Yes' : 'No')
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: [
                        Container(
                          width: _eventFieldNameWidth,
                          child: Text('Location'),
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
                  SizedBox(
                    height: 10.0,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: [
                        Container(
                          width: _eventFieldNameWidth,
                          child: Text('URL'),
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
                  SizedBox(
                    height: 10.0,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: [
                        Container(
                          width: _eventFieldNameWidth,
                          child: Text('Attendees'),
                        ),
                        Expanded(
                          child: Text(
                            _calendarEvent?.attendees
                                    ?.where((a) => a.name?.isNotEmpty ?? false)
                                    ?.map((a) => a.name)
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
