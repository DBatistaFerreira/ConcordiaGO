import 'package:concordia_go/widgets/screens/quick_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class LoadQuickMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: QuickMenu(),
    );
  }
}

void main() {
  testWidgets('Quick Menu', (WidgetTester tester) async {
    await tester.pumpWidget(LoadQuickMenu());

    final favoritePlaces = find.byIcon(Icons.favorite);
    final campuses = find.byIcon(Icons.school);
    final yourNextClass = find.byIcon(Icons.flag);
    final pointsOfInterest = find.byIcon(Icons.new_releases);
    final mySchedule = find.byIcon(Icons.calendar_today);
    final settings = find.byIcon(Icons.settings);

    expect(favoritePlaces, findsOneWidget);
    expect(campuses, findsNWidgets(2));
    expect(yourNextClass, findsOneWidget);
    expect(pointsOfInterest, findsOneWidget);
    expect(mySchedule, findsOneWidget);
    expect(settings, findsOneWidget);
  });
}
