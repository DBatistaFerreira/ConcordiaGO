import 'package:concordia_go/widgets/component/directions_list.dart';
import 'package:concordia_go/widgets/component/directions_panel.dart';
import 'package:concordia_go/services/outdoor_path_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:concordia_go/widgets/component/quick_menu.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import '../component/google_maps_component.dart';
import 'package:concordia_go/utilities/application_constants.dart' as application_constants;

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => HomePageState();
}

PanelController _pc = PanelController();
BuildContext mc;

class HomePageState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    mc = context;

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(screenHeight / 12),
          child: AppBar(
            title: Image.asset('assets/logo.png', height: screenHeight / 12),
            backgroundColor: application_constants.concordiaRed,
          )),
      body: SlidingUpPanel(
        controller: _pc,
        color: Colors.transparent,
        panel: DirectionsList(),
        body: GoogleMapsComponent(),
        collapsed: DirectionsPanel(),
        minHeight: screenHeight / 3.5,
        maxHeight: screenHeight / 1.4,
      ),
      drawer: QuickMenu(),
    );
  }
}

void hidePanel() {
  OutdoorPathService.clearAll();
  _pc.hide();
}

void revealPanel() {
  _pc.show();
}
