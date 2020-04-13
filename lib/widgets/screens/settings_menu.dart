import 'package:concordia_go/services/shared_preferences_service.dart';
import 'package:concordia_go/utilities/application_constants.dart' as application_constants;
import 'package:concordia_go/utilities/application_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsMenu extends StatefulWidget {
  const SettingsMenu();

  @override
  State<SettingsMenu> createState() => SettingsMenuState();
}

class SettingsMenuState extends State<SettingsMenu> {
  bool prioritizeElevators = false;
  String preferredWashroom = 'Male';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenHeight / 12),
        child: AppBar(
          centerTitle: true,
          title: Image.asset(concordiaGOHeader, height: screenHeight / 12),
          backgroundColor: application_constants.concordiaRed,
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'Settings',
                style: TextStyle(
                  fontFamily: 'Raleway',
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: application_constants.listElementTextSize,
                ),
              ),
            ),
            color: application_constants.concordiaRed,
            height: screenHeight / 15,
          ),
          Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                Align(
                  child: const Text(
                    'General',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontFamily: 'Raleway',
                      color: Colors.grey,
                      //fontWeight: FontWeight.bold,
                      fontSize: application_constants.listElementTextSize,
                    ),
                  ),
                  alignment: Alignment.centerLeft,
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Text(
                      'Preferred washroom',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontFamily: 'Raleway',
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                    FutureBuilder<String>(
                        future: SharedPreferencesService.getPreferredWashroom(),
                        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                          return DropdownButton<String>(
                            elevation: 16,
                            value: snapshot.hasData ? snapshot.data : preferredWashroom,
                            onChanged: (String newValue) async {
                              preferredWashroom = newValue;
                              await SharedPreferencesService.setPreferredWashroom(newValue);
                              setState(() {});
                            },
                            items: <String>['Male', 'Female'].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          );
                        }),
                  ],
                ),
                Divider(
                  color: Colors.white,
                ),
                Align(
                  child: const Text(
                    'Accessibility',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontFamily: 'Raleway',
                      color: Colors.grey,
                      //fontWeight: FontWeight.bold,
                      fontSize: application_constants.listElementTextSize,
                    ),
                  ),
                  alignment: Alignment.centerLeft,
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Text(
                      'Prioritize elevators',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontFamily: 'Raleway',
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                    FutureBuilder<bool>(
                        future: SharedPreferencesService.getPrioritizeElevatorBool(),
                        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                          return Switch(
                            value: snapshot.hasData ? snapshot.data : prioritizeElevators,
                            onChanged: (bool newValue) async {
                              prioritizeElevators = newValue;
                              await SharedPreferencesService.setPrioritizeElevatorBool(newValue);
                              setState(() {});
                            },
                            activeColor: application_constants.concordiaRed,
                          );
                        }),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
