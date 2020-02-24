import 'package:concordia_go/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  testWidgets('Smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(Application());

    expect(find.byType(GoogleMap), findsOneWidget);
    expect(find.byType(FloatingActionButton), findsNWidgets(2));
    var zoom_out = find.byIcon(Icons.zoom_out);
    var zoom_in = find.byIcon(Icons.zoom_in);
    var switch_views = find.byIcon(Icons.sync);
    var my_location = find.byIcon(Icons.gps_fixed);
    await tester.tap(zoom_out);
    await tester.tap(zoom_in);
    await tester.tap(switch_views);
    await tester.tap(my_location);
  });
}
