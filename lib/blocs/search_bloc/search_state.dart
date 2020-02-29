import 'package:concordia_go/models/concordia_building_model.dart';
import 'package:meta/meta.dart';

@immutable
abstract class SearchState {
  const SearchState();
}

class InitialSearchState extends SearchState {}

class ResultsList extends SearchState {
  final List<ConcordiaBuilding> results;

  const ResultsList(this.results);
}

class NotSearching extends SearchState {
  const NotSearching();
}
