import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:concordia_go/widgets/screens/quick_menu.dart';
import '../component/google_maps_component.dart';
import 'package:concordia_go/utilities/application_constants.dart' as application_constants;

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => HomePageState();
}

class HomePageState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(screenHeight / 12),
          child: AppBar(
            title: Image.asset('assets/logo.png', height: screenHeight / 12),
            backgroundColor: application_constants.concordiaRed,
          )),
      body: GoogleMapsComponent(),
      drawer: QuickMenu(),
    );
  }
}
