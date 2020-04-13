import 'package:concordia_go/widgets/screens/settings_menu.dart';
import 'package:concordia_go/utilities/application_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/*
* Note that the use of the Shared preferences library limits
* the testing of the settings screen since it introduces hardware depended
* features (disk storage)
* */

void main() {
  screenHeight = 500;
  screenWidth = 200;

  testWidgets(
    'Settings Menu',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: SettingsMenu(),
        ),
      );

      // Find Page title
      expect(find.text('Settings'), findsOneWidget);
      expect(find.text('Accessibility'), findsOneWidget);
      expect(find.text('General'), findsOneWidget);

      // Find Prioritize elevators setting
      expect(find.text('Prioritize elevators'), findsOneWidget);
      expect(find.byWidgetPredicate((Widget widget) => widget is Switch), findsOneWidget);

      // Find Prioritize elevators setting
      expect(find.text('Preferred washroom'), findsOneWidget);
      expect(find.text('Male'), findsOneWidget);
      expect(find.byWidgetPredicate((Widget widget) => widget is DropdownButton), findsOneWidget);
    },
  );
}
