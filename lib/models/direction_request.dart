
import 'package:validators/validators.dart';

/// A direction request to be sent to the direction handler.
class DirectionRequest {
  /// List of strings to hold the building codes of the directions.
  ///
  /// 0 index holds the building of the source for directions.
  /// 1 index holds the building of the destination for directions.
  List<String> _buildings;

  /// List of strings to hold the room node IDs for directions.
  ///
  /// 0 index holds the source room node ID for directions.
  /// 1 index holds the destination room node ID for directions.
  List<String> _rooms;

  /// Constructor to create a direction request object with the buildings and rooms involved.
  DirectionRequest(String buildingSource, String buildingDestination, String roomSource, String roomDestination) {
    _buildings.insert(0, buildingSource);
    _buildings.insert(1, buildingDestination);
    _rooms.insert(0, roomSource);
    _rooms.insert(1, roomDestination);
  }

  /// Constructor to create a direction request object with nothing set.
  DirectionRequest.withNothing() {
    _buildings = List(2);
    _rooms = List(2);
  }

  /// Sets the [buildings] list to the buildings list passed.
  ///
  /// The [buildings] list passed must be of length 2 with [source, destination].
  void setBuilding(List<String> buildings) {
    if (buildings.length != 2) {
      throw Exception('buildings list must be of length 2: [source, destination]');
    } else {
      _buildings = buildings;
    }
  }

  /// Sets the [rooms] list to the rooms list passed.
  ///
  /// The [rooms] list passed must be of length 2 with [source, destination].
  void setRooms(List<String> rooms) {
    if (rooms.length != 2) {
      throw Exception('rooms list must be of length 2: [source, destination]');
    } else {
      _rooms = rooms;
    }
  }

  /// Sets the source room node ID of the [rooms] list to the room node ID passed.
  void setRoomSource(String room) {
    _rooms[0] = room;
  }

  /// Sets the destination room node ID of the [rooms] list to the room node ID passed.
  void setRoomDestination(String room) {
    _rooms[1] = room;
  }

  /// Sets the source building code of the [buildings] list to the building code passed.
  void setBuildingSource(String building) {
    _buildings[0] = building;
  }

  /// Sets the destination building code of the [buildings] list to the building code passed.
  void setBuildingDestination(String building) {
    _buildings[1] = building;
  }

  /// Returns the [buildings] list.
  List<String> getBuildings() {
    return _buildings;
  }

  /// Returns the [rooms] list.
  List<String> getRooms() {
    return _rooms;
  }

  /// Returns the source building code of the [buildings] list.
  String getBuildingSource() {
    return _buildings[0];
  }

  /// Returns the destination building code of the [buildings] list.
  String getBuildingDestination() {
    return _buildings[1];
  }

  /// Returns the source room node ID of the [rooms] list.
  String getRoomSource() {
    return _rooms[0];
  }

  /// Returns the destination room node ID of the [rooms] list.
  String getRoomDestination() {
    return _rooms[1];
  }

  /// Returns `true` if the first string is equal to the second string.
  bool isEqual(String first, String second){
    return (first == second);
  }

  /// Returns the building code of the building index passed.
  ///
  /// 0 index for the direction's source building.
  /// 1 index for the direction's destination building.
  String getBuildingCode(int index){
    return _extract('letters', index);
  }

  /// Returns the building floor of the building index passed.
  ///
  /// 0 index for the direction's source building.
  /// 1 index for the direction's destination building.
  String getBuildingFloor(int index){
    return _extract('numbers', index);
  }

  /// Returns the building code or building floor, depending on the [type] passed, of the building [index] passed.
  ///
  /// 0 index for the direction's source building.
  /// 1 index for the direction's destination building.
  String _extract(String type, int index) {
    if(index != 0 && index != 1){
      throw Exception('index must be within range [0, 1] : [source, destination]');
    }
    else if (type != 'letters' && type != 'numbers'){
      throw Exception('type must equal \'letters\' or \'numbers\'');
    }
    else{
      var letters = '';
      var numbers = '';
    
      for(var char in _buildings[index].split('')){
        if(isNumeric(char)){
          numbers += char;
        } else {
          letters += char;
        }
      }
    
      return (type == 'letters') ? letters : numbers;
    }
  }
}
