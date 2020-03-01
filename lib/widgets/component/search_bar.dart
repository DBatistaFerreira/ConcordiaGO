import 'package:concordia_go/blocs/bloc.dart';
import 'package:concordia_go/models/concordia_building_model.dart';
import 'package:concordia_go/widgets/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final FocusNode _focus = FocusNode();
  final TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _focus.addListener(() => _onFocusChange());
  }

  void _onFocusChange() {
    if (_focus.hasFocus) {
      BlocProvider.of<SearchBloc>(context).add((UpdateResults('')));
    } else {
      BlocProvider.of<SearchBloc>(context).add(EndSearch());
    }
  }

  @override
  Widget build(BuildContext context) {
    // ignore: omit_local_variable_types
    final double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      height: screenHeight / 10,
      padding: EdgeInsets.all(10.0),
      child: Stack(
        children: <Widget>[
          TextField(
            focusNode: _focus,
            controller: _textController,
            textInputAction: TextInputAction.search,
            textAlignVertical: TextAlignVertical.center,
            style: TextStyle(fontSize: 16),
            decoration: InputDecoration(
              hintText: 'Search',
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              fillColor: Colors.white,
            ),
            onChanged: (searchText) => BlocProvider.of<SearchBloc>(context).add(UpdateResults(searchText)),
          ),
          Positioned(
            right: 5,
            child: IconButton(
              icon: Icon(
                Icons.clear,
                size: 20.0,
                color: Colors.grey,
              ),
              onPressed: () {
                WidgetsBinding.instance.addPostFrameCallback((_) => _textController.clear());
                if (!FocusScope.of(context).hasPrimaryFocus) {
                  FocusScope.of(context).unfocus();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

Widget SearchResultsList(List<ConcordiaBuilding> results) {
  return Container(
    color: Colors.white,
    child: Column(
      children: <Widget>[
        Container(
          height: MediaQuery.of(mc).size.height / 10,
        ),
        Flexible(
          child: ListView.builder(
            itemCount: results == null ? 0 : results.length,
            itemBuilder: (context, index) {
              return Container(
                height: 60,
                child: Material(
                  color: Colors.white,
                  child: ListTile(
                    title: Text(results[index].name),
                    trailing: Text(
                      results[index].campus == Campus.SGW ? 'SGW' : 'LOY',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    onTap: () {
                      BlocProvider.of<SearchBloc>(context).add(EndSearch());
                      BlocProvider.of<MapBloc>(context).add(CameraMoveConcordia(results[index]?.code, context));
                      if (!FocusScope.of(context).hasPrimaryFocus) {
                        FocusScope.of(context).unfocus();
                      }
                    },
                  ),
                ),
              );
            },
          ),
        ),
        Container(
          height: 15,
        ),
      ],
    ),
  );
}
