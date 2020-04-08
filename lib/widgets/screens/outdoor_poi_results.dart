import 'package:concordia_go/blocs/bloc.dart';
import 'package:concordia_go/models/direction_object.dart';
import 'package:concordia_go/models/hotspot.dart';
import 'package:concordia_go/utilities/application_constants.dart';
import 'package:concordia_go/utilities/concordia_constants.dart';
import 'package:concordia_go/widgets/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OutdoorPOIResults extends StatefulWidget {
  const OutdoorPOIResults(this.results, this.hotspotType);

  final List<Hotspot> results;
  final HotspotType hotspotType;

  @override
  State<OutdoorPOIResults> createState() => _OutdoorPOIResultsState(results, hotspotType);
}

class _OutdoorPOIResultsState extends State<OutdoorPOIResults> {
  _OutdoorPOIResultsState(this._results, this._hotspotType);

  final List<Hotspot> _results;
  final HotspotType _hotspotType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: concordiaRed,
        title: Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 40.0),
            child: Text(describeEnum(_hotspotType)),
          ),
        ),
      ),
      body: Container(
        child: _results.isNotEmpty
            ? ListView.builder(
                itemCount: _results.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    elevation: 2,
                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(6.0))),
                    child: Container(
                      padding: const EdgeInsets.all(10),
//                    color: index % 2 == 0 ? Colors.white : Colors.grey.withOpacity(0.25),
                      height: screenHeight / 5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Expanded(
                                  child: Text(
                                    _results[index].name,
                                    style: const TextStyle(fontSize: 18),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Text(_results[index].address),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: <Widget>[
                                Text(_results[index].isOpen ? 'Open now' : 'Closed'),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Expanded(
                                  flex: 3,
                                  child: Text('Rating: ${_results[index].rating} stars'),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Text(priceToString(_results[index].priceLevel as int)),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: IconButton(
                                    padding: const EdgeInsets.all(0),
                                    icon: Icon(Icons.directions),
                                    iconSize: 35,
                                    onPressed: () {
                                      Navigator.pop(context);
                                      Navigator.pop(context);
                                      BlocProvider.of<SearchBloc>(context).add(
                                        SearchDirectionsEvent(
                                          source: Dobject.hotspot(currentLocation, 'Your Location'),
                                          destination:
                                              Dobject.hotspot(_results[index].coordinates, _results[index].name),
                                        ),
                                      );
                                      BlocProvider.of<MapBloc>(context)
                                          .add(MoveCameraEvent(_results[index].coordinates, poiZoomLevel, true));
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
//                separatorBuilder: (BuildContext context, int index) {
//                  return const Divider(
//                    height: 8.0,
//                    thickness: 0.3,
//                    color: Colors.grey,
//                    indent: 8.0,
//                    endIndent: 8.0,
//                  );
//                },
              )
            : Container(
                padding: const EdgeInsets.all(30.0),
                child: const Center(
                  child: Text(
                    'No results',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
      ),
    );
  }

  String priceToString(int priceLevel) {
    switch (priceLevel) {
      case 1:
        return '\$';
      case 2:
        return '\$\$';
      case 3:
        return '\$\$\$';
      case 4:
        return '\$\$\$\$';
      default:
        return '';
    }
  }
}
