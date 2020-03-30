import 'package:concordia_go/main.dart';
import 'package:concordia_go/widgets/component/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  testWidgets('Google Maps', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    final application = Application();
    await tester.pumpWidget(application);
    expect(find.byType(GoogleMap), findsOneWidget);

    var switchViews = find.byIcon(Icons.sync);
    await tester.tap(switchViews);
    await tester.pump();

    var myLocation = find.byIcon(Icons.gps_fixed);
    await tester.tap(myLocation);
    await tester.pump();

    var menu = find.byIcon(Icons.menu);
    await tester.tap(menu);
    await tester.pump();

    var sgwCampus = find.text('SGW Campus');
    await tester.tap(sgwCampus);
    await tester.pump();
    var sgwCampusBuildings = find.byType(ListTile);
    await tester.tap(sgwCampusBuildings.at(1));
    await tester.pump();

    await tester.tap(menu);
    await tester.pump();
    var loyolaCampus = find.text('Loyola Campus');
    await tester.tap(loyolaCampus);
    await tester.pump();
    var loyolaCampusBuildings = find.byType(ListTile);
    await tester.tap(loyolaCampusBuildings.at(1));
    await tester.pump();

    var searchBar = find.byType(SearchBar);
    expect(searchBar, findsOneWidget);
    await tester.tap(searchBar);
    await tester.pump();

    var searchResult = find.byType(ListTile);
    expect(searchResult, findsWidgets);
    await tester.tap(searchResult.at(1));
    await tester.pump();
  });
}
