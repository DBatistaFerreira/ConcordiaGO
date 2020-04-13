import 'dart:collection';

import 'package:concordia_go/widgets/component/calendar/calendar_events.dart';
import 'package:concordia_go/widgets/component/calendar/event_item.dart';
import 'package:device_calendar/device_calendar.dart';
import 'package:concordia_go/blocs/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockDeviceCalendarPlugin extends Mock implements DeviceCalendarPlugin {}
class MockBlockProvider extends Mock implements SearchBloc {

}

void main() {
  final DeviceCalendarPlugin deviceCalendarPlugin = MockDeviceCalendarPlugin();
  final Result<UnmodifiableListView<Calendar>> calendars = Result<UnmodifiableListView<Calendar>>();
  calendars.data = UnmodifiableListView<Calendar>(<Calendar>[
    Calendar(
        name: 'test',
        isReadOnly: false,
        isDefault: true,
        color: 1,
        id: '123',
        accountType: 'google',
        accountName: 'test')
  ]);

  testWidgets('Choose Event Page Widget', (WidgetTester tester) async {
    final Result<UnmodifiableListView<Event>> result = Result<UnmodifiableListView<Event>>();
    final Event event = Event('test',
        eventId: '123',
        end: DateTime.now(),
        start: DateTime.now(),
        allDay: false,
        attendees: [],
        description: 'test',
        title: 'class 101',
        recurrenceRule: null);
    event.location = 'H-8-801';
    result.data = UnmodifiableListView<Event>(<Event>[
      event
    ]);
    final MaterialApp widget = MaterialApp(
        home: BlocProvider<SearchBloc>(
          create: (BuildContext context) => MockBlockProvider(),
          child: CalendarEventsPage(
              Calendar(
                  accountName: 'test',
                  accountType: 'test',
                  color: 1,
                  id: '1234',
                  isDefault: true,
                  isReadOnly: false,
                  name: 'Test'),
              deviceCalendarPlugin,
              key: const Key('calendarsPage')),
        ));
    when(deviceCalendarPlugin.retrieveEvents(any, any)).thenAnswer((_) async => result);

    await tester.pumpWidget(widget); // runs init
    await tester.pumpWidget(widget); // loads the rest of the widget
    find.text('class 101'); // Throws an error if class 101 does not exist
  });

  testWidgets('Event Widget', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: EventItem(Event('123', start: DateTime.now(), end: DateTime.now()), null, true, null),
      ),
    );
  });
}
