import 'package:concordia_go/blocs/bloc.dart';
import 'package:concordia_go/models/concordia_building.dart';
import 'package:concordia_go/models/direction_object.dart';
import 'package:concordia_go/models/node.dart';
import 'package:concordia_go/utilities/application_constants.dart';
import 'package:concordia_go/widgets/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RoomInfoSheet {
  static PersistentBottomSheetController bottomSheetController;

  static double listTileHeight = screenHeight / 12;
  static double tileFontSize = 14.0;
  static double iconSize = screenWidth / 14;

  static void buildInfoSheet(ScaffoldState scaffoldState, BuildContext mainContext) {
    bottomSheetController = scaffoldState.showBottomSheet(
      (context) {
        return BlocBuilder<BuildingInfoBloc, BuildingInfoState>(
          builder: (context, state) {
            var sheetHeight = (2 * screenHeight / 12) + (screenHeight / 11);

            if (state is ConcordiaRoomInfoState) {
              var building = state.building;
              var room = state.room;
              var floor = state.floor;
              return Container(
                height: sheetHeight,
                child: Column(
                  children: [
                    roomInfoHeader(context, building, floor, room),
                    buildingInfoAddress(building),
                    buildingInfoFooter(mainContext, building, floor, room),
                  ],
                ),
              );
            } else {
              return Container(
                height: sheetHeight,
                color: Colors.white,
                child: Center(
                  child: Text('Failed to load building info.'),
                ),
              );
            }
          },
        );
      },
    );
  }

  static Widget roomInfoHeader(BuildContext context, ConcordiaBuilding building, String floor, String room) {
    return Container(
      decoration: BoxDecoration(
        color: concordiaRed,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(18.0),
          topRight: Radius.circular(18.0),
        ),
      ),
      height: screenHeight / 11,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(left: building.code.length == 2 ? 13.0 : 21.0, right: 20.0),
            child: Text(
              floor,
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  building.code + room.substring(3),
                  style: TextStyle(color: Colors.white, fontSize: 18),
                  overflow: TextOverflow.fade,
                ),
                Text(
                  building.name,
                  style: TextStyle(color: Colors.white, fontSize: 12),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  static Widget buildingInfoAddress(ConcordiaBuilding building) {
    return Expanded(
      child: Container(
        color: Colors.white,
        height: listTileHeight,
        child: ListTile(
          leading: Icon(
            Icons.place,
            size: iconSize,
          ),
          title: Text(
            building.address,
            style: TextStyle(fontSize: tileFontSize),
            overflow: TextOverflow.fade,
          ),
        ),
      ),
    );
  }

  static Widget buildingInfoFooter(BuildContext context, ConcordiaBuilding building, String floor, String room) {
    return Container(
      height: screenHeight / 12,
      color: concordiaRed,
      child: Align(
        alignment: Alignment.centerRight,
        child: Padding(
          padding: EdgeInsets.only(right: 20.0),
          child: Container(
            height: screenHeight / 18,
            width: 70,
            child: FlatButton(
              padding: EdgeInsets.zero,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24.0),
              ),
              child: Icon(
                Icons.directions,
                color: Colors.black,
                size: 32,
              ),
              onPressed: () {
                // TODO Add navigation bar
                bottomSheetController.close();
                Navigator.pop(context);
                BlocProvider.of<SearchBloc>(context).add(
                  SearchDirectionsEvent(
                    source: Dobject.hotspot(currentLocation, 'Your Location'),
                    destination: Dobject.indoor(Node(room), building, floor, building.code + room.substring(3)),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
