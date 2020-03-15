import 'dart:math';

import 'package:concordia_go/blocs/bloc.dart';
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
  @override
  Widget build(context) {
    // ignore: omit_local_variable_types
    final double screenWidth = MediaQuery.of(context).size.width;

    return BlocBuilder<DirectionsBloc, DirectionsState>(
      builder: (context, state) {
        if (state is InstructionUpdate) {
          return Container(
            color: concordiaRed,
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
                            padding:
                                const EdgeInsets.only(top: 15.0, left: 5.0),
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
                            padding:
                                const EdgeInsets.only(top: 15.0, left: 10.0),
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
                            padding: EdgeInsets.only(left: 10.0),
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
                            children: [
                              Expanded(
                                flex: 3,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 6.0),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
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
                              Expanded(
                                flex: 1,
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: IconButton(
                                    alignment: Alignment.topRight,
                                    padding:
                                        EdgeInsets.only(top: 5.0, right: 5.0),
                                    iconSize: screenWidth / 14,
                                    icon: Icon(
                                      Icons.close,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            exitNavAlert(context),
                                        barrierDismissible: false,
                                      );
                                    },
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
                                    padding: EdgeInsets.only(right: 8.0),
                                    icon: Icon(
                                      Icons.arrow_back,
                                      color: Colors.white,
                                    ),
                                    iconSize: screenWidth / 8,
                                    onPressed: () => {
                                      BlocProvider.of<DirectionsBloc>(context)
                                          .add(PreviousDirection())
                                    },
                                  ),
                                ),
                                Flexible(
                                  child: IconButton(
                                    padding: EdgeInsets.only(left: 8.0),
                                    icon: Icon(
                                      Icons.arrow_forward,
                                      color: Colors.white,
                                    ),
                                    iconSize: screenWidth / 8,
                                    onPressed: () => {
                                      BlocProvider.of<DirectionsBloc>(context)
                                          .add(NextDirection())
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
          );
        } else {
          hidePanel();
          return Container(
            height: 350,
            child: Text('ELSE PANEL'),
          );
        }
      },
    );
  }

  AlertDialog exitNavAlert(context) {
    return AlertDialog(
      title: Text('Exit navigation?'),
      actions: <Widget>[
        FlatButton(
          child: Text('Yes'),
          onPressed: () {
            Navigator.pop(context, true);
            hidePanel();
            BlocProvider.of<MapBloc>(context).add(DirectionLinesEvent(null));
          },
        ),
        FlatButton(
          child: Text('No'),
          onPressed: () {
            Navigator.pop(context, true);
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
}
