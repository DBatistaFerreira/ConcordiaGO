import 'package:concordia_go/blocs/bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meta/meta.dart';

@immutable
abstract class DirectionsState {}

class InitialDirectionsState extends DirectionsState {
  Set<Polyline> polylines = Set<Polyline>();

}

class polyUpdates extends DirectionsState{
  Set<Polyline> finalPolyline;

  polyUpdates(this.finalPolyline);
}
