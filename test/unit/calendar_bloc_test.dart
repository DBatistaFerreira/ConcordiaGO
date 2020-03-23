import 'package:bloc_test/bloc_test.dart';
import 'package:concordia_go/utilities/concordia_constants.dart';
import 'package:device_calendar/device_calendar.dart';
import 'package:concordia_go/blocs/calendar_bloc/calendar_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> main() async {
  final fakeCalendarId = 'fakeCalendarId';
  final event = Event(fakeCalendarId);
  event.title = 'fakeEventTitle';
  event.start = DateTime.now();
  event.end = event.start.add(Duration(hours: 1));
  final state = GetClass(event);

  blocTest(
    'Get Class Info',
    build: () async => CalendarBloc(),
    act: (bloc) {
      return bloc.add(state);
    },
    expect: [isA<CalendarState>()],
  );
}