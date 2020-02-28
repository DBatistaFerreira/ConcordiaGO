import 'package:concordia_go/blocs/bloc.dart';
import 'package:concordia_go/models/building_model.dart';
import 'package:concordia_go/utilities/application_constants.dart' as application_constants;
import 'package:concordia_go/utilities/concordia_constants.dart' as concordia_constants;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CampusBuildingListMenu extends StatefulWidget {
  final String campusName;

  CampusBuildingListMenu(this.campusName);

  @override
  State<CampusBuildingListMenu> createState() => CampusBuildingListMenuState(campusName);
}

class CampusBuildingListMenuState extends State<CampusBuildingListMenu> {
  final String campusName;

  CampusBuildingListMenuState(this.campusName);

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;

    List<Building> buildings = List();
    concordia_constants.buildings.forEach((code, building) {
      if (building['campus'] == campusName) {
        Building b = Building();
        b.code = code;
        b.name = building['name'];
        buildings.add(b);
      }
    });

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenHeight / 12),
        child: AppBar(
          title: Image.asset('assets/logo.png', height: screenHeight / 12),
          backgroundColor: application_constants.concordiaRed,
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            child: Align(
              alignment: Alignment.center,
              child: Text(
                campusName + " Buildings",
                style: TextStyle(
                  fontFamily: 'Raleway',
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: application_constants.listElementTextSize,
                ),
              ),
            ),
            color: application_constants.concordiaRed,
            height: screenHeight / 15,
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: buildings.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Container(
                    height: application_constants.initialedIconSize,
                    width: application_constants.initialedIconSize,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Ink(
                        decoration: const ShapeDecoration(
                          color: application_constants.concordiaRed,
                          shape: CircleBorder(),
                        ),
                        child: Center(
                          child: Text(
                            buildings[index].code.length == 2 ? buildings[index].code : buildings[index].code + ' ',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: application_constants.listElementTextSize,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                  title: Text(
                    buildings[index].name,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    BlocProvider.of<MapBloc>(context).add(CameraMoveConcordia(buildings[index].code, context));
                  },
                  trailing: Icon(Icons.keyboard_arrow_right),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
