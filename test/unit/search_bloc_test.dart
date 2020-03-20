import 'package:bloc_test/bloc_test.dart';
import 'package:concordia_go/blocs/search_bloc/search_bloc.dart';
import 'package:concordia_go/blocs/search_bloc/search_event.dart';
import 'package:concordia_go/blocs/search_bloc/search_state.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  blocTest(
    'Get Search Result',
    build: () async {
      return SearchBloc();
    },
    act: (bloc) => bloc.add(QueryChangeEvent('H')),
    expect: [
      isA<SearchResultsState>(),
    ],
  );

  blocTest(
    'End Searching',
    build: () async {
      return SearchBloc();
    },
    act: (bloc) => bloc.add(EndSearchEvent()),
    expect: [
      isA<NotSearchingState>(),
    ],
  );
}
