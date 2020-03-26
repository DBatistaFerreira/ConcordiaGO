import 'package:concordia_go/services/scheduler_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockService extends Mock implements SchedulerService {}

void main() {
  test('intTimeToStringTest', () {
    expect(SchedulerService.instance.intTimeToString(360), '6:00');
    expect(SchedulerService.instance.intTimeToString(1230), '20:30');
    expect(SchedulerService.instance.intTimeToString(0), '0:00');
  });

  //Problematic test, Method not testable due to use of DateTime
  /* test('nextShuttleTimeTest', (){
    var currentTime = MockService();
    when(currentTime.getCurrentWeekDay()).thenReturn(2);
    expect(SchedulerService.instance.scheduleNextShuttleTime('7:30', 'SGW'), 465);

  });*/

  test('calculateNewTime', () {
    expect(SchedulerService.instance.calculateNewTime('7:30', 45), '8:15');
    expect(SchedulerService.instance.calculateNewTime('20:30', 70), '21:40');
    expect(SchedulerService.instance.calculateNewTime('11:30', 35), '12:05');
  });

  test('stringTimeToInt', () {
    expect(SchedulerService.instance.stringTimeToInt('6:00'), 360);
    expect(SchedulerService.instance.stringTimeToInt('20:30'), 1230);
    expect(SchedulerService.instance.stringTimeToInt('0:00'), 0);
  });

  test('calculateArrivalTimeinStringFormat', () {
    expect(SchedulerService.instance.calculateArrivalTimeinStringFormat('2 mins'),
        SchedulerService.instance.calculateNewTime(SchedulerService.instance.stringTime(), 2));
    expect(SchedulerService.instance.calculateArrivalTimeinStringFormat('2 hours 4 mins'),
        SchedulerService.instance.calculateNewTime(SchedulerService.instance.stringTime(), 124));
    expect(SchedulerService.instance.calculateArrivalTimeinStringFormat('0 min'),
        SchedulerService.instance.calculateNewTime(SchedulerService.instance.stringTime(), 0));
    expect(SchedulerService.instance.calculateArrivalTimeinStringFormat('8 hours 15 min'),
        SchedulerService.instance.calculateNewTime(SchedulerService.instance.stringTime(), 495));
  });
  test('calculateArrivalTimeinIntFormat', () {
    expect(SchedulerService.instance.calculateArrivalTimeInIntFormat('2 days 4 hours'), 3120);
    expect(SchedulerService.instance.calculateArrivalTimeInIntFormat('1 day 4 hours'), 1680);
    expect(SchedulerService.instance.calculateArrivalTimeInIntFormat('1 hour 6 minutes'), 66);
    expect(SchedulerService.instance.calculateArrivalTimeInIntFormat('3 hours 10 minutes'), 190);
  });

  test('getCurrentTime', () {
    expect(SchedulerService.instance.getCurrentTime(), DateTime.now());
  });

  test('getCurrentWeekDay', () {
    expect(SchedulerService.instance.getCurrentWeekDay(), DateTime.now().weekday);
  });
}
