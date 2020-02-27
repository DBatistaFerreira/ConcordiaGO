import 'package:concordia_go/widgets/component/directions_panel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:concordia_go/blocs/bloc.dart';
import 'package:concordia_go/widgets/component/quick_menu.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import '../component/google_maps_component.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => HomePageState();
}

class HomePageState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;

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
      ],
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(screenHeight / 12),
            child: AppBar(
              title: Image.asset('assets/logo.png', height: screenHeight / 12),
              backgroundColor: Color(0xff800206),
            )),
        body: SlidingUpPanel(
          panel: Container(
            height: 400,
            color: Colors.greenAccent,
            child: Text(
              'HELLO WORLD',
              style: TextStyle(fontSize: 24),
            ),
          ),
          body: GoogleMapsComponent(),
          collapsed: DirectionsPanel(),
          minHeight: screenHeight / 3.5,
        ),
        drawer: QuickMenu(),
      ),
    );
  }
}
