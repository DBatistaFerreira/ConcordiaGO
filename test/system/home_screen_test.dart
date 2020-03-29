import 'package:concordia_go/blocs/bloc.dart';
import 'package:concordia_go/models/concordia_building.dart';
import 'package:concordia_go/services/outdoor_path_service.dart';
import 'package:concordia_go/utilities/application_constants.dart';
import 'package:concordia_go/widgets/component/building_info_sheet.dart';
import 'package:concordia_go/widgets/component/google_maps_component.dart';
import 'package:concordia_go/widgets/component/search_bar.dart';
import 'package:concordia_go/widgets/screens/campus_building_list_menu.dart';
import 'package:concordia_go/widgets/screens/home_screen.dart';
import 'package:concordia_go/widgets/screens/indoor_map_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  testWidgets(
    'Test HomeScreen components including GoogleMap, BuildingInfoSheet, SearchBar, and SearchResults',
    (WidgetTester tester) async {
      var buildingInfoBloc;

      await tester.pumpWidget(
        MultiBlocProvider(
          providers: [
            BlocProvider<MapBloc>(
              create: (context) => MapBloc(),
            ),
            BlocProvider<BuildingInfoBloc>(
              create: (context) => buildingInfoBloc = BuildingInfoBloc(),
            ),
            BlocProvider<DirectionsBloc>(
              create: (context) => DirectionsBloc(OutdoorPathService.instance),
            ),
            BlocProvider<SearchBloc>(
              create: (context) => SearchBloc(),
            ),
          ],
          child: MaterialApp(
            title: applicationName,
            initialRoute: '/',
            routes: {
              '/': (context) => HomeScreen(),
              '/sgwbuildings': (context) => CampusBuildingListMenu(Campus.SGW),
              '/loyolabuildings': (context) => CampusBuildingListMenu(Campus.Loyola),
              '/indoormap': (context) => IndoorMapScreen(),
            },
          ),
        ),
      );

      // region Test GoogleMap
      expect(find.byType(GoogleMapsComponent), findsOneWidget);
      expect(find.byType(GoogleMap), findsOneWidget);
      // endregion

      // region Test BuildingInfoSheet
      BuildingInfoSheet.buildInfoSheet(mapContext);
      await tester.pump();

      // test less info building info sheet
      buildingInfoBloc.add(ConcordiaBuildingInfoEvent('H', false));
      await tester.pump();

      expect(find.byType(ListTile), findsOneWidget);
      expect(find.byType(FlatButton), findsOneWidget);
      expect(find.byType(IconButton), findsNWidgets(4));

      // test more info building sheet
      buildingInfoBloc.add(ConcordiaBuildingInfoEvent('H', true));
      await tester.pump();

      expect(find.byType(ExpansionTile), findsNWidgets(3));
      expect(find.byType(ListTile), findsNWidgets(6));
      expect(find.byType(FlatButton), findsOneWidget);
      expect(find.byType(IconButton), findsNWidgets(4));

      // test closed building info sheet
      BuildingInfoSheet.bottomSheetController.close();
      await tester.pump();
      expect(find.byType(ExpansionTile), findsNothing);
      // endregion

      // region Test SearchBar and SearchResults
      // test search bar is there
      var searchBar = find.byType(TextField);
      expect(searchBar, findsOneWidget);
      expect(find.byType(SearchBar), findsOneWidget);

      // test search query that matches some results
      await tester.tap(searchBar);
      await tester.enterText(searchBar, 'ha');
      await tester.pump();
      expect(find.byType(ListTile), findsNWidgets(7));

      // test search query that matches no results
      await tester.enterText(searchBar, 'zxqw');
      await tester.pump();
      expect(find.byType(ListTile), findsNothing);
      expect(find.text('No results'), findsOneWidget);
      // endregion
    },
  );
}
