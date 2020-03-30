import 'dart:collection';

import 'package:concordia_go/widgets/component/calendar/calendar_events.dart';
import 'package:concordia_go/widgets/component/calendar/calendars.dart';
import 'package:concordia_go/widgets/component/calendar/event_item.dart';
import 'package:device_calendar/device_calendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:concordia_go/blocs/calendar_bloc/calendar_bloc.dart';

class MockDeviceCalendarPlugin extends Mock implements DeviceCalendarPlugin {}

void main() {
  var deviceCalendarPlugin = MockDeviceCalendarPlugin();
  var calendarsPageWidget = MaterialApp(
      home: BlocProvider<CalendarBloc>(
          create: (context) => CalendarBloc(), child: CalendarsPage(deviceCalendarPlugin, key: Key('calendarsPage'))));
  final calendars = Result<UnmodifiableListView<Calendar>>();
  calendars.data = UnmodifiableListView([
    Calendar(
        name: 'test',
        isReadOnly: false,
        isDefault: true,
        color: 1,
        id: '123',
        accountType: 'google',
        accountName: 'test')
  ]);
  final resultPermissions = Result<bool>();

  testWidgets('Choose Calendar Page Widget with Permission', (WidgetTester tester) async {
    resultPermissions.data = true;
    when(deviceCalendarPlugin.hasPermissions()).thenAnswer((_) async => await resultPermissions);
    when(deviceCalendarPlugin.retrieveCalendars()).thenAnswer((_) async => await calendars);

    await tester.pumpWidget(calendarsPageWidget); // runs init
    await tester.pumpWidget(calendarsPageWidget); // loads the rest of the widget
    await tester.tap(find.text('test')); // Throws an error if test calendar does not exist
    await tester.pumpWidget(calendarsPageWidget);
  });

  testWidgets('Choose Calendar Page Widget without Permission', (WidgetTester tester) async {
    resultPermissions.data = false;
    when(deviceCalendarPlugin.hasPermissions()).thenAnswer((_) async => await resultPermissions);
    when(deviceCalendarPlugin.requestPermissions()).thenAnswer((_) async => await resultPermissions);

    await tester.pumpWidget(calendarsPageWidget); // runs init
    await tester.pumpWidget(calendarsPageWidget); // loads the rest of the widget
  });

  testWidgets('Choose Event Page Widget', (WidgetTester tester) async {
    final result = Result<UnmodifiableListView<Event>>();
    result.data = UnmodifiableListView([
      Event('test',
          eventId: '123',
          end: DateTime.now(),
          start: DateTime.now(),
          allDay: false,
          attendees: [],
          description: 'test',
          title: 'class 101',
          recurrenceRule: null)
    ]);

    var widget = MaterialApp(
        home: BlocProvider<CalendarBloc>(
      create: (context) => CalendarBloc(),
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
          key: Key('calendarsPage')),
    ));
    when(deviceCalendarPlugin.retrieveEvents(any, any)).thenAnswer((_) async => await result);

    await tester.pumpWidget(widget); // runs init
    await tester.pumpWidget(widget); // loads the rest of the widget
    await tester.tap(find.text('class 101')); // Throws an error if class 101 does not exist
  });

  testWidgets('Event Widget', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: EventItem(Event('123', start: DateTime.now(), end: DateTime.now()), null, true),
      ),
    );
  });
}
