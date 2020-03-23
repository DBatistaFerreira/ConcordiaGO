

import 'package:concordia_go/widgets/component/calendar/calendars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class LoadCalendarUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CalendarsPage(key: Key('calendarsPage'))
    );
  }
}
void main() {
  testWidgets('Calendar Page', (WidgetTester tester) async {
    await tester.pumpWidget(LoadCalendarUI());
  });
}