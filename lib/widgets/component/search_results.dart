import 'package:concordia_go/blocs/bloc.dart';
import 'package:concordia_go/models/search_result_model.dart';
import 'package:concordia_go/utilities/application_constants.dart';
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
                state.searchType == SearchType.startingPoint
                    ? ListTile(
                        trailing: Icon(Icons.gps_fixed),
                        title: Text('Your Location'),
                        onTap: () {
                          BlocProvider.of<SearchBloc>(context).add(
                              SearchDirectionsEvent(startingPoint: SearchResult('Your Location', currentLocation)));
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
                                    _result is OutdoorConcordiaResult ? _result.campusInitials() : '',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  onTap: () {
                                    _result.onTap(context, state.searchType);
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
