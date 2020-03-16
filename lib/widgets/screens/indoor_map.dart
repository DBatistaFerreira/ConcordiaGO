import 'package:concordia_go/utilities/application_constants.dart' as application_constants;
import 'package:concordia_go/utilities/floor_maps_lib.dart' as floor_maps;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IndoorMap extends StatefulWidget {

  IndoorMap();

  @override
  State<IndoorMap> createState() => IndoorMapState();
}

class IndoorMapState extends State<IndoorMap> {

  IndoorMapState();

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var svgFile = floor_maps.H8;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenHeight / 12),
        child: AppBar(
          title: Image.asset('assets/logo.png', height: screenHeight / 12),
          backgroundColor: application_constants.concordiaRed,
        ),
      ),
      body: PhotoView.customChild(
              child: SvgPicture.string(
                svgFile,
                height: 500.0,
              ),
              initialScale: 1.0,
              maxScale: 3.5,
              minScale: 1.0,
              enableRotation: true,
              backgroundDecoration: BoxDecoration(color: Colors.white),
            ),
    );
  }
}
