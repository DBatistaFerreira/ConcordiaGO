import 'package:flutter_app/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(Application());

    // Verify that our counter starts at 0.
    expect(find.text('Concordia GO is gonna be awesome!'), findsOneWidget);
  });
}
