import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  @override
  MapState get initialState => InitialMap();

  Stream<MapState> mapEventToState(
      MapEvent event,
      ) async* {
    yield event.createState();
  }
}
