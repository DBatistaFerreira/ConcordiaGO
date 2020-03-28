import 'package:concordia_go/models/direction_object.dart';
import 'package:concordia_go/widgets/component/search_bar.dart';
import 'package:meta/meta.dart';

@immutable
abstract class SearchState {
  const SearchState();
}

class InitialSearchState extends SearchState {}

class SearchResultsState extends SearchState {
  final List<Dobject> _results;
  final SearchType _searchType;

  const SearchResultsState(this._results, this._searchType);

  List<Dobject> get results => _results;

  SearchType get searchType => _searchType;
}

class NotSearchingState extends SearchState {
  const NotSearchingState();
}

class SearchDirectionsState extends SearchState {
  final Dobject source;
  final Dobject destination;

  const SearchDirectionsState(this.source, this.destination);
}
