import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Concordia GO',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Concordia GO'),
        ),
        body: Center(
          child: Text('Concordia GO is gonna be awesome!'),
        ),
      ),
    );
  }
}
