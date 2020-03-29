import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:concordia_go/models/direction_object.dart';
import 'package:concordia_go/services/search_service.dart';
import 'package:concordia_go/widgets/component/search_bar.dart';
import 'package:flutter/widgets.dart';

part 'search_event.dart';
part 'search_state.dart';

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
