import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:floating_search_bar/floating_search_bar.dart';

class MapSearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingSearchBar(
      onChanged: (String value) {},
      onTap: () {},
      decoration: InputDecoration.collapsed(
        hintText: "Where to?",
      ),
      children: [],
    );
  }
}