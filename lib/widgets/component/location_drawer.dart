import 'package:flutter/material.dart';

Color mainColor = Color(0xff800206);

class location_drawer {
  static void settingModalBottomSheet(context, buildingName, campus, coordinates, address) {
    showModalBottomSheet(
        context: context,
        backgroundColor: mainColor,
        builder: (BuildContext bc) {
          return Container(
              height: 280,
              color: Colors.transparent,
              child: Container(
                  child: Column(
                children: [
                  Container(
                    child: Row(
                      children: [
                        Container(
                            child: Row(
                          children: [
                            Container(
                                child: Row(children: [
                              SizedBox(
                                height: 10,
                              ),
                              Icon(
                                Icons.school,
                                size: 65,
                              ),
                            ])),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(buildingName, style: TextStyle(fontSize: 18)),
                                Text(
                                  campus,
                                  style: TextStyle(),
                                  textAlign: TextAlign.left,
                                ),
                              ],
                            )
                          ],
                        )),
                        Container(
                            child: SizedBox(
                          height: 60,
                        ))
                      ],
                    ),
                    color: mainColor,
                  ),
                  Container(
                    child: Row(
                      children: [
                        Container(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(children: [
                              Row(
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Icon(
                                    Icons.place,
                                    size: 40,
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(address),
                            ]),
                            Row(children: [
                              Row(
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Icon(
                                    Icons.desktop_windows,
                                    size: 40,
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text("https://www.concordia.ca"),
                            ]),
                            Row(children: [
                              Row(
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Icon(
                                    Icons.phone,
                                    size: 40,
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text("(514)848-2424"),
                            ]),
                            Row(children: [
                              Row(
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Icon(
                                    Icons.access_time,
                                    size: 40,
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text("Opening hours variable here"),
                            ]),
                          ],
                        )),
                        SizedBox(
                          height: 40,
                        )
                      ],
                    ),
                    color: Colors.white,
                  ),
                  Container(
                    child: Row(
                      children: [
                        Container(
                            child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0), side: BorderSide(color: Colors.white)),
                                onPressed: ()=>{},
                                child: Text(
                                  "Get there",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ))),
                        Container()
                      ],
                    ),
                    color: mainColor,
                  ),
                ],
              )));
        });
  }
}
