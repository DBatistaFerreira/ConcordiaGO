import 'package:concordia_go/blocs/bloc.dart';
import 'package:concordia_go/models/classroom_model.dart';
import 'package:concordia_go/models/concordia_building_model.dart';
import 'package:concordia_go/widgets/component/building_info_sheet.dart';
import 'package:concordia_go/widgets/component/room_info_sheet.dart';
import 'package:concordia_go/widgets/component/search_bar.dart';
import 'package:concordia_go/widgets/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class SearchResult {
  final String name;
  final LatLng coordinates;

  SearchResult(this.name, this.coordinates);

  void onTap(BuildContext context, SearchType searchType) {
    switch (searchType) {
      case SearchType.general:
        _onTapGeneral(context);
        break;
      case SearchType.startingPoint:
        _onTapStartingPoint(context);
        break;
      case SearchType.destination:
        _onTapDestination(context);
        break;
    }
  }

  void _onTapGeneral(BuildContext context);

  void _onTapStartingPoint(BuildContext context);

  void _onTapDestination(BuildContext context);
}

class YourLocationResult extends SearchResult {
  YourLocationResult(String name, LatLng coordinates) : super(name, coordinates);

  @override
  void _onTapGeneral(BuildContext context) {
    print('This method should never be called.');
  }

  @override
  void _onTapStartingPoint(BuildContext context) {
    BlocProvider.of<SearchBloc>(context).add(SearchDirectionsEvent(startingPoint: this));
  }

  @override
  void _onTapDestination(BuildContext context) {
    print('This method should never be called.');
  }
}

class OutdoorConcordiaResult extends SearchResult {
  final ConcordiaBuilding building;

  OutdoorConcordiaResult(this.building) : super(building.name, building.coordinates);

  void _onTapGeneral(BuildContext context) {
    BlocProvider.of<SearchBloc>(context).add(EndSearchEvent());
    BlocProvider.of<MapBloc>(context).add(SelectConcordiaBuildingEvent(building.code));
    BlocProvider.of<BuildingInfoBloc>(mc).add(ConcordiaBuildingInfoEvent(building.code, false));
    BuildingInfoSheet.buildInfoSheet(context);
  }

  void _onTapStartingPoint(BuildContext context) {
    BlocProvider.of<SearchBloc>(context).add(SearchDirectionsEvent(startingPoint: this));
  }

  void _onTapDestination(BuildContext context) {
    BlocProvider.of<SearchBloc>(context).add(SearchDirectionsEvent(destination: this));
  }

  String campusInitials() {
    return building.campus == Campus.SGW ? 'SGW' : 'LOY';
  }
}

class ClassroomResult extends SearchResult {
  final Classroom classroom;

  ClassroomResult(this.classroom) : super(classroom.building.code + classroom.number, classroom.building.coordinates);

  @override
  void _onTapGeneral(BuildContext context) {
    BlocProvider.of<MapBloc>(context).add(FloorChange(classroom.building.code, classroom.floor, [classroom.node]));
    BlocProvider.of<BuildingInfoBloc>(context).add(ConcordiaRoomInfoEvent(classroom.building.code, classroom.floor, classroom.node.getId()));
    Navigator.pushNamed(context, '/indoormap');
    RoomInfoSheet.buildInfoSheet(context);
  }

  @override
  void _onTapStartingPoint(BuildContext context) {
    BlocProvider.of<SearchBloc>(context).add(SearchDirectionsEvent(startingPoint: this));
  }

  @override
  void _onTapDestination(BuildContext context) {
    BlocProvider.of<SearchBloc>(context).add(SearchDirectionsEvent(destination: this));
  }

  String campusInitials() {
    return classroom.building.campus == Campus.SGW ? 'SGW' : 'LOY';
  }
}
