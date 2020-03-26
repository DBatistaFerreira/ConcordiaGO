
/// A direction request to be sent to the direction handler.
class DirectionRequest{
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
  DirectionRequest(List<String> buildings, List<String> rooms){
    _buildings = buildings;
    _rooms = rooms;
  }

  /// Constructor to create a direction request object with nothing set.
  DirectionRequest.withNothing(){
    _buildings = <String>[];
    _rooms = <String>[];
  }

  /// Sets the [buildings] list to the buildings list passed.
  void setBuildings(List<String> buildings){
    _buildings = buildings;
  }

  /// Sets the [rooms] list to the rooms list passed.
  void setRooms(List<String> rooms){
    _rooms = rooms;
  }

  /// Sets the source room node ID of the [rooms] list to the room node ID passed.
  void setRoomSource(String room){
    _rooms[0] = room;
  }

  /// Sets the destination room node ID of the [rooms] list to the room node ID passed.
  void setRoomDestination(String room){
    _rooms[1] = room;
  }

  /// Sets the source building code of the [buildings] list to the building code passed.
  void setBuildingSource(String building){
    _buildings[0] = building;
  }

  /// Sets the destination building code of the [buildings] list to the building code passed.
  void setBuildingDestination(String building){
    _buildings[1] = building;
  }

  /// Returns the [buildings] list.
  List<String> getBuildings(){
    return _buildings;
  }

  /// Returns the [rooms] list.
  List<String> getRooms(){
    return _rooms;
  }

  /// Returns the source building code of the [buildings] list.
  String getBuildingSource(){
    return _buildings[0];
  }

  /// Returns the destination building code of the [buildings] list.
  String getBuildingDestination(){
    return _buildings[1];
  }

  /// Returns the source room node ID of the [rooms] list.
  String getRoomSource(){
    return _rooms[0];
  }

  /// Returns the destination room node ID of the [rooms] list.
  String getRoomDestination(){
    return _rooms[1];
  }
}