
class DirectionRequest{
  List<String> _buildings;
  List<String> _rooms;

  DirectionRequest(List<String> buildings, List<String> rooms){
    _buildings = buildings;
    _rooms = rooms;
  }

  DirectionRequest.withNothing(){
    _buildings = <String>[];
    _rooms = <String>[];
  }

  void setBuildings(List<String> buildings){
    _buildings = buildings;
  }

  void setRooms(List<String> rooms){
    _rooms = rooms;
  }

  void setRoomSource(String room){
    _rooms[0] = room;
  }

  void setRoomDestination(String room){
    _rooms[1] = room;
  }

  void setBuildingSource(String building){
    _buildings[0] = building;
  }

  void setBuildingDestination(String building){
    _buildings[1] = building;
  }

  List<String> getBuildings(){
    return _buildings;
  }

  List<String> getRooms(){
    return _rooms;
  }

  String getBuildingSource(){
    return _buildings[0];
  }

  String getBuildingDestination(){
    return _buildings[1];
  }

  String getRoomSource(){
    return _rooms[0];
  }

  String getRoomDestination(){
    return _rooms[1];
  }
}