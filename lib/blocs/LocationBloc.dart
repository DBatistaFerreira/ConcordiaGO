import 'dart:async';

import 'package:flutter_app/blocs/Bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationBloc implements Bloc {
  final StreamController<LatLng> _locationController = StreamController<LatLng>.broadcast();

  Stream<LatLng> get locationStream => _locationController.stream;
  Sink<LatLng> get locationSink => _locationController.sink;

  @override
  void dispose() {
    _locationController.close();
  }
}
