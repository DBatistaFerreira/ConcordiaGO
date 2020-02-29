import 'package:concordia_go/widgets/screens/campus_building_list_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class LoadCampusBuildingListMenu extends StatelessWidget {
  String campus;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CampusBuildingListMenu('SGW Campus'),
    );
  }

  LoadCampusBuildingListMenu(String campus) {
    this.campus = campus;
  }
}

void main() {
  testWidgets('SGW Campus Building Menu', (WidgetTester tester) async {
    await tester.pumpWidget(LoadCampusBuildingListMenu("SGW Campus"));

//    final favoritePlaces = find.byIcon(Icons.favorite);
//    final campuses = find.byIcon(Icons.school);
//    final yourNextClass = find.byIcon(Icons.flag);
//    final pointsOfInterest = find.byIcon(Icons.new_releases);
//    final mySchedule = find.byIcon(Icons.calendar_today);
//    final settings = find.byIcon(Icons.settings);
//
//    expect(favoritePlaces, findsOneWidget);
//    expect(campuses, findsNWidgets(2));
//    expect(yourNextClass, findsOneWidget);
//    expect(pointsOfInterest, findsOneWidget);
//    expect(mySchedule, findsOneWidget);
//    expect(settings, findsOneWidget);
  });
}
