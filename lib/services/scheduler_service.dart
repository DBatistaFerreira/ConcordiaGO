import 'package:concordia_go/utilities/concordia_constants.dart' as concordia_constants;

class SchedulerService {
  SchedulerService._privateConstructor();

  static final SchedulerService instance = SchedulerService._privateConstructor();

  bool isShuttlePossible = true;
  int nextShuttleTime = 0;

  int scheduleNextShuttleTime(String currentTimeInStringFormat, String departureCampus) {
    isShuttlePossible = false;
    var currentTime = stringTimeToInt(currentTimeInStringFormat);
    var currentDay = getCurrentWeekDay();
    var todaysShuttleTimes = ((concordia_constants.shuttleStops[concordia_constants.campusSGW]
        [concordia_constants.shuttleSchedule] as List)[currentDay - 1] as List);
    todaysShuttleTimes.isEmpty ? isShuttlePossible = false : isShuttlePossible = true;
    if (isShuttlePossible == false) {
      return -1;
    }
    var i = 0;
    while (todaysShuttleTimes[i] < currentTime) {
      i++;
    }
    nextShuttleTime = todaysShuttleTimes[i];
    return todaysShuttleTimes[i];
  }

  String intTimeToString(int timeInIntFormat) {
    var minutes = timeInIntFormat.remainder(60);
    var hours = (timeInIntFormat / 60).floor();
    var newTime;
    if (minutes < 10) {
      newTime = "${hours}:0${minutes}";
    } else {
      newTime = "${hours}:${minutes}";
    }
    return newTime;
  }

  void clearAll() {
    isShuttlePossible = true;
    nextShuttleTime = 0;
  }

  String calculateTotalArrivalTime(walkToShuttleStop, walkToDestination, String departureCampus) {
    var currentTime = getCurrentTime();
    var currentTimeInIntFormat = currentTime.hour * 60 + currentTime.minute;
    var busDepartureTime = scheduleNextShuttleTime(intTimeToString(walkToShuttleStop), departureCampus);
    if (busDepartureTime == -1) {
      return 'No Buses';
    }
    int totalTime = currentTimeInIntFormat +
        (busDepartureTime - currentTimeInIntFormat) +
        (walkToDestination - currentTimeInIntFormat) +
        30;
    return intTimeToString(totalTime);
  }

  String calculateNewTime(String timeInStringFormat, timeToAdd) {
    var brokenTimeValues = timeInStringFormat.split(':');
    var hours = int.parse(brokenTimeValues[0]);
    var minutes = int.parse(brokenTimeValues[1]) + timeToAdd;
    while (minutes > 59) {
      hours++;
      minutes -= 60;
    }
    if(hours > 23){
      hours -= 24;
    }
    var newTime;
    if (minutes < 10) {
      newTime = "${hours}:0${minutes}";
    } else {
      newTime = "${hours}:${minutes}";
    }
    return newTime;
  }

  int stringTimeToInt(String timeInStringFormat) {
    var timeInMinutes;
    var brokenTimeValues = timeInStringFormat.split(':');
    timeInMinutes = int.parse(brokenTimeValues[0]) * 60 + int.parse(brokenTimeValues[1]);
    return timeInMinutes;
  }

  String calculateArrivalTimeinStringFormat(durationJSON) {
    durationJSON;
    List<String> durationToSplit = durationJSON.split(' ');
    var duration;
    if (durationToSplit.length == 2) {
      duration = int.parse(durationToSplit[0]);
    } else {
      duration = int.parse(durationToSplit[0]) * 60 + int.parse(durationToSplit[2]);
    }
    var currentTime = getCurrentTime();
    var newDuration = Duration(days: 0, hours: 0, minutes: duration);
    var calculated_time = currentTime.add(newDuration);
    var arrival_time;
    if (calculated_time.minute > 9) {
      arrival_time = '${calculated_time.hour.toString()}:${calculated_time.minute.toString()}';
    } else {
      arrival_time = '${calculated_time.hour.toString()}:0${calculated_time.minute.toString()}';
    }
    return arrival_time;
  }

  int calculateArrivalTimeInIntFormat(durationJSON) {
    durationJSON;
    List<String> durationToSplit = durationJSON.split(' ');
    var duration;
    if (durationToSplit.length == 2) {
      duration = int.parse(durationToSplit[0]);
    } else if (durationToSplit[1] == 'hour' || durationToSplit[1] == 'hours') {
      duration = int.parse(durationToSplit[0]) * 60 + int.parse(durationToSplit[2]);
    } else if (durationToSplit[1] == 'day' || durationToSplit[1] == 'days') {
      duration = int.parse(durationToSplit[0]) * 1440 + int.parse(durationToSplit[2]) * 60;
    }
    return duration;
  }

  DateTime getCurrentTime(){
    return DateTime.now();
  }

  String stringTime(){
    if(DateTime.now().minute > 10) {
      return '${DateTime
          .now()
          .hour}:${DateTime
          .now()
          .minute}';
    } else {
      return '${DateTime
          .now()
          .hour}:0${DateTime
          .now()
          .minute}';
    }

  }

  int getCurrentWeekDay(){
    return DateTime.now().weekday;
  }

}
