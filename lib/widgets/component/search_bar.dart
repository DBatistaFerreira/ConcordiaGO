import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      ),
    );
  }
}
