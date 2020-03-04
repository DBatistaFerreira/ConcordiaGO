import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:concordia_go/services/search_service.dart';
import '../bloc.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  @override
  SearchState get initialState => InitialSearchState();

  @override
  Stream<SearchState> mapEventToState(
    SearchEvent event,
  ) async* {
    if (event is UpdateResults) {
      yield ResultsList(SearchService.getSearchResults(event.query));
    } else if (event is EndSearch) {
      yield NotSearching();
    }
  }
}
