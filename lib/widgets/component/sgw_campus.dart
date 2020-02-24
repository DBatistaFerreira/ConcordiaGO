import 'package:concordia_go/blocs/map_bloc.dart';
import 'package:concordia_go/blocs/map_event.dart';
import 'package:concordia_go/utilities/application_constants.dart'
    as application_constants;
import 'package:concordia_go/utilities/concordia_constants.dart'
    as concordia_constants;
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

//    final mapBloc = BlocProvider.of<MapBloc>(context);

    List<Building> buildings = List();
    concordia_constants.buildings.forEach((code, building) =>
        building['campus'] == 'SGW Campus'
            ? buildings.add(Building(code, building['name']))
            : true);

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(screenHeight / 12),
          child: AppBar(
            title: Image.asset('assets/logo.png', height: screenHeight / 12),
            backgroundColor: application_constants.concordiaRed,
          )),
      body: ListView.builder(
        itemCount: buildings.length,
        // Provide a builder function. This is where the magic happens.
        // Convert each item into a widget based on the type of item it is.
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.favorite),
            title: Text(
              buildings[index].name,
              style: Theme.of(context).textTheme.headline,
            ),
            onTap: () {
              Navigator.pop(context);
//              mapBloc.add(
//                  CameraMoveConcordia(buildings[index].buildingCode, context));
            },
          );
        },
      ),
    );
  }
}
