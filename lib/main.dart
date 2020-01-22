import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'utilities/ApplicationConstants.dart' as application_constants;
import 'widgets/screens/HomeScreen.dart';

void main() => runApp(Application());

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: application_constants.APPLICATION_NAME,
      home: HomeScreen(),
    );
  }
}
