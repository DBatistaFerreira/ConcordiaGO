import 'package:concordia_go/models/direction_object.dart';

/// A direction request to be sent to the direction handler.
class DirectionRequest {
  /// Constructor to create a direction request object with the source and destination direction objects passed.
  DirectionRequest(this.source, this.destination);

  /// Direction object that holds the information of the source.
  Dobject source;

  /// Direction object that holds the information of the destination.
  Dobject destination;
}
