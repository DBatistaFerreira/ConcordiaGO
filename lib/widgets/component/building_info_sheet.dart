import 'package:concordia_go/blocs/bloc.dart';
import 'package:concordia_go/utilities/concordia_constants.dart' as concordia_constants;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class building_info_sheet {
  static Color mainColor = Color(0xff800206);
  static PersistentBottomSheetController bottomSheetController;

  static void buildingInfoSheet(context) {
    bottomSheetController = showBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext bc) {
        double screenHeight = MediaQuery.of(context).size.height;
        double screenWidth = MediaQuery.of(context).size.width;
        double iconSize = screenWidth / 14;

        return BlocBuilder<BuildingInfoBloc, BuildingInfoState>(
          builder: (context, state) {
            String buildingName = 'Unavailable';
            String campus = 'Unavailable';
            String address = 'Unavailable';
            if (state is BuildingInfoSheet) {
              buildingName = state.buildingName;
              campus = state.campus;
              address = state.address;
            }
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
                              InkWell(
                                child: Text(
                                  concordia_constants.concordiaUrl,
                                  style: TextStyle(decoration: TextDecoration.underline),
                                ),
                                onTap: () {
                                  _launchUrl(concordia_constants.concordiaUrl);
                                },
                              ),
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
                              Text(concordia_constants.concordiaPhone),
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
                              Text(buildingName),
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
                                'Go',
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
      },
    );
  }

  static void _launchUrl(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Failed to launch $url';
    }
  }
}
