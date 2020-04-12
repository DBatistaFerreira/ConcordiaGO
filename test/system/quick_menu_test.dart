import 'package:concordia_go/utilities/application_constants.dart';
import 'package:concordia_go/widgets/screens/quick_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  screenHeight = 500;
  screenWidth = 200;

  testWidgets('Quick Menu', (WidgetTester tester) async {
    final scaffoldKey = GlobalKey<ScaffoldState>();

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          key: scaffoldKey,
          drawer: QuickMenu(),
        ),
      ),
    );

    scaffoldKey.currentState.openDrawer();
    await tester.pump();

    final campuses = find.byIcon(Icons.school);
    final yourNextClass = find.byIcon(Icons.flag);
    final pointsOfInterest = find.byIcon(Icons.new_releases);
    final mySchedule = find.byIcon(Icons.calendar_today);
    final settings = find.byIcon(Icons.settings);

    expect(campuses, findsNWidgets(2));
    expect(yourNextClass, findsOneWidget);
    expect(pointsOfInterest, findsOneWidget);
    expect(mySchedule, findsOneWidget);
    expect(settings, findsOneWidget);
  });
}
