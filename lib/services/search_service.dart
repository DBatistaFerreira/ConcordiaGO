import 'package:concordia_go/models/search_result_model.dart';
import 'package:concordia_go/utilities/concordia_constants.dart';

class SearchService {
  SearchService._privateConstructor();

  static final SearchService instance = SearchService._privateConstructor();

  List<SearchResult> getSearchResults(String query) {
    var searchResults = <SearchResult>[];

    for (var value in buildings.values) {
      if (value.name.toLowerCase().contains(query.trim().toLowerCase()) ||
          value.code.toLowerCase().contains(query.trim().toLowerCase())) {
        searchResults.add(OutdoorConcordiaResult(value));
      }
    }
    return searchResults;
  }
}
