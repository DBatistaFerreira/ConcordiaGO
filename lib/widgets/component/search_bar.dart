import 'package:concordia_go/blocs/bloc.dart';
import 'package:concordia_go/services/search_service.dart';
import 'package:concordia_go/utilities/concordia_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

List<ConcordiaBuilding> results;

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      height: screenHeight / 10,
      padding: EdgeInsets.all(10.0),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          fillColor: Colors.white,
        ),
        onChanged: (searchText) {
          results = SearchService.getSearchResults(searchText);
        },
      ),
    );
  }
}

Widget SearchResultsList() {
  debugPrint((results == null).toString());
  return Container(
    height: (results == null || results.isEmpty) ? 0 : (results.length > 5 ? 400 : results.length.toDouble() * 70),
    width: 297,
    color: Colors.white,
    child: Column(
      children: <Widget>[
        Flexible(
          child: ListView.builder(
              itemCount: results == null ? 0 : results.length,
              itemBuilder: (context, index) {
                return Container(
                  height: 70,
                  child: ListTile(
                    title: results == null ? Text('I\'m null') : Text(results[index].name),
                    onTap: () {
                      BlocProvider.of<MapBloc>(context).add(CameraMoveConcordia(results[index]?.code, context));
                    },
                  ),
                );
              }),
        ),
      ],
    ),
  );
}
