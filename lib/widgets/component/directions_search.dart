import 'package:concordia_go/utilities/application_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DirectionsSearch extends StatelessWidget {
  @override
  Widget build(context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      color: concordiaRed,
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.gps_fixed,
                    color: Colors.white,
                  ),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  fillColor: Colors.white,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.location_on,
                    color: Colors.white,
                  ),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  fillColor: Colors.white,
                ),
              ),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.directions_walk,
                  color: Colors.white,
                  size: screenWidth / 10,
                ),
                Icon(
                  Icons.directions_car,
                  color: Colors.white,
                  size: screenWidth / 10,
                ),
                Icon(
                  Icons.directions_subway,
                  color: Colors.white,
                  size: screenWidth / 10,
                ),
                Icon(
                  Icons.directions_bus,
                  color: Colors.white,
                  size: screenWidth / 10,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: screenWidth / 12,
                    ),
                    onPressed: () {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: RaisedButton.icon(
                    color: Colors.white,
                    elevation: 0.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    onPressed: () {},
                    icon: Icon(
                      Icons.directions,
                      size: screenWidth / 12,
                    ),
                    label: Text(
                      'Go',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black, fontSize: 16.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
