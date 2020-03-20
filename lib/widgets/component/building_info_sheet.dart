import 'package:concordia_go/blocs/bloc.dart';
import 'package:concordia_go/models/concordia_building_model.dart';
import 'package:concordia_go/utilities/application_constants.dart';
import 'package:concordia_go/utilities/concordia_constants.dart' as concordia_constants;
import 'package:concordia_go/widgets/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class BuildingInfoSheet {
  static PersistentBottomSheetController bottomSheetController;

  static double listTileHeight = screenHeight / 12;
  static double tileFontSize = 14.0;
  static double iconSize = screenWidth / 14;

  static void buildInfoSheet(BuildContext context) {
    bottomSheetController = showBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return BlocBuilder<BuildingInfoBloc, BuildingInfoState>(
          builder: (context, state) {
            var sheetHeight = (2 * screenHeight / 12) + (screenHeight / 11);

            if (state is ConcordiaBuildingInfoState) {
              var building = state.building;
              if (state.moreInfo) {
                sheetHeight = (4 * screenHeight / 12) + (screenHeight / 11) + (3 * 58);
              }
              return Container(
                height: sheetHeight,
                child: Column(
                  children: [
                    buildingInfoHeader(building),
                    !state.moreInfo ? buildingInfoAddress(building) : buildingInfoList(context, building),
                    buildingInfoFooter(context, building, state.moreInfo),
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

  static Widget buildingInfoHeader(ConcordiaBuilding building) {
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
              building.code,
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  building.name,
                  style: TextStyle(color: Colors.white, fontSize: 18),
                  overflow: TextOverflow.fade,
                ),
                Text(
                  building.campusString(),
                  style: TextStyle(color: Colors.white, fontSize: 12),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
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

  static Widget buildingInfoList(BuildContext context, ConcordiaBuilding building) {
    return Expanded(
      child: Container(
        color: Colors.white,
        child: ListView(
          children: [
            Container(
              height: listTileHeight,
              child: Material(
                color: Colors.white,
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
                  onTap: () => {},
                ),
              ),
            ),
            Container(
              height: listTileHeight,
              child: Material(
                color: Colors.white,
                child: ListTile(
                  leading: Icon(
                    Icons.language,
                    size: iconSize,
                  ),
                  title: Text(
                    concordia_constants.concordiaUrl,
                    style: TextStyle(fontSize: tileFontSize),
                  ),
                  onTap: () {
                    _launchUrl(concordia_constants.concordiaUrl);
                  },
                ),
              ),
            ),
            Container(
              height: listTileHeight,
              child: Material(
                color: Colors.white,
                child: ListTile(
                  leading: Icon(
                    Icons.phone,
                    size: iconSize,
                  ),
                  title: Text(
                    concordia_constants.concordiaPhone,
                    style: TextStyle(fontSize: tileFontSize),
                  ),
                  onTap: () {
                    _launchUrl('tel://${concordia_constants.concordiaPhone}');
                  },
                ),
              ),
            ),
            Material(
              color: Colors.white,
              child: ExpansionTile(
                leading: Icon(
                  Icons.access_time,
                  size: iconSize,
                ),
                title: Text(
                  'Opening Hours',
                  style: TextStyle(fontSize: tileFontSize),
                ),
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(bottom: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: building.hours.length > 1
                          ? <Widget>[
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: building.hours.keys.map((key) => Text(key)).toList(),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: building.hours.values.map((value) => Text(value)).toList(),
                              )
                            ]
                          : <Widget>[
                              Text(building.hours['none']),
                            ],
                    ),
                  ),
                ],
              ),
            ),
            Material(
              color: Colors.white,
              child: ExpansionTile(
                leading: Icon(
                  Icons.business,
                  size: iconSize,
                ),
                title: Text(
                  'Departments',
                  style: TextStyle(fontSize: tileFontSize),
                ),
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(40.0, 5.0, 40.0, 5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: building.departments.map((item) => Text('•   ' + item)).toList(),
                    ),
                  ),
                ],
              ),
            ),
            Material(
              color: Colors.white,
              child: ExpansionTile(
                leading: Icon(
                  Icons.room_service,
                  size: iconSize,
                ),
                title: Text(
                  'Services',
                  style: TextStyle(fontSize: tileFontSize),
                ),
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(40.0, 5.0, 40.0, 5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: building.services.map((item) => Text('•   ' + item)).toList(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget buildingInfoFooter(BuildContext context, ConcordiaBuilding building, bool moreInfo) {
    return Container(
      height: screenHeight / 12,
      color: concordiaRed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          moreInfo ? lessButton(context, building.code) : moreButton(context, building.code),
          Padding(
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
                  Navigator.pop(context);
                  BlocProvider.of<DirectionsBloc>(context)
                      .add(GetDirectionsEvent(currentLocation, building.coordinates, building.name));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  static Widget moreButton(BuildContext context, String buildingCode) {
    return Padding(
      padding: EdgeInsets.only(left: 12.0),
      child: IconButton(
        color: Colors.white,
        icon: Icon(
          Icons.info_outline,
          color: Colors.white,
          size: 32,
        ),
        onPressed: () {
          BlocProvider.of<BuildingInfoBloc>(context).add(ConcordiaBuildingInfoEvent(buildingCode, true));
        },
      ),
    );
  }

  static Widget lessButton(BuildContext context, String buildingCode) {
    return Padding(
      padding: EdgeInsets.only(left: 12.0),
      child: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: Colors.white,
          size: 32,
        ),
        onPressed: () {
          BlocProvider.of<BuildingInfoBloc>(context).add(ConcordiaBuildingInfoEvent(buildingCode, false));
        },
      ),
    );
  }

  static void _launchUrl(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Failed to launch $url';
    }
  }
}
