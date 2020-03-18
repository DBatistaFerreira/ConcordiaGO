import 'package:concordia_go/utilities/floor_maps_lib.dart';
import 'package:flutter/material.dart';
import 'package:concordia_go/utilities/application_constants.dart'
    as application_constants;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:concordia_go/blocs/bloc.dart';

/// This Widget is the main application widget.

class FloorSelectionDropdown extends StatefulWidget {
  FloorSelectionDropdown({Key key}) : super(key: key);

  @override
  FloorSelectionDropdownState createState() => FloorSelectionDropdownState();
}

class FloorSelectionDropdownState extends State<FloorSelectionDropdown> {
  String dropdownValue;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(16.0),
        child: Container(
            padding: EdgeInsets.all(3.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.0),
              border: Border.all(
                  color: application_constants.concordiaRed,
                  style: BorderStyle.solid,
                  width: 1.80),
            ),
            child: BlocBuilder<MapBloc, MapState>(builder: (context, state) {
              if (state is IndoorMap) {
                dropdownValue = state.floorLevel;
              }
              return DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                value: dropdownValue,
                icon: Icon(
                  Icons.import_export,
                  color: application_constants.concordiaRed,
                ),
                iconSize: 40,
                elevation: 16,
                focusColor: Colors.black,
                style: TextStyle(
                    color: application_constants.concordiaRed, fontSize: 28),
                onChanged: (String newValue) {
                  BlocProvider.of<MapBloc>(context).add(FloorChange(newValue));
                },
                items: hallFloors.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ));
            })));
  }
}
