import 'package:concordia_go/blocs/bloc.dart';
import 'package:concordia_go/models/concordia_building_model.dart';
import 'package:concordia_go/widgets/component/building_info_sheet.dart';
import 'package:concordia_go/widgets/component/search_bar.dart';
import 'package:concordia_go/widgets/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SearchResult {
  String name;
  LatLng coordinates;

  SearchResult(this.name, this.coordinates);

  void onTap(BuildContext context, SearchType searchType) {}
}

class OutdoorConcordiaResult extends SearchResult {
  final ConcordiaBuilding building;

  OutdoorConcordiaResult(this.building) : super(building.name, building.coordinates);

  @override
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
