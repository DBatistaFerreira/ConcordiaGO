import 'package:concordia_go/services/scheduler_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockService extends Mock implements SchedulerService {}

void main() {
  test('Convert Int Time to String', () {
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

  test('Calculate New String Time', () {
    expect(SchedulerService.instance.calculateNewTime('7:30', 45), '8:15');
    expect(SchedulerService.instance.calculateNewTime('20:30', 70), '21:40');
    expect(SchedulerService.instance.calculateNewTime('11:30', 35), '12:05');
  });

  test('Convert String Time to Int', () {
    expect(SchedulerService.instance.stringTimeToInt('6:00'), 360);
    expect(SchedulerService.instance.stringTimeToInt('20:30'), 1230);
    expect(SchedulerService.instance.stringTimeToInt('0:00'), 0);
  });

  test('Calculate New Arrival Time in String Format ', () {
    expect(SchedulerService.instance.calculateArrivalTimeInStringFormat('2 mins'),
        SchedulerService.instance.calculateNewTime(SchedulerService.instance.stringTime(), 2));
    expect(SchedulerService.instance.calculateArrivalTimeInStringFormat('2 hours 4 mins'),
        SchedulerService.instance.calculateNewTime(SchedulerService.instance.stringTime(), 124));
    expect(SchedulerService.instance.calculateArrivalTimeInStringFormat('0 min'),
        SchedulerService.instance.calculateNewTime(SchedulerService.instance.stringTime(), 0));
    expect(SchedulerService.instance.calculateArrivalTimeInStringFormat('8 hours 15 min'),
        SchedulerService.instance.calculateNewTime(SchedulerService.instance.stringTime(), 495));
  });

  test('Calculate New Arrival Time in Int Format', () {
    expect(SchedulerService.instance.calculateArrivalTimeInIntFormat('2 days 4 hours'), 3120);
    expect(SchedulerService.instance.calculateArrivalTimeInIntFormat('1 day 4 hours'), 1680);
    expect(SchedulerService.instance.calculateArrivalTimeInIntFormat('1 hour 6 minutes'), 66);
    expect(SchedulerService.instance.calculateArrivalTimeInIntFormat('3 hours 10 minutes'), 190);
  });

  test('Get Current Time', () {
    expect((SchedulerService.instance.getCurrentTime().difference(DateTime.now()).inMilliseconds) < 9000, true);
  });

  test('getCurrentWeekDay', () {
    expect(SchedulerService.instance.getCurrentWeekDay(), DateTime.now().weekday);
  });
}
