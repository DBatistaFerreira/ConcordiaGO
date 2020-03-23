import 'dart:async';
import 'package:bloc/bloc.dart';
import '../bloc.dart';

class BuildingInfoBloc extends Bloc<BuildingInfoEvent, BuildingInfoState> {
  @override
  BuildingInfoState get initialState => InitialBuildingInfoState();

  @override
  Stream<BuildingInfoState> mapEventToState(
    BuildingInfoEvent event,
  ) async* {
    yield event.createState();
  }
}
