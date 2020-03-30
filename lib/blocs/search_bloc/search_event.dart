part of 'search_bloc.dart';

@immutable
abstract class SearchEvent {
  const SearchEvent();

  SearchState createState();
}

class QueryChangeEvent extends SearchEvent {
  QueryChangeEvent(this._query, this._searchType);

  final String _query;
  final SearchType _searchType;
  final SearchService searchService = SearchService.instance;

  @override
  SearchState createState() {
    final List<Dobject> results = searchService.getSearchResults(_query);
    return SearchResultsState(results, _searchType);
  }
}

class EndSearchEvent extends SearchEvent {
  const EndSearchEvent();

  @override
  SearchState createState() => const NotSearchingState();
}

class SearchDirectionsEvent extends SearchEvent {
  const SearchDirectionsEvent({this.source, this.destination});

  final Dobject source;
  final Dobject destination;

  @override
  SearchState createState() {
    return SearchDirectionsState(source, destination);
  }
}
