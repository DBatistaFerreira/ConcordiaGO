import 'package:concordia_go/utilities/Direction.dart';
//import 'package:meta/meta.dart';

//@immutable //Error unless I comment out this tag. Tag could be essential. Review by Nick required.
abstract class DirectionsUiState {}

class InitialDirectionsUiState extends DirectionsUiState {
  Direction currentDirection;
}

class DirectionsUiUpdate extends DirectionsUiState {
  Direction newDirection;

  DirectionsUiUpdate(newDirection);
}
