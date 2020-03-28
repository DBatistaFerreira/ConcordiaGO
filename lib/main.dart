import 'package:concordia_go/widgets/component/calendar/calendars.dart';
import 'package:device_calendar/device_calendar.dart';
import 'package:flutter/material.dart';
import 'package:concordia_go/models/concordia_building_model.dart';
import 'package:concordia_go/widgets/screens/campus_building_list_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:concordia_go/blocs/bloc.dart';
import 'package:concordia_go/utilities/application_constants.dart'
    as application_constants;
import 'package:concordia_go/widgets/screens/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(Application());
  });
}

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MapBloc>(
          create: (context) => MapBloc(),
        ),
        BlocProvider<BuildingInfoBloc>(
          create: (context) => BuildingInfoBloc(),
        ),
        BlocProvider<DirectionsBloc>(
          create: (context) => DirectionsBloc(),
        ),
        BlocProvider<SearchBloc>(
          create: (context) => SearchBloc(),
        ),
        BlocProvider<CalendarBloc>(
          create: (context) => CalendarBloc(),
        ),
      ],
      child: GestureDetector(
        onTap: () {
          if (!FocusScope.of(context).hasPrimaryFocus) {
            FocusScope.of(context).unfocus();
          }
        },
        child: MaterialApp(
          title: application_constants.applicationName,
          initialRoute: '/',
          routes: {
            '/': (context) => HomeScreen(),
            '/sgwbuildings': (context) => CampusBuildingListMenu(Campus.SGW),
            '/loyolabuildings': (context) =>
                CampusBuildingListMenu(Campus.Loyola),
            '/calendars': (context) =>
                CalendarsPage(DeviceCalendarPlugin(), key: Key('calendarsPage'))
          },
        ),
      ),
    );
  }
}
