import 'package:concordia_go/blocs/bloc.dart';
import 'package:concordia_go/utilities/application_constants.dart';
import 'package:concordia_go/widgets/component/building_info_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum SearchType { general, source, destination }

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

FocusNode focus;

class _SearchBarState extends State<SearchBar> {
  final TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    focus = FocusNode();
    super.initState();
    focus.addListener(() => _onFocusChange());
  }

  void _onFocusChange() {
    if (focus.hasFocus) {
      if (BuildingInfoSheet.bottomSheetController != null) {
        try {
          BuildingInfoSheet.bottomSheetController.close();
        } catch (Exception) {
          print('Cannot call close() on PersistentBottomSheetController');
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        if (!(state is SearchDirectionsState)) {
          return Container(
            height: screenHeight / 10,
            padding: EdgeInsets.all(10.0),
            child: Stack(
              children: <Widget>[
                TextField(
                  focusNode: focus,
                  controller: _textController,
                  textInputAction: TextInputAction.search,
                  textAlignVertical: TextAlignVertical.center,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Search',
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    fillColor: Colors.white,
                  ),
                  onChanged: (searchText) {
                    if (state is SearchResultsState) {
                      BlocProvider.of<SearchBloc>(context).add(QueryChangeEvent(searchText, state.searchType));
                    }
                  },
                  onTap: () {
                    if (!(state is SearchResultsState)) {
                      BlocProvider.of<SearchBloc>(context).add(QueryChangeEvent('', SearchType.general));
                    }
                  },
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
                      if (state is SearchResultsState) {
                        if (state.searchType == SearchType.general) {
                          BlocProvider.of<SearchBloc>(context).add(EndSearchEvent());
                        } else {
                          BlocProvider.of<SearchBloc>(context).add(SearchDirectionsEvent());
                        }
                      }
                    },
                  ),
                ),
              ],
            ),
          );
        } else {
          return Container(
            height: 0,
          );
        }
      },
    );
  }
}
