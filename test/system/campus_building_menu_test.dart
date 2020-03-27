import 'package:concordia_go/blocs/building_info_bloc/building_info_bloc.dart';
import 'package:concordia_go/blocs/directions_bloc/directions_bloc.dart';
import 'package:concordia_go/blocs/map_bloc/map_bloc.dart';
import 'package:concordia_go/blocs/search_bloc/search_bloc.dart';
import 'package:concordia_go/models/concordia_building.dart';
import 'package:concordia_go/utilities/concordia_constants.dart';
import 'package:concordia_go/widgets/screens/campus_building_list_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

class LoadSGWCampusBuildingListMenu extends StatelessWidget {
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
      ],
      child: GestureDetector(
        onTap: () {
          if (!FocusScope.of(context).hasPrimaryFocus) {
            FocusScope.of(context).unfocus();
          }
        },
        child: MaterialApp(
          initialRoute: '/',
          routes: {
            '/': (context) => CampusBuildingListMenu(Campus.SGW),
          },
        ),
      ),
    );
  }
}

class LoadLoyolaCampusBuildingListMenu extends StatelessWidget {
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
      ],
      child: GestureDetector(
        onTap: () {
          if (!FocusScope.of(context).hasPrimaryFocus) {
            FocusScope.of(context).unfocus();
          }
        },
        child: MaterialApp(
          initialRoute: '/',
          routes: {
            '/': (context) => CampusBuildingListMenu(Campus.Loyola),
          },
        ),
      ),
    );
  }
}

void main() {
  testWidgets('SGW Campus Building Menu', (WidgetTester tester) async {
    await tester.pumpWidget(LoadSGWCampusBuildingListMenu());
    buildings.forEach((code, building) async {
      if (building.campusString() == 'SGW Campus') {
        assert(find.text(building.name) != null);
      }
    });
  });

  testWidgets('Loyola Campus Building Menu', (WidgetTester tester) async {
    await tester.pumpWidget(LoadLoyolaCampusBuildingListMenu());
    buildings.forEach((code, building) {
      if (building.campusString() == 'Loyola Campus') {
        assert(find.text(building.name) != null);
      }
    });
  });
}
