import 'package:concordia_go/models/direction_object.dart';
import 'package:concordia_go/models/direction_request.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  //region general fixtures
  final source = Dobject();
  final dest = Dobject();
  // endregion general fixtures

  group('Constructors', () {
    test('constructor should create a direction request object with the values passed', () {
      final request = DirectionRequest(source, dest);

      expect(request.source, source);
      expect(request.destination, dest);
    });
  });

  group('getters', () {
    test('getters should return the source and destination of the direction request', () {
      final request = DirectionRequest(source, dest);

      expect(request.source, source);
      expect(request.destination, dest);
    });
  });

  group('setters', () {
    // region setter test fixtures
    final source2 = Dobject();
    final dest2 = Dobject();
    // endregion setter test fixtures

    test('setters should set the value of the field to the given value', () {
      final request = DirectionRequest(source, dest);

      request.source = source2;
      request.destination = dest2;

      expect(request.source, source2);
      expect(request.destination, dest2);
    });
  });
}
