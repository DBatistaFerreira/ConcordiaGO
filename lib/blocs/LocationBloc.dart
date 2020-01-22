import 'dart:async';

import 'package:concordia_go/blocs/Bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationBloc implements Bloc {
  final StreamController<Marker> _markerController = StreamController<Marker>.broadcast();
  Stream<Marker> get markerOutput => _markerController.stream;

  final StreamController<LatLng> _locationController = StreamController<LatLng>();
  Sink<LatLng> get locationCoordinates => _locationController.sink;

  LocationBloc() {
    _locationController.stream.listen(createMarker);
  }

  void createMarker(LatLng coordinates) {
    Marker marker = Marker(markerId: MarkerId('current building'), position: coordinates);
    _markerController.sink.add(marker);
  }

  @override
  void dispose() {
    _markerController.close();
    _locationController.close();
  }
}
