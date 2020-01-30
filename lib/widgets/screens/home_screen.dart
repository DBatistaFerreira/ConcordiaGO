import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:concordia_go/blocs/bloc.dart';
import 'package:concordia_go/widgets/component/quick_menu.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../component/google_maps_component.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => HomePageState();
}

class HomePageState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;

    return BlocProvider<MapBloc>(
      create: (context) => MapBloc(),
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(screenHeight / 12),
            child: AppBar(
              title: Image.asset('assets/logo.png', height: screenHeight / 12),
              backgroundColor: Color(0xff800206),
            )),
        body: GoogleMapsComponent(),
        drawer: QuickMenu(),
      ),
    );
  }
}
