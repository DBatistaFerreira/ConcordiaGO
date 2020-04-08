import 'package:concordia_go/models/hotspot.dart';
import 'package:concordia_go/utilities/application_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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
                  return Container(
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text(_results[index].name),
                            Text(priceToString(_results[index].priceLevel as int)),
                          ],
                        ),
                        Text(_results[index].address),
                        Text(_results[index].isOpen ? 'Open now' : 'Closed'),
                        Text('Rating: ${_results[index].rating} stars')
                      ],
                    ),
                  );
                },
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
