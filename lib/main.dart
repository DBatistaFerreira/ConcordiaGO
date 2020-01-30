import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'utilities/application_constants.dart' as application_constants;
import 'widgets/screens/home_screen.dart';

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
