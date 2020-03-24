import 'package:concordia_go/blocs/bloc.dart';
import 'package:concordia_go/models/search_result_model.dart';
import 'package:concordia_go/services/search_service.dart';
import 'package:concordia_go/widgets/component/search_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

@immutable
abstract class SearchEvent {
  const SearchEvent();

  SearchState createState();
}

class QueryChangeEvent extends SearchEvent {
  final String _query;
  final SearchType _searchType;
  final SearchService searchService = SearchService.instance;

  QueryChangeEvent(this._query, this._searchType);

  @override
  SearchState createState() {
    var results = searchService.getSearchResults(_query);
    return SearchResultsState(results, _searchType);
  }
}

class EndSearchEvent extends SearchEvent {
  const EndSearchEvent();

  @override
  SearchState createState() {
    return NotSearchingState();
  }
}

class SearchDirectionsEvent extends SearchEvent {
  final SearchResult startingPoint;
  final SearchResult destination;

  const SearchDirectionsEvent({this.startingPoint, this.destination});

  @override
  SearchState createState() {
    return SearchDirectionsState(startingPoint, destination);
  }
}
