import 'dart:async';

import 'package:concordia_go/blocs/bloc.dart';
import 'package:concordia_go/utilities/application_constants.dart';
import 'package:concordia_go/utilities/concordia_constants.dart'
    as concordia_constants;
import 'package:concordia_go/widgets/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:concordia_go/widgets/component/google_maps_component.dart';

class BuildingInfoSheet {
  static PersistentBottomSheetController bottomSheetController;

  static void buildInfoSheet(BuildContext context) {
    bottomSheetController = showBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        var screenHeight = MediaQuery.of(context).size.height;
        var screenWidth = MediaQuery.of(context).size.width;
        var iconSize = screenWidth / 14;

        return BlocBuilder<BuildingInfoBloc, BuildingInfoState>(
          builder: (context, state) {
            var sheetHeight = screenHeight / 2.14;

            if (state is BuildingInfo) {
              if (state.expandHours) {
                sheetHeight = screenHeight / 1.46;
              }
              return Container(
                height: sheetHeight,
                child: Column(
                  children: [
                    Container(
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
                            padding: EdgeInsets.only(
                                left: state.buildingCode.length == 2
                                    ? 13.0
                                    : 21.0,
                                right: 20.0),
                            child: Text(
                              state.buildingCode,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 24),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  state.buildingName,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                  overflow: TextOverflow.fade,
                                ),
                                Text(
                                  state.campus,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                  textAlign: TextAlign.left,
                                ),
                              ],
                            ),
                          ),
                          Align(
                              alignment: Alignment.centerRight,
                              child: buildIndoorButton(context, state.buildingCode))
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
                                state.address,
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
                                  _launchUrl(
                                      'tel://${concordia_constants.concordiaPhone}');
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: state.hours.length > 1
                                        ? <Widget>[
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text('Mon',
                                                    textAlign: TextAlign.left),
                                                Text('Tue',
                                                    textAlign: TextAlign.left),
                                                Text('Wed',
                                                    textAlign: TextAlign.left),
                                                Text('Thu',
                                                    textAlign: TextAlign.left),
                                                Text('Fri',
                                                    textAlign: TextAlign.left),
                                                Text('Sat',
                                                    textAlign: TextAlign.left),
                                                Text('Sun',
                                                    textAlign: TextAlign.left),
                                              ],
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(state.hours['mon']),
                                                Text(state.hours['tue']),
                                                Text(state.hours['wed']),
                                                Text(state.hours['thu']),
                                                Text(state.hours['fri']),
                                                Text(state.hours['sat']),
                                                Text(state.hours['sun']),
                                              ],
                                            )
                                          ]
                                        : <Widget>[
                                            Text(state.hours['none']),
                                          ],
                                  ),
                                ),
                              ],
                              onExpansionChanged: (isExpanding) {
                                if (isExpanding) {
                                  BlocProvider.of<BuildingInfoBloc>(context)
                                      .add(ToggleHoursEvent(true));
                                } else {
                                  Timer(Duration(milliseconds: 100), () {
                                    BlocProvider.of<BuildingInfoBloc>(context)
                                        .add(ToggleHoursEvent(false));
                                  });
                                }
                              },
                              initiallyExpanded: state.expandHours,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: screenHeight / 12,
                      color: concordiaRed,
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
                                icon: Icon(
                                  Icons.directions,
                                  size: screenWidth / 12,
                                ),
                                label: Text(
                                  'Go',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 16.0),
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                  getCurrentLocation().then(
                                    (value) {
                                      BlocProvider.of<DirectionsBloc>(mc).add(
                                        GetDirections(
                                          value,
                                          state.coordinates,
                                          state.buildingName,
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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

  static Widget buildIndoorButton(BuildContext context, String buildingCode) {
    if (buildingCode == 'H') {
      return
      Padding(
        padding: const EdgeInsets.all(15.0),
        child: RaisedButton.icon(
          color: Colors.white,
          elevation: 0.0,
          icon: Icon(
            Icons.transit_enterexit,
            color: concordiaRed,
          ),
          label: Text(
            'Indoor',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: concordiaRed, fontSize: 16.0),
          ),
          onPressed: () {
            BlocProvider.of<MapBloc>(context).add(FloorChange('H8'));
            Navigator.pop(context);
            Navigator.pushNamed(context, '/indoormap');
          },
        ),
      );
    }
    return Container();
  }

  static void _launchUrl(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Failed to launch $url';
    }
  }
}
