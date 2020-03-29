part of 'search_bloc.dart';

@immutable
abstract class SearchState {
  const SearchState();
}

class InitialSearchState extends SearchState {}

class SearchResultsState extends SearchState {
  const SearchResultsState(this._results, this._searchType);

  final List<Dobject> _results;
  final SearchType _searchType;

  List<Dobject> get results => _results;

  SearchType get searchType => _searchType;
}

class NotSearchingState extends SearchState {
  const NotSearchingState();
}

class SearchDirectionsState extends SearchState {
  const SearchDirectionsState(this.source, this.destination);

  final Dobject source;
  final Dobject destination;
}
