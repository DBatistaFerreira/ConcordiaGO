import 'package:concordia_go/models/direction_object.dart';
import 'package:concordia_go/utilities/concordia_constants.dart';

class SearchService {
  SearchService._privateConstructor();

  static final SearchService instance = SearchService._privateConstructor();

  List<Dobject> getSearchResults(String query) {
    var searchResults = <Dobject>[];

    for (var building in buildings.values) {
      if (building.name.toLowerCase().contains(query.trim().toLowerCase()) ||
          building.code.toLowerCase().contains(query.trim().toLowerCase())) {
        searchResults.add(Dobject.building(building));
      }
    }

    if (query.isNotEmpty) {
      for (var room in rooms) {
        var name;
        if (room.building.code == 'MB') {
          name = room.building.code + room.floor + '.' + room.number;
        } else {
          name = room.building.code + room.number;
        }

        if (name.toLowerCase().contains(query.toLowerCase().replaceAll(' ', ''))) {
          searchResults.add(Dobject.indoor(room.node, room.building, room.floor, name));
        }
      }
    }
    return searchResults;
  }
}
