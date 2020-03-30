import 'package:concordia_go/models/concordia_building.dart';
import 'package:concordia_go/utilities/application_constants.dart';
import 'package:concordia_go/utilities/concordia_constants.dart';
import 'package:concordia_go/widgets/screens/campus_building_list_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  screenHeight = 500;
  screenWidth = 200;

  testWidgets(
    'SGW Campus Building Menu',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: CampusBuildingListMenu(Campus.Loyola),
        ),
      );

      buildings.forEach(
        (code, building) async {
          if (building.campusString() == 'SGW Campus') {
            assert(find.text(building.name) != null);
          }
        },
      );
    },
  );

  testWidgets(
    'Loyola Campus Building Menu',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: CampusBuildingListMenu(Campus.Loyola),
        ),
      );

      buildings.forEach(
        (code, building) {
          if (building.campusString() == 'Loyola Campus') {
            assert(find.text(building.name) != null);
          }
        },
      );
    },
  );
}
