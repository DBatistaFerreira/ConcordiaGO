import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/component/DrawerComponent.dart';


import '../component/GoogleMapsComponent.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => HomePageState();
}

class HomePageState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;


    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(screenHeight / 12),
          child: AppBar(
            title: Image.asset('assets/logo.png', height: screenHeight / 12),
            backgroundColor: Color(0xff800206),
          )),
      body: GoogleMapsComponent(),
        drawer: Padding(padding: EdgeInsets.fromLTRB(0, 0, 70, 0)
            ,child:DrawerComponent()),
    );
  }
}


