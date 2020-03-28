import 'package:concordia_go/blocs/bloc.dart';
import 'package:concordia_go/models/direction_object.dart';
import 'package:concordia_go/utilities/application_constants.dart';
import 'package:concordia_go/utilities/concordia_constants.dart';
import 'package:concordia_go/widgets/component/building_info_sheet.dart';
import 'package:concordia_go/widgets/component/search_bar.dart';
import 'package:concordia_go/widgets/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResults extends StatefulWidget {
  SearchResults();

  @override
  _SearchResultsState createState() => _SearchResultsState();
}

class _SearchResultsState extends State<SearchResults> {
  void _onTap(Dobject result, SearchType searchType) {
    switch (searchType) {
      case SearchType.general:
        _onTapGeneral(result);
        break;
      case SearchType.source:
        _onTapSource(result);
        break;
      case SearchType.destination:
        _onTapDestination(result);
        break;
    }
  }

  void _onTapGeneral(Dobject result) {
    if (result.hasNode()) {
      BlocProvider.of<MapBloc>(context).add(FloorChange(result.building.code, result.floor, {result.floor:[result.node]}, true));
      BlocProvider.of<BuildingInfoBloc>(context)
          .add(ConcordiaRoomInfoEvent(result.building.code, result.floor, result.node.getId()));
      Navigator.pushNamed(context, '/indoormap');
    } else if (result.hasBuilding()) {
      BlocProvider.of<MapBloc>(context).add(SelectConcordiaBuildingEvent(result.building.code));
      BlocProvider.of<BuildingInfoBloc>(mc).add(ConcordiaBuildingInfoEvent(result.building.code, false));
      BuildingInfoSheet.buildInfoSheet(context);
    } else {
      BlocProvider.of<MapBloc>(context).add(MoveCameraEvent(result.coordinates, poiZoomLevel, true));
    }
  }

  void _onTapSource(Dobject result) {
    BlocProvider.of<SearchBloc>(context).add(SearchDirectionsEvent(source: result));
  }

  void _onTapDestination(Dobject result) {
    BlocProvider.of<SearchBloc>(context).add(SearchDirectionsEvent(destination: result));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        if (state is SearchResultsState) {
          var _results = state.results;
          return Container(
            color: Colors.white,
            child: Column(
              children: <Widget>[
                Container(
                  height: screenHeight / 10,
                ),
                state.searchType == SearchType.source
                    ? ListTile(
                        trailing: Icon(Icons.gps_fixed),
                        title: Text('Your Location'),
                        onTap: () {
                          BlocProvider.of<SearchBloc>(context)
                              .add(SearchDirectionsEvent(source: Dobject.hotspot(currentLocation, 'Your Location')));
                        },
                      )
                    : Container(
                        height: 0,
                      ),
                Flexible(
                  child: _results.isNotEmpty
                      ? ListView.builder(
                          itemCount: _results == null ? 0 : _results.length,
                          itemBuilder: (context, index) {
                            var _result = _results[index];

                            return Container(
                              height: 60,
                              child: Material(
                                color: Colors.white,
                                child: ListTile(
                                  title: Text(_result.name),
                                  trailing: Text(
                                    _result.building?.campusName() ?? '',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  onTap: () {
                                    BlocProvider.of<SearchBloc>(context).add(EndSearchEvent());
                                    _onTap(_result, state.searchType);
                                    if (!FocusScope.of(context).hasPrimaryFocus) {
                                      FocusScope.of(context).unfocus();
                                    }
                                  },
                                ),
                              ),
                            );
                          },
                        )
                      : Container(
                          padding: EdgeInsets.all(50.0),
                          child: Text(
                            'No results',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                            ),
                          ),
                        ),
                ),
                Container(
                  height: 15,
                ),
              ],
            ),
          );
        } else {
          return Container(
            height: 0,
          );
        }
      },
    );
  }
}
