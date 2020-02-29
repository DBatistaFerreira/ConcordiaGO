import 'package:concordia_go/widgets/component/google_maps_component.dart';
import 'package:concordia_go/widgets/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class LoadGoogleMapsComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GoogleMapsComponent(),
    );
  }
}

void main() {
  testWidgets('Google Maps Component', (WidgetTester tester) async {
    await tester.pumpWidget(GoogleMapsComponent());

    var switch_views = find.byIcon(Icons.sync);
    await tester.tap(switch_views);
    await tester.pump();

    var my_location = find.byIcon(Icons.gps_fixed);
    await tester.tap(my_location);
    await tester.pump();
  });
}
