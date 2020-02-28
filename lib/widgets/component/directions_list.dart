import 'package:concordia_go/blocs/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DirectionsList extends StatefulWidget {
  @override
  State<DirectionsList> createState() => DirectionsListState();
}

class DirectionsListState extends State<DirectionsList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              color: Color(0xff800206),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Directions',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 8,
            child: BlocBuilder<DirectionsUiBloc, DirectionsUiState>(
              builder: (context, state) {
                if (state is AllDirectionsUpdate) {
                  return ListView.builder(
                    itemCount: state.directionsList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(state.directionsList[index].instruction),
                      );
                    },
                  );
                } else {
                  return Container(
                    height: 350,
                    child: Text('ELSE'),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
