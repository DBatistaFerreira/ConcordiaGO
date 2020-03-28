import 'package:concordia_go/models/direction_object.dart';

/// A direction request to be sent to the direction handler.
class DirectionRequest {
  /// Direction object that holds the information of the source.
  Dobject _source;

  /// Direction object that holds the information of the destination.
  Dobject _destination;

  /// Constructor to create a direction request object with the source and destination direction objects passed.
  DirectionRequest(Dobject source, Dobject destination) {
    _source = source;
    _destination = destination;
  }

  Dobject get source => _source;

  Dobject get destination => _destination;

  set source(Dobject source) {
    _source = source;
  }

  set destination(Dobject destination) {
    _destination = destination;
  }
}
