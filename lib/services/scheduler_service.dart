import 'package:concordia_go/utilities/concordia_constants.dart' as concordia_constants;

class SchedulerService {
  SchedulerService._privateConstructor();

  static final SchedulerService instance = SchedulerService._privateConstructor();

  bool isShuttlePossible = true;
  int nextShuttleTime = 0;

  int scheduleNextShuttleTime(String currentTimeInStringFormat, String departureCampus) {
    isShuttlePossible = false;
    final int currentTime = stringTimeToInt(currentTimeInStringFormat);
    final int currentDay = getCurrentWeekDay();
    final List<int> todaysShuttleTimes = (concordia_constants.shuttleStops[concordia_constants.campusSGW]
        [concordia_constants.shuttleSchedule])[currentDay - 1] as List<int>;
    todaysShuttleTimes.isEmpty ? isShuttlePossible = false : isShuttlePossible = true;
    if (isShuttlePossible == false) {
      return -1;
    }
    int i = 0;
    while (todaysShuttleTimes[i] < currentTime) {
      i++;
    }
    nextShuttleTime = todaysShuttleTimes[i];
    return todaysShuttleTimes[i];
  }

  String intTimeToString(int timeInIntFormat) {
    final num minutes = timeInIntFormat.remainder(60);
    final int hours = (timeInIntFormat / 60).floor();
    String newTime;
    if (minutes < 10) {
      newTime = '$hours:0$minutes';
    } else {
      newTime = '$hours:$minutes';
    }
    return newTime;
  }

  void clearAll() {
    isShuttlePossible = true;
    nextShuttleTime = 0;
  }

  String calculateTotalArrivalTime(int walkToShuttleStop, int walkToDestination, String departureCampus) {
    final DateTime currentTime = getCurrentTime();
    final int currentTimeInIntFormat = currentTime.hour * 60 + currentTime.minute;
    final int busDepartureTime = scheduleNextShuttleTime(intTimeToString(walkToShuttleStop), departureCampus);
    if (busDepartureTime == -1) {
      return 'No Buses';
    }
    final int totalTime = currentTimeInIntFormat +
        (busDepartureTime - currentTimeInIntFormat) +
        (walkToDestination - currentTimeInIntFormat) +
        30;
    return intTimeToString(totalTime);
  }

  String calculateNewTime(String timeInStringFormat, int timeToAdd) {
    final List<String> brokenTimeValues = timeInStringFormat.split(':');
    int hours = int.parse(brokenTimeValues[0]);
    int minutes = int.parse(brokenTimeValues[1]) + timeToAdd;
    while (minutes > 59) {
      hours++;
      minutes -= 60;
    }
    if (hours > 23) {
      hours -= 24;
    }
    String newTime;
    if (minutes < 10) {
      newTime = '$hours:0$minutes';
    } else {
      newTime = '$hours:$minutes';
    }
    return newTime;
  }

  int stringTimeToInt(String timeInStringFormat) {
    int timeInMinutes;
    final List<String> brokenTimeValues = timeInStringFormat.split(':');
    timeInMinutes = int.parse(brokenTimeValues[0]) * 60 + int.parse(brokenTimeValues[1]);
    return timeInMinutes;
  }

  String calculateArrivalTimeinStringFormat(String durationJSON) {
    final List<String> durationToSplit = durationJSON.split(' ');
    int duration;
    if (durationToSplit.length == 2) {
      duration = int.parse(durationToSplit[0]);
    } else {
      duration = int.parse(durationToSplit[0]) * 60 + int.parse(durationToSplit[2]);
    }
    final DateTime currentTime = getCurrentTime();
    final Duration newDuration = Duration(days: 0, hours: 0, minutes: duration);
    final DateTime calculatedTime = currentTime.add(newDuration);
    String arrivalTime;
    if (calculatedTime.minute > 9) {
      arrivalTime = '${calculatedTime.hour.toString()}:${calculatedTime.minute.toString()}';
    } else {
      arrivalTime = '${calculatedTime.hour.toString()}:0${calculatedTime.minute.toString()}';
    }
    return arrivalTime;
  }

  int calculateArrivalTimeInIntFormat(String durationJSON) {
    final List<String> durationToSplit = durationJSON.split(' ');
    int duration;
    if (durationToSplit.length == 2) {
      duration = int.parse(durationToSplit[0]);
    } else if (durationToSplit[1] == 'hour' || durationToSplit[1] == 'hours') {
      duration = int.parse(durationToSplit[0]) * 60 + int.parse(durationToSplit[2]);
    } else if (durationToSplit[1] == 'day' || durationToSplit[1] == 'days') {
      duration = int.parse(durationToSplit[0]) * 1440 + int.parse(durationToSplit[2]) * 60;
    }
    return duration;
  }

  DateTime getCurrentTime() {
    return DateTime.now();
  }

  String stringTime() {
    if (DateTime.now().minute > 10) {
      return '${DateTime.now().hour}:${DateTime.now().minute}';
    } else {
      return '${DateTime.now().hour}:0${DateTime.now().minute}';
    }
  }

  int getCurrentWeekDay() {
    return DateTime.now().weekday;
  }
}
