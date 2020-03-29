part of 'calendar_bloc.dart';

abstract class CalendarState {
  const CalendarState();
}

class InitialCalendarState extends CalendarState {}

class ClassInfo extends CalendarState {
  ClassInfo(this.name, this.location, this.startTime, this.endTime);

  final String name;
  final String location;
  final DateTime startTime;
  final DateTime endTime;
}
