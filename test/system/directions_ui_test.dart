import 'package:bloc_test/bloc_test.dart';
import 'package:concordia_go/blocs/bloc.dart';
import 'package:concordia_go/models/concordia_building.dart';
import 'package:concordia_go/models/direction_object.dart';
import 'package:concordia_go/utilities/application_constants.dart';
import 'package:concordia_go/utilities/concordia_constants.dart';
import 'package:concordia_go/utilities/direction.dart';
import 'package:concordia_go/widgets/screens/campus_building_list_menu.dart';
import 'package:concordia_go/widgets/screens/home_screen.dart';
import 'package:concordia_go/widgets/screens/indoor_map_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MockDirectionsBloc extends MockBloc<DirectionsEvent, DirectionsState> implements DirectionsBloc {}

void main() {
  Direction step = Direction("test1", LatLng(1, 2), ModeOfTransport.walking, "2.5km", "0:00", "Test Building");
  final directionsBloc = MockDirectionsBloc();
  whenListen(
      directionsBloc,
      Stream.fromIterable([
        InstructionState(step, [step]),
        InstructionState(step, [step]),
        InstructionState(step, [step]),
        InstructionState(step, [step]),
        InstructionState(step, [step]),
      ]));

  testWidgets(
    'test directions search and direction panel widgets',
    (WidgetTester tester) async {
      SearchBloc searchBloc;

      var blocProvider = MultiBlocProvider(
        providers: [
          BlocProvider<MapBloc>(
            create: (context) => MapBloc(),
          ),
          BlocProvider<BuildingInfoBloc>(
            create: (context) => BuildingInfoBloc(),
          ),
          BlocProvider<DirectionsBloc>(
            create: (context) => directionsBloc,
          ),
          BlocProvider<SearchBloc>(
            create: (context) => searchBloc = SearchBloc(),
          ),
          BlocProvider<CalendarBloc>(
            create: (context) => CalendarBloc(),
          )
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

      Dobject source = Dobject.building(buildings['H']);
      Dobject dest = Dobject.building(buildings['MB']);

      await tester.pumpWidget(blocProvider);
      searchBloc.add(SearchDirectionsEvent(source: source, destination: dest));
      await tester.pump();

      expect(find.byType(TextField), findsNWidgets(2));
      expect(find.text(source.name), findsOneWidget);
      expect(find.text(dest.name), findsOneWidget);
      expect(find.byType(ToggleButtons), findsOneWidget);

      var driving = find.byIcon(Icons.directions_car);
      expect(driving, findsOneWidget);
      await tester.tap(driving);
      await tester.pump();

      var go = find.byIcon(Icons.directions);
      expect(go, findsOneWidget);
      await tester.tap(go);
      await tester.pump();

      expect(find.text('Test Building'), findsOneWidget);
      expect(find.byIcon(Icons.my_location), findsOneWidget);
      expect(find.byIcon(Icons.arrow_forward), findsOneWidget);
      expect(find.byIcon(Icons.location_on), findsOneWidget);

      var exitNav = find.byIcon(Icons.close);
      expect(exitNav, findsOneWidget);
      await tester.tap(exitNav);
      await tester.pump();

      var confirmExit = find.text('Yes');
      expect(confirmExit, findsOneWidget);
      await tester.tap(confirmExit);
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 500));

      expect(find.text('Test Building'), findsNothing);
      expect(find.byIcon(Icons.arrow_back), findsNothing);
      expect(find.byIcon(Icons.arrow_forward), findsNothing);
      expect(find.byIcon(Icons.location_on), findsNothing);
    },
  );
}
