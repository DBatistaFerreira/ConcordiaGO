import 'package:concordia_go/blocs/bloc.dart';
import 'package:concordia_go/services/search_service.dart';
import 'package:meta/meta.dart';

@immutable
abstract class SearchEvent {
  const SearchEvent();

  SearchState createState();
}

class UpdateResults extends SearchEvent {
  final String _query;

  const UpdateResults(this._query);

  @override
  SearchState createState() {
    var results = SearchService.getSearchResults(_query);
    return ResultsList(results);
  }
}

class EndSearch extends SearchEvent {
  const EndSearch();

  @override
  SearchState createState() {
    return NotSearching();
  }
}
