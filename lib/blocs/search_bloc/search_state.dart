import 'package:concordia_go/models/concordia_building_model.dart';
import 'package:meta/meta.dart';

@immutable
abstract class SearchState {
  const SearchState();
}

class InitialSearchState extends SearchState {}

class SearchResultsState extends SearchState {
  final List<ConcordiaBuilding> _results;

  const SearchResultsState(this._results);

  List<ConcordiaBuilding> get results => _results;
}

class NotSearchingState extends SearchState {
  const NotSearchingState();
}
