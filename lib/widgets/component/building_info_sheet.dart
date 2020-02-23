import 'dart:async';

import 'package:concordia_go/blocs/bloc.dart';
import 'package:concordia_go/utilities/concordia_constants.dart' as concordia_constants;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class BuildingInfoSheet {
  static Color mainColor = Color(0xff800206);
  static PersistentBottomSheetController bottomSheetController;

  static void buildingInfoSheet(context) {
    bottomSheetController = showBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext bc) {
        double screenHeight = MediaQuery.of(context).size.height;
        double screenWidth = MediaQuery.of(context).size.width;
        double iconSize = screenWidth / 14;

        return BlocBuilder<BuildingInfoBloc, BuildingInfoState>(
          builder: (context, state) {
            double sheetHeight = screenHeight / 2.15;
            String buildingName = 'Unavailable';
            String campus = 'Unavailable';
            String address = 'Unavailable';
            if (state is BuildingInfo) {
              buildingName = state.buildingName;
              campus = state.campus;
              address = state.address;
              if (state.expandHours) {
                sheetHeight = screenHeight / 1.48;
              }
            }
            return Container(
              height: sheetHeight,
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: mainColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(18.0),
                        topRight: Radius.circular(18.0),
                      ),
                    ),
                    height: screenHeight / 12,
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 10.0, right: 20.0),
                          child: Icon(
                            Icons.school,
                            color: Colors.white,
                            size: screenWidth / 9,
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(buildingName, style: TextStyle(color: Colors.white, fontSize: 18)),
                            Text(
                              campus,
                              style: TextStyle(color: Colors.white, fontSize: 12),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.white,
                      child: ListView(
                        children: [
                          ListTile(
                            leading: Icon(
                              Icons.place,
                              size: iconSize,
                            ),
                            title: Text(
                              address,
                              overflow: TextOverflow.fade,
                            ),
                            dense: true,
                          ),
                          Material(
                            color: Colors.white,
                            child: ListTile(
                              leading: Icon(
                                Icons.language,
                                size: iconSize,
                              ),
                              title: Text(concordia_constants.concordiaUrl),
                              onTap: () {
                                _launchUrl(concordia_constants.concordiaUrl);
                              },
                              dense: true,
                            ),
                          ),
                          Material(
                            color: Colors.white,
                            child: ListTile(
                              leading: Icon(
                                Icons.phone,
                                size: iconSize,
                              ),
                              title: Text(concordia_constants.concordiaPhone),
                              dense: true,
                              onTap: () {
                                _launchUrl('tel://${concordia_constants.concordiaPhone}');
                              },
                            ),
                          ),
                          ExpansionTile(
                            leading: Icon(
                              Icons.access_time,
                              size: iconSize,
                            ),
                            title: Text(
                              'Opening Hours',
                              style: TextStyle(fontSize: 13),
                            ),
                            children: <Widget>[
                              Container(
                                height: 150,
                                padding: EdgeInsets.only(bottom: 5.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text('Mon', textAlign: TextAlign.left),
                                        Text('Tue', textAlign: TextAlign.left),
                                        Text('Wed', textAlign: TextAlign.left),
                                        Text('Thu', textAlign: TextAlign.left),
                                        Text('Fri', textAlign: TextAlign.left),
                                        Text('Sat', textAlign: TextAlign.left),
                                        Text('Sun', textAlign: TextAlign.left),
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text('9:00 - 5:00'),
                                        Text('9:00 - 5:00'),
                                        Text('9:00 - 5:00'),
                                        Text('9:00 - 5:00'),
                                        Text('9:00 - 5:00'),
                                        Text('9:00 - 5:00'),
                                        Text('9:00 - 5:00'),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                            onExpansionChanged: (isExpanding) {
                              if (isExpanding) {
                                BlocProvider.of<BuildingInfoBloc>(context).add(ToggleHoursEvent(true));
                              } else {
                                Timer(Duration(milliseconds: 100), () {
                                  BlocProvider.of<BuildingInfoBloc>(context).add(ToggleHoursEvent(false));
                                });
                              }
                            },
                            initiallyExpanded: (state as BuildingInfo).expandHours,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: screenHeight / 12,
                    color: mainColor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 10.0),
                          child: SizedBox(
                            height: screenHeight / 16,
                            width: screenWidth / 4,
                            child: RaisedButton.icon(
                              color: Colors.white,
                              elevation: 0.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                              onPressed: () => {},
                              icon: Icon(
                                Icons.directions,
                                size: screenWidth / 12,
                              ),
                              label: Text(
                                'Go',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.black, fontSize: 16.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
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
