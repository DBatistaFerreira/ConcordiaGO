import 'package:concordia_go/blocs/bloc.dart';
import 'package:concordia_go/blocs/map_bloc/map_bloc.dart';
import 'package:concordia_go/utilities/application_constants.dart';
import 'package:concordia_go/widgets/component/floor_selection_dropdown.dart';
import 'package:concordia_go/widgets/screens/indoor_map_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:photo_view/photo_view.dart';

void main() {
  screenHeight = 500;
  screenWidth = 200;

  testWidgets(
    'IndoorMap',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        BlocProvider<MapBloc>(
          create: (context) => MapBloc(),
          child: MaterialApp(
            home: IndoorMapScreen(),
          ),
        ),
      );

      // Widgets test
      expect(find.byWidgetPredicate((Widget widget) => widget is PhotoView), findsOneWidget);
      expect(find.byWidgetPredicate((Widget widget) => widget is SvgPicture), findsOneWidget);
      expect(find.byWidgetPredicate((Widget widget) => widget is FloorSelectionDropdown), findsOneWidget);

      // Floor level
      assert(find.text('1') != null);
    },
  );
}
