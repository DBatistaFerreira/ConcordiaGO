import 'package:concordia_go/blocs/bloc.dart';
import 'package:concordia_go/models/graph.dart';
import 'package:concordia_go/models/shortest_path.dart';
import 'package:concordia_go/utilities/application_constants.dart' as application_constants;
import 'package:concordia_go/utilities/application_constants.dart';
import 'package:concordia_go/widgets/component/floor_selection_dropdown.dart';
import 'package:concordia_go/widgets/component/room_info_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_view/photo_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:concordia_go/utilities/concordia_constants.dart' as concordia_constants;

class IndoorMapScreen extends StatefulWidget {
  IndoorMapScreen();

  @override
  State<IndoorMapScreen> createState() => IndoorMapState();
}

class IndoorMapState extends State<IndoorMapScreen> {
  String _floorSVG;
  String _buildingCode;

  IndoorMapState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenHeight / 12),
        child: AppBar(
          title: Image.asset('assets/logo.png', height: screenHeight / 12),
          backgroundColor: application_constants.concordiaRed,
        ),
      ),
      body: Stack(
        children: <Widget>[
          BlocBuilder<MapBloc, MapState>(
            builder: (context, state) {
              if (state is IndoorMap) {
                _floorSVG = state.svgFile;
                _buildingCode = state.buildingCode;
              }
              return PhotoView.customChild(
                child: SvgPicture.string(
                  _floorSVG,
                  height: 500.0,
                ),
                initialScale: 1.0,
                maxScale: 3.5,
                minScale: 1.0,
                enableRotation: true,
                backgroundDecoration: BoxDecoration(
                  color: Colors.white,
                ),
              );
            },
          ),
          Align(
            alignment: Alignment.topRight,
            child: FloorSelectionDropdown(),
          )
          ,
          // To remove later
          Column(
            children: <Widget>[
              FlatButton(
                onPressed: () {
                  final g = Graph('H8', concordia_constants.edges['H8'], concordia_constants.edge_indices['H8']);
                  g.setNodesFromEdgeIndices(concordia_constants.edge_indices['H8']);
                  final sp = DShortestPath(g, g.getNodes()['100811'], g.getNodes()['100845']);
                  var path = sp.calcShortestPath();
                  BlocProvider.of<MapBloc>(context).add(FloorChange(_buildingCode, 'H8', path));
                },
                child: Text(
                  "Test: 811-845",
                ),
              ),
              FlatButton(
                onPressed: () {
                  final g = Graph('H8', concordia_constants.edges['H8'], concordia_constants.edge_indices['H8']);
                  g.setNodesFromEdgeIndices(concordia_constants.edge_indices['H8']);
                  final sp = DShortestPath(g, g.getNodes()['100859'], g.getNodes()['100832']);
                  var path = sp.calcShortestPath();
                  BlocProvider.of<MapBloc>(context).add(FloorChange(_buildingCode, 'H8', path));
                },
                child: Text(
                  "Test: 859-832",
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
