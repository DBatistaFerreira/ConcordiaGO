import 'package:concordia_go/models/search_result_model.dart';
import 'package:concordia_go/utilities/concordia_constants.dart';

class SearchService {
  SearchService._privateConstructor();

  static final SearchService instance = SearchService._privateConstructor();

  List<SearchResult> getSearchResults(String query) {
    var searchResults = <SearchResult>[];

    for (var building in buildings.values) {
      if (building.name.toLowerCase().contains(query.trim().toLowerCase()) ||
          building.code.toLowerCase().contains(query.trim().toLowerCase())) {
        searchResults.add(OutdoorConcordiaResult(building));
      }
    }

    if (query.isNotEmpty) {
      for (var room in rooms) {
        var name = room.building.code + room.number;
        if (name.toLowerCase().contains(query.toLowerCase().replaceAll(' ', ''))) {
          searchResults.add(ClassroomResult(room));
        }
      }
    }
    return searchResults;
  }
}
