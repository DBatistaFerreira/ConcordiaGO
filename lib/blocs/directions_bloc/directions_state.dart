part of 'directions_bloc.dart';

@immutable
abstract class DirectionsState {}

class InitialDirectionsState extends DirectionsState {}

class InstructionState extends DirectionsState {
  InstructionState(this._step, this._directionsList);

  final Direction _step;
  final List<Direction> _directionsList;

  Direction get step => _step;

  List<Direction> get directionsList => _directionsList;
}
