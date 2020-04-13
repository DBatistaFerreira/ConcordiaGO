import 'package:concordia_go/models/concordia_building.dart';
import 'package:concordia_go/services/outdoor_path_service.dart';
import 'package:concordia_go/widgets/screens/campus_building_list_menu.dart';
import 'package:concordia_go/widgets/screens/indoor_map_screen.dart';
import 'package:concordia_go/widgets/screens/settings_menu.dart';
import 'package:concordia_go/widgets/screens/points_of_interest.dart';
import 'package:device_calendar/device_calendar.dart';
import 'package:concordia_go/widgets/component/calendar/calendars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:concordia_go/blocs/bloc.dart';
import 'package:concordia_go/utilities/application_constants.dart' as application_constants;
import 'package:concordia_go/widgets/screens/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(<DeviceOrientation>[DeviceOrientation.portraitUp]).then((_) {
    runApp(Application());
  });
}

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
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
        BlocProvider<CalendarBloc>(
          create: (BuildContext context) => CalendarBloc(),
        ),
      ],
      child: MaterialApp(
        title: application_constants.applicationName,
        initialRoute: '/',
        routes: <String, Widget Function(BuildContext)>{
          '/': (BuildContext context) => HomeScreen(),
          '/sgwbuildings': (BuildContext context) => const CampusBuildingListMenu(Campus.SGW),
          '/loyolabuildings': (BuildContext context) => const CampusBuildingListMenu(Campus.Loyola),
          '/calendars': (BuildContext context) =>
              CalendarsPage(DeviceCalendarPlugin(), key: const Key('calendarsPage')),
          '/indoormap': (BuildContext context) => const IndoorMapScreen(),
          '/settings': (BuildContext context) => const SettingsMenu(),
          '/pointsofinterest': (BuildContext context) => const POIMenu(),
        },
      ),
    );
  }
}
