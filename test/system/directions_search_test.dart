import 'package:concordia_go/blocs/bloc.dart';
import 'package:concordia_go/models/concordia_building.dart';
import 'package:concordia_go/services/outdoor_path_service.dart';
import 'package:concordia_go/utilities/application_constants.dart';
import 'package:concordia_go/widgets/screens/campus_building_list_menu.dart';
import 'package:concordia_go/widgets/screens/home_screen.dart';
import 'package:concordia_go/widgets/screens/indoor_map_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
    'test directions search component',
    (WidgetTester tester) async {
      var searchBloc;
      var blocProvider = MultiBlocProvider(
        providers: [
          BlocProvider<MapBloc>(
            create: (context) => MapBloc(),
          ),
          BlocProvider<BuildingInfoBloc>(
            create: (context) => BuildingInfoBloc(),
          ),
          BlocProvider<DirectionsBloc>(
            create: (context) => DirectionsBloc(OutdoorPathService.instance),
          ),
          BlocProvider<SearchBloc>(
            create: (context) => searchBloc = SearchBloc(),
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
      );

      await tester.pumpWidget(blocProvider);
      searchBloc.add(SearchDirectionsEvent());
      await tester.pump();

      expect(find.byType(TextField), findsNWidgets(2));
      expect(find.byType(Icon), findsNWidgets(12));
      expect(find.byType(IconButton), findsNWidgets(3));
      expect(find.byType(ToggleButtons), findsOneWidget);
    },
  );
}
