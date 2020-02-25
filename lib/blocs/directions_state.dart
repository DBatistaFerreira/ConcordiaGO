import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meta/meta.dart';

@immutable
abstract class DirectionsState {}

class InitialDirectionsState extends DirectionsState {
  final Set<Polyline> polylines = Set<Polyline>();
}

class polyUpdates extends DirectionsState {
  final Set<Polyline> finalPolyline;

  polyUpdates(this.finalPolyline);
}
