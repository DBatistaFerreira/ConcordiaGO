import 'package:concordia_go/blocs/bloc.dart';
import 'package:concordia_go/models/direction_object.dart';
import 'package:concordia_go/models/direction_request.dart';
import 'package:concordia_go/models/node.dart';
import 'package:concordia_go/services/direction_chain.dart';
import 'package:concordia_go/services/outdoor_path_service.dart';
import 'package:concordia_go/services/scheduler_service.dart';
import 'package:concordia_go/utilities/application_constants.dart';
import 'package:concordia_go/utilities/direction.dart';
import 'package:concordia_go/utilities/floor_maps_lib.dart';
import 'package:concordia_go/widgets/component/search_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DirectionsSearch extends StatefulWidget {
  @override
  DirectionsSearchState createState() => DirectionsSearchState();
}

class DirectionsSearchState extends State<DirectionsSearch> {
  Dobject source;
  Dobject destination;
  final TextEditingController _startTextController = TextEditingController();
  final TextEditingController _destTextController = TextEditingController();

  ModeOfTransport getModeOfTransportFromButton(List<bool> selection) {
    if (selection[0]) {
      return ModeOfTransport.walking;
    } else if (selection[1]) {
      return ModeOfTransport.driving;
    } else if (selection[2]) {
      return ModeOfTransport.transit;
    } else {
      return ModeOfTransport.shuttle;
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<bool> isSelected = <bool>[true, false, false, false];

    return BlocListener<SearchBloc, SearchState>(
      listener: (BuildContext context, SearchState state) {
        if (state is SearchDirectionsState) {
          source = state.source ?? source;
          destination = state.destination ?? destination;
          _startTextController.text = source?.name;
          _destTextController.text = destination?.name;
        }
      },
      child: BlocBuilder<SearchBloc, SearchState>(
        builder: (BuildContext context, SearchState state) {
          if (state is SearchDirectionsState) {
            return Container(
              height: screenHeight / 3,
              color: concordiaRed,
              child: Column(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        readOnly: true,
                        showCursor: false,
                        controller: _startTextController,
                        decoration: InputDecoration(
                          hintText: 'Choose starting point',
                          icon: Icon(
                            Icons.gps_fixed,
                            color: Colors.white,
                          ),
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          fillColor: Colors.white,
                        ),
                        onTap: () {
                          BlocProvider.of<SearchBloc>(context)
                              .add(QueryChangeEvent('', SearchType.source));
                          FocusScope.of(context).requestFocus(focus);
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        readOnly: true,
                        showCursor: false,
                        controller: _destTextController,
                        decoration: InputDecoration(
                          hintText: 'Choose destination',
                          icon: Icon(
                            Icons.location_on,
                            color: Colors.white,
                          ),
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          fillColor: Colors.white,
                        ),
                        onTap: () {
                          BlocProvider.of<SearchBloc>(context).add(
                              QueryChangeEvent('', SearchType.destination));
                          FocusScope.of(context).requestFocus(focus);
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: ToggleButtons(
                      children: <Widget>[
                        Container(
                          width: screenWidth / 4,
                          child: Icon(
                            Icons.directions_walk,
                            size: screenWidth / 10,
                          ),
                        ),
                        Container(
                          width: screenWidth / 4,
                          child: Icon(
                            Icons.directions_car,
                            size: screenWidth / 10,
                          ),
                        ),
                        Container(
                          width: screenWidth / 4,
                          child: Icon(
                            Icons.directions_subway,
                            size: screenWidth / 10,
                          ),
                        ),
                        Container(
                          width: screenWidth / 4,
                          child: Icon(
                            Icons.directions_bus,
                            size: screenWidth / 10,
                          ),
                        ),
                      ],
                      onPressed: (int index) {
                        for (int i = 0; i < isSelected.length; i++) {
                          if (i == index) {
                            isSelected[i] = true;
                          } else {
                            isSelected[i] = false;
                          }
                        }
                        BlocProvider.of<SearchBloc>(context).add(
                            SearchDirectionsEvent(
                                source: source, destination: destination));
                      },
                      isSelected: isSelected,
                      renderBorder: false,
                      color: Colors.white,
                      selectedColor: Colors.lightBlue,
                      fillColor: Colors.white,
                      highlightColor: Colors.grey,
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 5.0),
                          child: IconButton(
                            icon: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                              size: screenWidth / 12,
                            ),
                            onPressed: () {
                              BlocProvider.of<SearchBloc>(context)
                                  .add(const EndSearchEvent());
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: RaisedButton.icon(
                            color: Colors.white,
                            elevation: 0.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                            onPressed: () {
                              if (source != null && destination != null) {
                                if (destination.isIndoorHotspot()) {
                                  if (!handleIndoorPOI()) {
                                    return null;
                                  }
                                }
                                BlocProvider.of<SearchBloc>(context)
                                    .add(const EndSearchEvent());
                                OutdoorPathService.instance.clearAll();
                                if (SchedulerService.instance.getCurrentWeekDay() > 5 && isSelected[3]) {
                                  showDialog<AlertDialog>(
                                    context: context,
                                    builder: (BuildContext context) => shuttleUnavailable(),
                                  );
                                }
                                source.transportMode = getModeOfTransportFromButton(isSelected);
                                destination.transportMode = getModeOfTransportFromButton(isSelected);
                                final DirectionRequest request = DirectionRequest(source, destination);
                                DirectionChain.instance.head.handle(request);
                              }
                            },
                            icon: Icon(
                              Icons.directions,
                              size: screenWidth / 12,
                            ),
                            label: const Text(
                              'Go',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black, fontSize: 16.0),
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
              height: 0,
            );
          }
        },
      ),
    );
  }

  bool handleIndoorPOI() {
    if (source.canHandleIndoorPOI()) {
      if (source.isBuilding()) {
        source = Dobject.indoor(Node('990000'), source.building,
            availableIndoorFloors[source.building.code][0]);
      }
      return true;
    } else {
      showAlert('Feature unavailable',
          'This feature is currently only available from Hall Building. Please select a valid startpoint.');
      return false;
    }
  }

  void showAlert(String title, String message) {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            FlatButton(
              child: const Text('Okay'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  AlertDialog shuttleUnavailable() {
    return AlertDialog(
      title: const Text('Shuttle unavailable'),
      content: const Text('Concordia Shuttle Services are not available on weekends. Rerouting to public transit.'),
      actions: <Widget>[
        FlatButton(
            child: const Text('Continue'),
            onPressed: () {
              Navigator.of(context).pop();
            }),
      ],
    );
  }
}
