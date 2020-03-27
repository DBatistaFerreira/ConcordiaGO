part of 'calendar_bloc.dart';

@immutable
abstract class CalendarEvent {
  const CalendarEvent();

  CalendarState createState();
}

class GetCurrentClass extends CalendarEvent {
  final Event event;

  const GetCurrentClass(this.event);

  @override
  CalendarState createState() {
    return ClassInfo(event.title, event.location, event.start, event.end);
  }
}

class GetNextClass extends CalendarEvent {

  final Event event;

  const GetNextClass(this.event);

  @override
  CalendarState createState() {
    return ClassInfo(event.title, event.location, event.start, event.end);
  }
}
