import 'package:bloc_test/bloc_test.dart';
import 'package:concordia_go/blocs/search_bloc/search_bloc.dart';
import 'package:concordia_go/blocs/search_bloc/search_event.dart';
import 'package:concordia_go/blocs/search_bloc/search_state.dart';
import 'package:concordia_go/widgets/component/search_bar.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  blocTest(
    'Get Search Result',
    build: () async => SearchBloc(),
    act: (bloc) => bloc.add(QueryChangeEvent('H', SearchType.general)),
    expect: [isA<SearchResultsState>()],
  );

  blocTest(
    'End Searching',
    build: () async => SearchBloc(),
    act: (bloc) => bloc.add(EndSearchEvent()),
    expect: [isA<NotSearchingState>()],
  );

  blocTest(
    'Search Directions',
    build: () async => SearchBloc(),
    act: (bloc) => bloc.add(SearchDirectionsEvent()),
    expect: [isA<SearchDirectionsState>()],
  );
}
