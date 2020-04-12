import 'dart:math';

import 'package:concordia_go/blocs/bloc.dart';
import 'package:concordia_go/services/outdoor_path_service.dart';
import 'package:concordia_go/utilities/application_constants.dart';
import 'package:concordia_go/utilities/direction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:concordia_go/widgets/screens/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DirectionsPanel extends StatefulWidget {
  @override
  State<DirectionsPanel> createState() => DirectionsPanelState();
}

class DirectionsPanelState extends State<DirectionsPanel> {
  final OutdoorPathService outdoorPathService = OutdoorPathService.instance;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DirectionsBloc, DirectionsState>(
      builder: (BuildContext context, DirectionsState state) {
        if (state is InstructionState) {
          return Container(
            color: concordiaRed,
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Container(),
                      ),
                      Expanded(
                        flex: 6,
                        child: Icon(
                          Icons.keyboard_arrow_up,
                          color: Colors.white,
                          size: screenWidth / 12,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: IconButton(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(0.0),
                          iconSize: screenWidth / 14,
                          icon: Icon(
                            Icons.close,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            showDialog<AlertDialog>(
                              context: context,
                              builder: (BuildContext context) => exitNavAlert(context),
                              barrierDismissible: false,
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Expanded(
                              flex: 2,
                              child: Container(
                                color: concordiaRed,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 4.0, left: 5.0),
                                  child: Align(
                                    alignment: Alignment.topCenter,
                                    child: getIcon(state.step.icons, screenWidth / 8),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Icon(
                                    Icons.location_on,
                                    color: Colors.white,
                                    size: screenWidth / 12,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 7,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Expanded(
                              flex: 2,
                              child: Container(
                                color: concordiaRed,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 4.0, left: 10.0),
                                  child: Text(
                                    state.step.instruction,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      state.step.destination,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              flex: 3,
                              child: Container(
                                color: concordiaRed,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Expanded(
                                      flex: 3,
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 5.0, left: 6.0),
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            state.step.distance,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 5.0, right: 8.0),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Row(
                                    children: <Widget>[
                                      Flexible(
                                        child: IconButton(
                                          padding: const EdgeInsets.only(right: 8.0),
                                          icon: Icon(
                                            !outdoorPathService.isFirstInstruction()
                                                ? Icons.arrow_back
                                                : Icons.my_location,
                                            color: Colors.white,
                                          ),
                                          iconSize: screenWidth / 8,
                                          onPressed: () {
                                            BlocProvider.of<DirectionsBloc>(context).add(PreviousInstructionEvent());
                                          },
                                        ),
                                      ),
                                      Flexible(
                                        child: IconButton(
                                          padding: const EdgeInsets.only(left: 8.0),
                                          icon: getRightIcon(),
                                          iconSize: screenWidth / 8,
                                          onPressed: () {
                                            BlocProvider.of<DirectionsBloc>(context).add(NextInstructionEvent());
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Arrive at',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    state.step.arrivalTime,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        } else {
          hidePanel();
          return Container(
            height: 100,
            child: Column(
              children: <Widget>[
                const Text('Error in getting directions'),
                IconButton(
                  alignment: Alignment.topRight,
                  padding: const EdgeInsets.only(top: 5.0, right: 5.0),
                  iconSize: screenWidth / 14,
                  icon: Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    showDialog<AlertDialog>(
                      context: context,
                      builder: (BuildContext context) => exitNavAlert(context),
                      barrierDismissible: false,
                    );
                  },
                ),
              ],
            ),
          );
        }
      },
    );
  }

  AlertDialog exitNavAlert(BuildContext context) {
    return AlertDialog(
      title: const Text('Exit navigation?'),
      actions: <Widget>[
        FlatButton(
          child: const Text('Yes'),
          onPressed: () {
            Navigator.of(context).pop();
            hidePanel();
            BlocProvider.of<MapBloc>(context).add(const DirectionLinesEvent(null));
          },
        ),
        FlatButton(
          child: const Text('No'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }

  Widget getIcon(IconType type, double size) {
    IconData icon;
    bool flip = false;
    switch (type) {
      case IconType.left:
        icon = Icons.subdirectory_arrow_right;
        flip = true;
        break;
      case IconType.right:
        icon = Icons.subdirectory_arrow_left;
        flip = true;
        break;
      case IconType.compass:
        icon = Icons.arrow_upward;
        break;
      case IconType.walk:
        icon = Icons.directions_walk;
        break;
      case IconType.bus:
        icon = Icons.directions_bus;
        break;
      case IconType.subway:
        icon = Icons.directions_subway;
        break;
      case IconType.fork:
        icon = Icons.navigation;
        break;
      case IconType.merge:
        icon = Icons.time_to_leave;
        break;
      case IconType.generic:
        icon = Icons.map;
        break;
    }
    if (flip) {
      return Transform.rotate(
        angle: pi,
        child: Icon(
          icon,
          color: Colors.white,
          size: size,
        ),
      );
    } else {
      return Icon(
        icon,
        color: Colors.white,
        size: size,
      );
    }
  }

  Icon getRightIcon() {
    if (outdoorPathService.isLastInstruction()) {
      if (outdoorPathService.dobjectList.isEmpty) {
        return Icon(
          Icons.flag,
          color: Colors.white,
        );
      } else {
        return Icon(
          Icons.exit_to_app,
          color: Colors.white,
        );
      }
    } else {
      return Icon(
        Icons.arrow_forward,
        color: Colors.white,
      );
    }
  }
}
