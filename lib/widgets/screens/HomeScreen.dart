import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:concordia_go/blocs/LocationBloc.dart';
import 'package:concordia_go/widgets/component/DrawerComponent.dart';
import '../component/GoogleMapsComponent.dart';
import 'package:concordia_go/blocs/BlocProvider.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => HomePageState();
}

class HomePageState extends State<HomeScreen> {
  final bloc = LocationBloc();

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;

    // This BlocProvider provides a LocationBloc at the HomeScreen level that can be accessed by descendants of HomeScreen
    return BlocProvider<LocationBloc>(
      bloc: bloc,
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(screenHeight / 12),
            child: AppBar(
              title: Image.asset('assets/logo.png', height: screenHeight / 12),
              backgroundColor: Color(0xff800206),
            )),
        body: GoogleMapsComponent(),
        drawer: DrawerComponent(),
      ),
    );
  }
}
