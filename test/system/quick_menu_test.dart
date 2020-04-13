import 'package:concordia_go/utilities/application_constants.dart';
import 'package:concordia_go/widgets/screens/quick_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:concordia_go/models/concordia_building.dart';
import 'package:concordia_go/services/outdoor_path_service.dart';
import 'package:concordia_go/widgets/screens/campus_building_list_menu.dart';
import 'package:concordia_go/widgets/screens/indoor_map_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:concordia_go/blocs/bloc.dart';
import 'package:concordia_go/utilities/application_constants.dart' as application_constants;

void main() {
  screenHeight = 500;
  screenWidth = 200;

  testWidgets('Quick Menu', (WidgetTester tester) async {
    final scaffoldKey = GlobalKey<ScaffoldState>();

    await tester.pumpWidget(
        MultiBlocProvider(
          providers: <BlocProvider<dynamic>>[
            BlocProvider<MapBloc>(
              create: (BuildContext context) => MapBloc(),
            ),
            BlocProvider<BuildingInfoBloc>(
              create: (BuildContext context) => BuildingInfoBloc(),
            ),
            BlocProvider<DirectionsBloc>(
              create: (BuildContext context) => DirectionsBloc(OutdoorPathService.instance),
            ),
            BlocProvider<SearchBloc>(
              create: (BuildContext context) => SearchBloc(),
            ),
          ],
          child: MaterialApp(
            title: application_constants.applicationName,
            routes: <String, Widget Function(BuildContext)>{
              '/sgwbuildings': (BuildContext context) => const CampusBuildingListMenu(Campus.SGW),
              '/loyolabuildings': (BuildContext context) => const CampusBuildingListMenu(Campus.Loyola),
              '/indoormap': (BuildContext context) => const IndoorMapScreen(),
            },
            home: Scaffold(
              key: scaffoldKey,
              drawer: QuickMenu(),
            ),
          ),
        )
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
    await tester.tap(settings);
    await tester.tap(pointsOfInterest);
  });
}
