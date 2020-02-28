import 'package:meta/meta.dart';

@immutable
abstract class DirectionsUiEvent {
  const DirectionsUiEvent();
}

class FirstDirection extends DirectionsUiEvent {
  const FirstDirection();
}

class NextDirection extends DirectionsUiEvent {
  const NextDirection();
}

class PreviousDirection extends DirectionsUiEvent {
  const PreviousDirection();
}

class AllDirections extends DirectionsUiEvent {
  const AllDirections();
}
