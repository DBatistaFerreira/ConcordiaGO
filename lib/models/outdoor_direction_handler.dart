import 'package:concordia_go/blocs/directions_bloc/directions_event.dart';
import 'package:concordia_go/models/direction_handler.dart';
import 'package:concordia_go/models/direction_object.dart';
import 'package:concordia_go/models/direction_request.dart';
import 'package:concordia_go/models/node.dart';
import 'package:concordia_go/services/outdoor_path_service.dart';
import 'package:concordia_go/widgets/component/google_maps_component.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:concordia_go/blocs/bloc.dart';

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
    var departureCoordinate =
        _isHotspot(request.source) ? request.source.coordinates : request.source.building.coordinates;
    var destinationCoordinate =
        _isHotspot(request.destination) ? request.destination.coordinates : request.destination.building.coordinates;
    var destination = _isHotspot(request.destination) ? request.destination.name : request.destination.building.name;

    BlocProvider.of<DirectionsBloc>(mapContext).add(
        GetDirectionsEvent(departureCoordinate, destinationCoordinate, destination, request.destination.transportMode));

    if (request.destination.hasNode()) {
      var newSource = Dobject.outdoor(node: Node('990000'), building: request.destination.building, floor: '1');
      OutdoorPathService.instance.addDObject(newSource, request.destination);
    }
  }

  @override
  bool canHandle(DirectionRequest request) {
    return !request.source.hasNode();
  }

  bool _isHotspot(newDObject) {
    return (newDObject.building == null && newDObject.coordinates != null);
  }
}
