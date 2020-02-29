import 'package:meta/meta.dart';

@immutable
abstract class SearchEvent {
  const SearchEvent();
}

class UpdateResults extends SearchEvent {
  final String query;

  const UpdateResults(this.query);
}

class EndSearch extends SearchEvent {
  const EndSearch();
}
