part of 'calendar_bloc.dart';


abstract class CalendarState {
  const CalendarState();
}

class InitialCalendarState extends CalendarState {}

class ClassInfo extends CalendarState {
  final name;
  final location;
  final start_time;
  final end_time;

  ClassInfo(this.name, this.location, this.start_time, this.end_time);


}