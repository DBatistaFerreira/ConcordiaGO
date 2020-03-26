import 'package:concordia_go/utilities/direction.dart';
import 'package:meta/meta.dart';

@immutable
abstract class DirectionsState {}

class InitialDirectionsState extends DirectionsState {}

class InstructionState extends DirectionsState {
  final Direction _step;
  final List<Direction> _directionsList;

  InstructionState(this._step, this._directionsList);

  Direction get step => _step;

  List<Direction> get directionsList => _directionsList;
}
