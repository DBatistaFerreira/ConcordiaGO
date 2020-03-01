import 'package:concordia_go/models/concordia_building_model.dart';
import 'package:concordia_go/utilities/concordia_constants.dart';

class SearchService {
  static List<ConcordiaBuilding> getSearchResults(String query) {
    List<ConcordiaBuilding> searchResults = List<ConcordiaBuilding>();

    for (var value in buildings.values) {
      if (value.name.toLowerCase().contains(query.toLowerCase()) ||
          value.code.toLowerCase().contains(query.toLowerCase())) {
        searchResults.add(value);
      }
    }
    return searchResults;
  }
}
