import 'package:concordia_go/widgets/component/loyola_campus_building_menu.dart';
import 'package:concordia_go/widgets/component/sgw_campus_building_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/bloc.dart';
import 'utilities/application_constants.dart' as application_constants;
import 'widgets/screens/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) {
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
      ],
      child: MaterialApp(
        title: application_constants.applicationName,
        initialRoute: '/',
        routes: {
          '/': (context) => HomeScreen(),
          '/sgwbuildings': (context) => SGWCampusBuildingList(),
          '/loyolabuildings': (context) => LoyolaCampusBuildingList(),
        },
      ),
    );
  }
}
