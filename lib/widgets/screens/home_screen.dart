import 'package:concordia_go/blocs/bloc.dart';
import 'package:concordia_go/services/shared_preferences_service.dart';
import 'package:concordia_go/widgets/component/directions_list.dart';
import 'package:concordia_go/widgets/component/directions_panel.dart';
import 'package:concordia_go/services/outdoor_path_service.dart';
import 'package:concordia_go/widgets/component/directions_search.dart';
import 'package:concordia_go/widgets/component/search_bar.dart';
import 'package:concordia_go/widgets/component/search_results.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:concordia_go/widgets/screens/quick_menu.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location_permissions/location_permissions.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:concordia_go/utilities/application_constants.dart';
import 'package:concordia_go/utilities/concordia_constants.dart' as concordia_constants;
import '../component/google_maps_component.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => HomePageState();
}

PanelController _pc = PanelController();
BuildContext mc;
LatLng currentLocation;

class HomePageState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    _initGeolocationServices();
    SharedPreferencesService.updatePrioritizeElevatorBool();
  }

  Future<void> _initGeolocationServices() async {
    final PermissionStatus permission = await LocationPermissions().checkPermissionStatus();

    if (permission == PermissionStatus.granted) {
      final Position position = await Geolocator().getCurrentPosition();
      currentLocation = LatLng(position.latitude, position.longitude);

      Geolocator()
          .getPositionStream()
          .listen((Position position) => currentLocation = LatLng(position.latitude, position.longitude));
    } else {
      await LocationPermissions().requestPermissions();
    }
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    mc = context;

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(screenHeight / 12),
          child: AppBar(
            centerTitle: true,
            title: Image.asset(concordiaGOHeader, height: screenHeight / 12),
            backgroundColor: concordiaRed,
          )),
      body: SlidingUpPanel(
        controller: _pc,
        color: Colors.transparent,
        panel: DirectionsList(),
        body: Stack(
          children: <Widget>[
            GoogleMapsComponent(),
            floatingMapButtons(),
            DirectionsSearch(),
            const SearchResults(),
            SearchBar(),
          ],
        ),
        collapsed: DirectionsPanel(),
        minHeight: screenHeight / 3.3,
        maxHeight: screenHeight / 1.4,
      ),
      drawer: QuickMenu(),
    );
  }

  Widget floatingMapButtons() {
    return Positioned(
      right: 20,
      bottom: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            height: screenHeight / 11,
            width: screenHeight / 11,
            padding: const EdgeInsets.all(6.0),
            child: myLocationButton(),
          ),
          Container(
            height: screenHeight / 11,
            width: screenHeight / 11,
            padding: const EdgeInsets.all(6.0),
            child: switchCampusButton(),
          ),
        ],
      ),
    );
  }

  Widget switchCampusButton() {
    return RawMaterialButton(
      fillColor: concordiaRed,
      shape: const CircleBorder(),
      elevation: 10.0,
      child: Icon(
        Icons.sync,
        size: screenWidth / 11,
        color: Colors.white,
      ),
      onPressed: () {
        BlocProvider.of<MapBloc>(context).add(SwitchCampusEvent(currentCameraPosition));
      },
    );
  }

  Widget myLocationButton() {
    return RawMaterialButton(
      fillColor: concordiaRed,
      shape: const CircleBorder(),
      elevation: 10.0,
      child: Icon(
        Icons.gps_fixed,
        size: screenWidth / 14,
        color: Colors.white,
      ),
      onPressed: () {
        if (currentLocation == null) {
          LocationPermissions().checkPermissionStatus().then(
            (PermissionStatus value) {
              if (value != PermissionStatus.granted) {
                Scaffold.of(mapContext).showSnackBar(
                  SnackBar(
                    content: const Text('Location permissions are required.'),
                    duration: const Duration(seconds: 3),
                    action: SnackBarAction(
                      label: 'ALLOW',
                      onPressed: () => _initGeolocationServices(),
                    ),
                  ),
                );
              } else {
                _initGeolocationServices().then((_) => BlocProvider.of<MapBloc>(context)
                    .add(MoveCameraEvent(currentLocation, concordia_constants.poiZoomLevel, false)));
              }
            },
          );
        } else {
          BlocProvider.of<MapBloc>(context)
              .add(MoveCameraEvent(currentLocation, concordia_constants.poiZoomLevel, false));
        }
      },
    );
  }
}

void hidePanel() {
  OutdoorPathService.instance.clearAll();
  _pc.hide();
}

void revealPanel() {
  _pc.show();
}
