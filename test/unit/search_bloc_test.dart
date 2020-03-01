import 'package:bloc_test/bloc_test.dart';
import 'package:concordia_go/blocs/search_bloc/search_bloc.dart';
import 'package:concordia_go/blocs/search_bloc/search_event.dart';
import 'package:concordia_go/blocs/search_bloc/search_state.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final event = UpdateResults("Hall Building");

  blocTest(
    'Get Search Result',
    build: () async {
      return SearchBloc();
    },
    act: (bloc) => bloc.add(event),
    expect: [
      isA<ResultsList>(),
    ],
  );

  blocTest(
    'End Searching',
    build: () async {
      return SearchBloc();
    },
    act: (bloc) => bloc.add(EndSearch()),
    expect: [
      isA<NotSearching>(),
    ],
  );
}
