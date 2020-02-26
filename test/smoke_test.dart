import 'package:concordia_go/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  testWidgets('Smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    final application = Application();
    await tester.pumpWidget(application);
    expect(find.byType(GoogleMap), findsOneWidget);
    expect(find.byType(FloatingActionButton), findsNWidgets(2));

    var switch_views = find.byIcon(Icons.sync);
    await tester.tap(switch_views);
    await tester.pump();

    var my_location = find.byIcon(Icons.gps_fixed);
    await tester.tap(my_location);
    await tester.pump();

    var menu = find.byIcon(Icons.menu);
    await tester.tap(menu);
    await tester.pump();

    var sgw_campus = find.text("SGW Campus");
    await tester.tap(sgw_campus);
    await tester.pump();
    var sgw_campus_buildings = find.byType(ListTile);
    await tester.tap(sgw_campus_buildings.at(1));
    await tester.pump();

    await tester.tap(menu);
    await tester.pump();
    var loyola_campus = find.text("Loyola Campus");
    await tester.tap(loyola_campus);
    await tester.pump();
    var loyola_campus_buildings = find.byType(ListTile);
    await tester.tap(loyola_campus_buildings.at(1));
    await tester.pump();
  });
}
