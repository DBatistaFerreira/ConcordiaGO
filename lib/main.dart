import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:floating_search_bar/floating_search_bar.dart';

import 'utilities/ApplicationConstants.dart' as ApplicationConstants;
import 'widgets/screens/HomeScreen.dart';

void main() => runApp(Application());

class Application extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ApplicationConstants.APPLICATION_NAME,
      home: HomeScreen(),
    );
  }
}

