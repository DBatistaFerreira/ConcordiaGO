import 'package:concordia_go/models/concordia_building.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    'test Concordia Building constructor and methods',
    () {
      ConcordiaBuilding hq = ConcordiaBuilding(
        code: 'FFHQ',
        name: 'FlutterFlies Headquarters',
        campus: Campus.SGW,
      );

      expect(hq.code, 'FFHQ');
      expect(hq.name, 'FlutterFlies Headquarters');
      expect(hq.campus, Campus.SGW);
      expect(hq.campusName(), 'SGW');
      expect(hq.campusString(), 'SGW Campus');

      expect(campusString(Campus.SGW), 'SGW Campus');
    },
  );
}
