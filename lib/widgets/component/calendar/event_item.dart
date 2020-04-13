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
            buildListTile(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: <Widget>[
                        Text(
                          classroom?.toString() ?? '',
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: <Widget>[
                        Text(_calendarEvent == null
                            ? ''
                            : '${DateFormat("MMMM d, y H:mm").format(_calendarEvent.start)}-${DateFormat("Hm").format(_calendarEvent.end)}'),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.0),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  ListTile buildListTile() {
    if (_isFirst) {
      return ListTile(
        title: const Text('Your next class:', style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle:
            Text(_calendarEvent.title ?? '', style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
        trailing: const Text('Get there >', style: TextStyle(color: Colors.grey)),
      );
    } else {
      return ListTile(
        title: Text(_calendarEvent.title ?? '', style: const TextStyle(fontWeight: FontWeight.bold)),
      );
    }
  }
}
