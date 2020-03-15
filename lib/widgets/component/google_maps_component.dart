import 'dart:async';

import 'package:concordia_go/utilities/application_constants.dart';
import 'package:concordia_go/widgets/component/search_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:concordia_go/blocs/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:concordia_go/utilities/concordia_constants.dart'
    as concordia_constants;
import 'package:concordia_go/widgets/component/building_info_sheet.dart';

class GoogleMapsComponent extends StatefulWidget {
  @override
  State<GoogleMapsComponent> createState() => GoogleMapsComponentState();
}

Completer<GoogleMapController> _controller = Completer();
BuildContext mapContext;

class GoogleMapsComponentState extends State<GoogleMapsComponent> {
  Set<Polyline> _polylines = <Polyline>{};
  bool polygonVisibility = true;

  Set<Polygon> _buildingShapes() {
    var buildingPolygons = <Polygon>{};
    for (var building in concordia_constants.buildings.values) {
      buildingPolygons.add(
        Polygon(
          visible: polygonVisibility,
          points: building.vertices,
          polygonId: PolygonId(building.code),
          fillColor: Colors.redAccent.withOpacity(0.15),
          strokeColor: Colors.red,
          strokeWidth: 2,
          consumeTapEvents: true,
          onTap: () {
            BlocProvider.of<BuildingInfoBloc>(context)
                .add(ConcordiaBuildingInfo(building.code));
            BuildingInfoSheet.buildInfoSheet(context);
          },
        ),
      );
    }
    return buildingPolygons;
  }

  Future<void> _switchCampus(LatLng currentPosition) async {
    LatLng sgwCoordinates = concordia_constants.sgwCampus['coordinates'];
    LatLng loyolaCoordinates = concordia_constants.loyolaCampus['coordinates'];

    var distanceToSGW = await Geolocator().distanceBetween(
        currentPosition.latitude,
        currentPosition.longitude,
        sgwCoordinates.latitude,
        sgwCoordinates.longitude);
    var distanceToLoyola = await Geolocator().distanceBetween(
        currentPosition.latitude,
        currentPosition.longitude,
        loyolaCoordinates.latitude,
        loyolaCoordinates.longitude);

    if (distanceToSGW < distanceToLoyola) {
      BlocProvider.of<MapBloc>(context).add(
          CameraMove(loyolaCoordinates, concordia_constants.campusZoomLevel));
    } else {
      BlocProvider.of<MapBloc>(context)
          .add(CameraMove(sgwCoordinates, concordia_constants.campusZoomLevel));
    }
  }

  Future<void> _goToLocation(LatLng coordinates, double zoom) async {
    // ignore: omit_local_variable_types
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: coordinates, zoom: zoom)));
  }

  Future<LatLng> getMyLocation() async {
    Position position;
    try {
      position = await Geolocator().getCurrentPosition();
      return LatLng(position.latitude, position.longitude);
    } on PlatformException {
      print('Location access was denied.');
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    final mapBloc = BlocProvider.of<MapBloc>(context);
    final buildingInfoBloc = BlocProvider.of<BuildingInfoBloc>(context);
    LatLng currentCameraPosition = concordia_constants.sgwCampus['coordinates'];
    mapContext = context;

    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            BlocListener<MapBloc, MapState>(
              listener: (context, state) {
                if (state is MapNoMarker) {
                  _goToLocation(state.cameraPosition, state.zoom);
                } else if (state is MapWithMarker) {
                  _goToLocation(
                      LatLng(state.cameraPosition.latitude - 0.0008,
                          state.cameraPosition.longitude),
                      state.zoom);
                } else if (state is DirectionMap) {
                  _polylines = state.directionLines;
                }
              },
              child: BlocBuilder<MapBloc, MapState>(
                builder: (context, state) {
                  return Expanded(
                    child: GoogleMap(
                      mapType: MapType.normal,
                      initialCameraPosition: CameraPosition(
                        target: concordia_constants.sgwCampus['coordinates'],
                        zoom: 15.5,
                      ),
                      onMapCreated: (GoogleMapController controller) {
                        _controller.complete(controller);
                      },
                      myLocationEnabled: true,
                      myLocationButtonEnabled: false,
                      buildingsEnabled: false,
                      markers: state is MapWithMarker
                          ? {
                              Marker(
                                markerId: MarkerId(state.buildingCode),
                                position: state.cameraPosition,
                                consumeTapEvents: true,
                                onTap: () {
                                  buildingInfoBloc.add(ConcordiaBuildingInfo(
                                      state.buildingCode));
                                  BuildingInfoSheet.buildInfoSheet(context);
                                },
                              ),
                            }
                          : null,
                      polylines: _polylines,
                      polygons: _buildingShapes(),
                      onCameraMove: (value) {
                        currentCameraPosition = value.target;
                      },
                      onTap: (value) {
                        if (!FocusScope.of(context).hasPrimaryFocus) {
                          FocusScope.of(context).unfocus();
                        }
                        if (BuildingInfoSheet.bottomSheetController != null) {
                          BuildingInfoSheet.bottomSheetController.close();
                        }
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        Positioned(
          right: 20,
          bottom: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                height: screenHeight / 11,
                width: screenHeight / 11,
                padding: EdgeInsets.all(6.0),
                child: RawMaterialButton(
                  fillColor: concordiaRed,
                  shape: CircleBorder(),
                  elevation: 10.0,
                  child: Icon(
                    Icons.gps_fixed,
                    size: screenWidth / 14,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    GeolocationStatus status;
                    Geolocator()
                        .checkGeolocationPermissionStatus()
                        .then((result) => status = result);
                    getMyLocation().then((myLocation) {
                      if (myLocation != null) {
                        mapBloc.add(CameraMove(myLocation, 17.5));
                      } else if (status == GeolocationStatus.denied) {
                        Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text(
                              'Allow location permissions to access My Location'),
                        ));
                      } else {
                        Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text('Location permission status unknown.'),
                        ));
                      }
                    });
                  },
                ),
              ),
              Container(
                height: screenHeight / 11,
                width: screenHeight / 11,
                padding: EdgeInsets.all(6.0),
                child: RawMaterialButton(
                  fillColor: concordiaRed,
                  shape: CircleBorder(),
                  elevation: 10.0,
                  child: Icon(
                    Icons.sync,
                    size: screenWidth / 11,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    _switchCampus(currentCameraPosition);
                  },
                ),
              ),
            ],
          ),
        ),
        Positioned(
          child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              if (state is ResultsList) {
                return SearchResultsList(state.results);
              } else {
                return Container(
                  height: 0,
                );
              }
            },
          ),
        ),
        Positioned(
          child: SearchBar(),
        ),
      ],
    );
  }
}

Future<void> moveCameraPosition(LatLng coordinates) async {
  // ignore: omit_local_variable_types
  final GoogleMapController controller = await _controller.future;
  await controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: coordinates, zoom: concordia_constants.navZoomLevel)));
}

Future<LatLng> getCurrentLocation() async {
  var position = await Geolocator().getCurrentPosition();
  return LatLng(position.latitude, position.longitude);
}
