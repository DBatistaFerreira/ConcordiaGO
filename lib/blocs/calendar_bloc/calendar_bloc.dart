import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:device_calendar/device_calendar.dart';
import 'package:flutter/material.dart';

part 'calendar_event.dart';
part 'calendar_state.dart';

class CalendarBloc extends Bloc<CalendarEvent, CalendarState> {
  @override
  CalendarState get initialState => InitialCalendarState();

  @override
  Stream<CalendarState> mapEventToState(
      CalendarEvent event,
      ) async* {
    yield event.createState();
  }
}