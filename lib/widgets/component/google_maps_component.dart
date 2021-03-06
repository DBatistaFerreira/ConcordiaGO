import 'dart:async';

import 'package:concordia_go/models/concordia_building.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:concordia_go/blocs/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:concordia_go/utilities/concordia_constants.dart' as concordia_constants;
import 'package:concordia_go/widgets/component/building_info_sheet.dart';

class GoogleMapsComponent extends StatefulWidget {
  @override
  State<GoogleMapsComponent> createState() => GoogleMapsComponentState();
}

BuildContext mapContext;
LatLng currentCameraPosition;

class GoogleMapsComponentState extends State<GoogleMapsComponent> {
  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();
  Set<Polygon> _buildingShapes = <Polygon>{};
  Set<Polyline> _polylines = <Polyline>{};

  @override
  void initState() {
    super.initState();
    _buildingShapes = _createBuildingShapes();
  }

  Set<Polygon> _createBuildingShapes() {
    final Set<Polygon> buildingPolygons = <Polygon>{};
    for (final ConcordiaBuilding building in concordia_constants.buildings.values) {
      buildingPolygons.add(
        Polygon(
          points: building.vertices,
          polygonId: PolygonId(building.code),
          fillColor: Colors.redAccent.withOpacity(0.15),
          strokeColor: Colors.red,
          strokeWidth: 2,
          consumeTapEvents: true,
          onTap: () {
            BlocProvider.of<BuildingInfoBloc>(context).add(ConcordiaBuildingInfoEvent(building.code, false));
            BuildingInfoSheet.buildInfoSheet(context);
          },
        ),
      );
    }
    return buildingPolygons;
  }

  Future<void> _animateCamera(LatLng coordinates, double zoom) async {
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: coordinates, zoom: zoom)));
  }

  @override
  Widget build(BuildContext context) {
    mapContext = context;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        BlocListener<MapBloc, MapState>(
          listener: (BuildContext context, MapState state) {
            if (state is BasicMapState) {
              _animateCamera(state.cameraPosition, state.zoom);
            } else if (state is ConcordiaMapState) {
              _animateCamera(
                  LatLng(state.cameraPosition.latitude - 0.0004, state.cameraPosition.longitude), state.zoom);
            } else if (state is DirectionMapState) {
              _polylines = state.directionLines;
            }
          },
          child: BlocBuilder<MapBloc, MapState>(
            builder: (BuildContext context, MapState state) {
              return Expanded(
                child: GoogleMap(
                  mapType: MapType.normal,
                  initialCameraPosition: CameraPosition(
                    target: concordia_constants.sgwCampus['coordinates'] as LatLng,
                    zoom: 15.5,
                  ),
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                    currentCameraPosition = concordia_constants.sgwCampus['coordinates'] as LatLng;
                  },
                  myLocationEnabled: true,
                  myLocationButtonEnabled: false,
                  buildingsEnabled: false,
                  // TODO(username): Extract marker logic to methods
                  markers: state is ConcordiaMapState
                      ? <Marker>{
                          Marker(
                            markerId: MarkerId(state.buildingCode),
                            position: state.cameraPosition,
                            consumeTapEvents: true,
                            onTap: () {
                              BlocProvider.of<BuildingInfoBloc>(context)
                                  .add(ConcordiaBuildingInfoEvent(state.buildingCode, false));
                              BuildingInfoSheet.buildInfoSheet(context);
                            },
                          ),
                        }
                      : state is BasicMapState && state.showMarker == true
                          ? <Marker>{
                              Marker(
                                markerId: MarkerId('POI'),
                                position: state.cameraPosition,
                              )
                            }
                          : null,
                  polylines: _polylines,
                  polygons: _buildingShapes,
                  onCameraMove: (CameraPosition value) {
                    currentCameraPosition = value.target;
                  },
                  onTap: (LatLng value) {
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
    );
  }
}
