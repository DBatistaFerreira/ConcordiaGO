import 'package:concordia_go/models/search_result_model.dart';
import 'package:concordia_go/widgets/component/search_bar.dart';
import 'package:meta/meta.dart';

@immutable
abstract class SearchState {
  const SearchState();
}

class InitialSearchState extends SearchState {}

class SearchResultsState extends SearchState {
  final List<SearchResult> _results;
  final SearchType _searchType;

  const SearchResultsState(this._results, this._searchType);

  List<SearchResult> get results => _results;

  SearchType get searchType => _searchType;
}

class NotSearchingState extends SearchState {
  const NotSearchingState();
}

class SearchDirectionsState extends SearchState {
  final SearchResult startingPoint;
  final SearchResult destination;

  const SearchDirectionsState(this.startingPoint, this.destination);
}
