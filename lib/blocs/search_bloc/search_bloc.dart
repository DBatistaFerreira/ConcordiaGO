import 'dart:async';
import 'package:bloc/bloc.dart';
import '../bloc.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  @override
  SearchState get initialState => InitialSearchState();

  @override
  Stream<SearchState> mapEventToState(
    SearchEvent event,
  ) async* {
    yield event.createState();
  }
}
