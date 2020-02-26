import 'package:concordia_go/blocs/bloc.dart';
import 'package:concordia_go/utilities/application_constants.dart' as application_constants;
import 'package:concordia_go/utilities/concordia_constants.dart' as concordia_constants;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Building {
  final String buildingCode;
  final String name;

  Building(this.buildingCode, this.name);
}

class SGWCampusBuildingList extends StatefulWidget {
  @override
  State<SGWCampusBuildingList> createState() => SGWCampusBuildingListState();
}

class SGWCampusBuildingListState extends State<SGWCampusBuildingList> {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;

    List<Building> buildings = List();
    concordia_constants.buildings.forEach((code, building) =>
        building['campus'] == 'SGW Campus' ? buildings.add(Building(code, building['name'])) : true);

    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(screenHeight / 12),
            child: AppBar(
              title: Image.asset('assets/logo.png', height: screenHeight / 12),
              backgroundColor: application_constants.concordiaRed,
            )),
        body: Column(
          children: <Widget>[
            Container(
                child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "SGW Campus Buildings",
                      style: TextStyle(
                        fontFamily: 'Raleway',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    )),
                color: application_constants.concordiaRed,
                height: screenHeight / 15),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: buildings.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Container(
                      height: 50.0,
                      width: 50.0,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Ink(
                          decoration: const ShapeDecoration(
                            color: application_constants.concordiaRed,
                            shape: CircleBorder(),
                          ),
                          child: Center(
                            child: Text(
                              buildings[index].buildingCode.length == 2
                                  ? buildings[index].buildingCode
                                  : buildings[index].buildingCode + ' ',
                              style: TextStyle(
                                fontFamily: 'Raleway',
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 32,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      buildings[index].name,
                      style: Theme.of(context).textTheme.headline,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      BlocProvider.of<MapBloc>(context)
                          .add(CameraMoveConcordia(buildings[index].buildingCode, context));
                    },
                    trailing: Icon(Icons.keyboard_arrow_right),
                  );
                },
              ),
            ),
          ],
        ));
  }
}
