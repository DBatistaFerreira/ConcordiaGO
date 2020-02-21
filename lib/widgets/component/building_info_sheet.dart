import 'package:flutter/material.dart';

Color mainColor = Color(0xff800206);

class building_info_sheet {
  static void buildingInfoSheet(context, buildingName, campus, coordinates, address) {
    showBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext bc) {
        double screenHeight = MediaQuery.of(context).size.height;
        double screenWidth = MediaQuery.of(context).size.width;
        double iconSize = screenWidth / 14;

        return Container(
          height: screenHeight / 2.5,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: mainColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(18.0),
                    topRight: Radius.circular(18.0),
                  ),
                ),
                height: screenHeight / 12,
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 5.0, right: 8.0),
                      child: Icon(
                        Icons.school,
                        color: Colors.white,
                        size: screenWidth / 9,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(buildingName, style: TextStyle(color: Colors.white, fontSize: 18)),
                        Text(
                          campus,
                          style: TextStyle(color: Colors.white, fontSize: 12),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 11.0, right: 10.0),
                            child: Icon(
                              Icons.place,
                              size: iconSize,
                            ),
                          ),
                          Flexible(
                            child: Text(
                              address,
                              overflow: TextOverflow.fade,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 11.0, right: 10.0),
                            child: Icon(
                              Icons.language,
                              size: iconSize,
                            ),
                          ),
                          Text("https://www.concordia.ca"),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 11.0, right: 10.0),
                            child: Icon(
                              Icons.phone,
                              size: iconSize,
                            ),
                          ),
                          Text("(514) 848-2424"),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 11.0, right: 10.0),
                            child: Icon(
                              Icons.access_time,
                              size: iconSize,
                            ),
                          ),
                          Text("Opening hours variable here"),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: screenHeight / 12,
                color: mainColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 10.0),
                      child: SizedBox(
                        height: screenHeight / 16,
                        width: screenWidth / 4,
                        child: RaisedButton.icon(
                          color: Colors.white,
                          elevation: 0.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24.0),
                          ),
                          onPressed: () => {},
                          icon: Icon(
                            Icons.directions,
                            size: screenWidth / 12,
                          ),
                          label: Text(
                            "Go",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.black, fontSize: 16.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
