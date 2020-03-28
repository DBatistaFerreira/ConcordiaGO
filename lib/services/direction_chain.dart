import 'package:concordia_go/models/different_building_direction_handler.dart';
import 'package:concordia_go/models/different_floor_direction_handler.dart';
import 'package:concordia_go/models/outdoor_direction_handler.dart';
import 'package:concordia_go/models/same_floor_direction_handler.dart';

class DirectionChain {
  static final DirectionChain instance = DirectionChain._privateConstructor();

  SameFloorDirectionHandler _firstHandler;
  DifferentFloorDirectionHandler _secondHandler;
  DifferentBuildingDirectionHandler _thirdHandler;
  OutdoorDirectionHandler _fourthHandler;

  DirectionChain._privateConstructor() {
    initChain();
  }

  void initChain() {
    _firstHandler = SameFloorDirectionHandler();
    _secondHandler = DifferentFloorDirectionHandler();
    _thirdHandler = DifferentBuildingDirectionHandler();
    _fourthHandler = OutdoorDirectionHandler();

    _firstHandler.setNext(_secondHandler);
    _secondHandler.setNext(_thirdHandler);
    _thirdHandler.setNext(_fourthHandler);
  }

  SameFloorDirectionHandler get head => _firstHandler;
}
