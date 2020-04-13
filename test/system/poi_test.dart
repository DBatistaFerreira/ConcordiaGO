import 'package:concordia_go/models/hotspot.dart';
import 'package:concordia_go/utilities/application_constants.dart';
import 'package:concordia_go/widgets/screens/outdoor_poi_results.dart';
import 'package:concordia_go/widgets/screens/points_of_interest.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  screenHeight = 500;
  screenWidth = 200;

  testWidgets('POI Menu Test', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: POIMenu(),
      ),
    );

    final restaurants = find.text('Restaurants');

    expect(find.text('Washroom'), findsOneWidget);
    expect(find.text('Water Fountain'), findsOneWidget);
    expect(find.text('Elevators'), findsOneWidget);
    expect(restaurants, findsOneWidget);
    expect(find.text('Shopping'), findsOneWidget);
    expect(find.text('Grocery'), findsOneWidget);
  });

  testWidgets('Outdoor POI Results (No Results)', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: OutdoorPOIResults(<Hotspot>[], HotspotType.Restaurants),
      ),
    );

    expect(find.text('No results'), findsOneWidget);
    expect(find.byType(Card), findsNothing);
  });

  testWidgets('Outdoor POI Results (With Results)', (WidgetTester tester) async {
    final List<Hotspot> hotspots = [
      Hotspot(address: '123 Sesame Street', name: 'Igloo', isOpen: false, priceLevel: 2, rating: 4.9),
      Hotspot(address: '125 Sesame Street', name: 'Pyramid', isOpen: false, priceLevel: 4, rating: 3.6),
    ];

    await tester.pumpWidget(
      MaterialApp(
        home: OutdoorPOIResults(hotspots, HotspotType.Restaurants),
      ),
    );

    expect(find.byType(Card), findsNWidgets(2));
    expect(find.text('123 Sesame Street'), findsOneWidget);
    expect(find.text('125 Sesame Street'), findsOneWidget);
    expect(find.text('Igloo'), findsOneWidget);
    expect(find.text('Pyramid'), findsOneWidget);
    expect(find.text('Closed'), findsNWidgets(2));
    expect(find.text('\$\$'), findsOneWidget);
    expect(find.text('\$\$\$\$'), findsOneWidget);
    expect(find.text('Rating: 4.9 stars'), findsOneWidget);
    expect(find.text('Rating: 3.6 stars'), findsOneWidget);
    expect(find.byType(IconButton), findsNWidgets(2));
    expect(find.byIcon(Icons.directions), findsNWidgets(2));
  });
}
