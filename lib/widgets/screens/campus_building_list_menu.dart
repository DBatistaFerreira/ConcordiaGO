import 'package:concordia_go/blocs/bloc.dart';
import 'package:concordia_go/models/concordia_building_model.dart';
import 'package:concordia_go/utilities/application_constants.dart' as application_constants;
import 'package:concordia_go/utilities/application_constants.dart';
import 'package:concordia_go/utilities/concordia_constants.dart' as concordia_constants;
import 'package:concordia_go/widgets/component/building_info_sheet.dart';
import 'package:concordia_go/widgets/component/google_maps_component.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CampusBuildingListMenu extends StatefulWidget {
  final Campus campus;

  CampusBuildingListMenu(this.campus);

  @override
  State<CampusBuildingListMenu> createState() => CampusBuildingListMenuState(campus);
}

class CampusBuildingListMenuState extends State<CampusBuildingListMenu> {
  final Campus campus;

  CampusBuildingListMenuState(this.campus);

  @override
  Widget build(BuildContext context) {
    var buildingList = <ConcordiaBuilding>[];
    screenHeight = MediaQuery.of(context).size.height;

    concordia_constants.buildings.forEach(
      (code, building) {
        if (building.campus == campus) {
          buildingList.add(building);
        }
      },
    );

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
                '${campusString(campus)} Buildings',
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
              itemCount: buildingList.length,
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
                            buildingList[index].code.length == 2
                                ? buildingList[index].code
                                : buildingList[index].code + ' ',
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
                    buildingList[index].name,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    BlocProvider.of<MapBloc>(context).add(SelectConcordiaBuildingEvent(buildingList[index].code));
                    BlocProvider.of<BuildingInfoBloc>(context)
                        .add(ConcordiaBuildingInfoEvent(buildingList[index].code, false));
                    BuildingInfoSheet.buildInfoSheet(mapContext);
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
