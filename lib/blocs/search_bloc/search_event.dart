import 'package:concordia_go/blocs/bloc.dart';
import 'package:concordia_go/services/search_service.dart';
import 'package:meta/meta.dart';

@immutable
abstract class SearchEvent {
  const SearchEvent();

  SearchState createState();
}

class QueryChangeEvent extends SearchEvent {
  final String _query;

  const QueryChangeEvent(this._query);

  @override
  SearchState createState() {
    var results = SearchService.getSearchResults(_query);
    return SearchResultsState(results);
  }
}

class EndSearchEvent extends SearchEvent {
  const EndSearchEvent();

  @override
  SearchState createState() {
    return NotSearchingState();
  }
}
