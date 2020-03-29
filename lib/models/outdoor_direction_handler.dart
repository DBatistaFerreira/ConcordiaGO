import 'package:concordia_go/models/direction_handler.dart';
import 'package:concordia_go/models/direction_object.dart';
import 'package:concordia_go/models/direction_request.dart';
import 'package:concordia_go/models/node.dart';
import 'package:concordia_go/services/outdoor_path_service.dart';
import 'package:concordia_go/widgets/component/google_maps_component.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:concordia_go/blocs/bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OutdoorDirectionHandler implements DirectionHandler {
  DirectionHandler _nextHandler;

  @override
  void setNext(DirectionHandler handler) {
    _nextHandler = handler;
  }

  @override
  void handle(DirectionRequest request) {
    if (canHandle(request)) {
      handleOutdoorRequest(request);
    } else {
      _nextHandler.handle(request);
    }
  }

  void handleOutdoorRequest(DirectionRequest request) {
    final LatLng departureCoordinate =
        _isHotspot(request.source) ? request.source.coordinates : request.source.building.coordinates;
    final LatLng destinationCoordinate =
        _isHotspot(request.destination) ? request.destination.coordinates : request.destination.building.coordinates;
    final String destination =
        _isHotspot(request.destination) ? request.destination.name : request.destination.building.name;

    BlocProvider.of<DirectionsBloc>(mapContext).add(
        GetDirectionsEvent(departureCoordinate, destinationCoordinate, destination, request.destination.transportMode));

    if (request.destination.hasNode()) {
      final Dobject newSource =
          Dobject.outdoor(node: Node('990000'), building: request.destination.building, floor: '1');
      OutdoorPathService.instance.addDObject(newSource, request.destination);
    }
  }

  @override
  bool canHandle(DirectionRequest request) => !request.source.hasNode();

  bool _isHotspot(Dobject newDObject) => newDObject.building == null && newDObject.coordinates != null;
}
