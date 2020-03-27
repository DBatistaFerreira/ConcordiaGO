import 'package:concordia_go/blocs/directions_bloc/directions_event.dart';
import 'package:concordia_go/models/direction_handler.dart';
import 'package:concordia_go/models/direction_object.dart';
import 'package:concordia_go/models/direction_request.dart';
import 'package:concordia_go/models/node.dart';
import 'package:concordia_go/services/outdoor_path_service.dart';
import 'package:concordia_go/utilities/direction.dart';
import 'package:concordia_go/widgets/component/google_maps_component.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:concordia_go/blocs/bloc.dart';

class OutdoorDirectionHandler implements DirectionHandler {

  DirectionHandler _next_handler;

  @override
  void setNext(DirectionHandler handler) {
    _next_handler = handler;
  }

  @override
  void handle(DirectionRequest request) {
    if (canHandle(request)) {
      BlocProvider.of<DirectionsBloc>(mapContext).add(GetDirectionsEvent(
          request.source.building.coordinates,
          request.destination.building.coordinates,
          request.destination.building.name,
          ModeOfTransport.walking));

      if (request.destination.hasNode()) {
        var newDobject = Dobject.outdoor(node: Node('990000'),
            building: request.destination.building,
            floor: '1');
        OutdoorPathService.instance.addDObject(newDobject, request.destination);
      }

    } else {
      _next_handler.handle(request);
    }
  }

  @override
  bool canHandle(DirectionRequest request) {
    return !request.source.hasNode(); // TODO: refactor using Dobject isOutdoor function
  }

