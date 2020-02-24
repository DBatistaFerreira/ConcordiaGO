import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:concordia_go/blocs/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:concordia_go/utilities/concordia_constants.dart' as concordia_constants;

class SGWCampusBuildingList extends StatelessWidget  {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("OOO Route"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            // Navigate back to first route when tapped.
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}
