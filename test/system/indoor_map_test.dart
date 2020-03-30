import 'package:concordia_go/blocs/bloc.dart';
import 'package:concordia_go/blocs/map_bloc/map_bloc.dart';
import 'package:concordia_go/main.dart';
import 'package:concordia_go/models/node.dart';
import 'package:concordia_go/widgets/component/floor_selection_dropdown.dart';
import 'package:concordia_go/widgets/component/room_info_sheet.dart';
import 'package:concordia_go/widgets/screens/indoor_map_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:photo_view/photo_view.dart';

void main() {
  testWidgets(
    'IndoorMap',
    (WidgetTester tester) async {
      MapBloc mapBloc;
      BuildingInfoBloc buildingInfoBloc;

      // pump Application to set screenHeight and screenWidth
      await tester.pumpWidget(Application());

      await tester.pumpWidget(
        MultiBlocProvider(
          providers: [
            BlocProvider<MapBloc>(
              create: (BuildContext context) => mapBloc = MapBloc(),
            ),
            BlocProvider<BuildingInfoBloc>(
              create: (BuildContext context) => buildingInfoBloc = BuildingInfoBloc(),
            )
          ],
          child: MaterialApp(
            home: Scaffold(body: IndoorMapScreen()),
          ),
        ),
      );

      mapBloc.add(FloorChange(
          'H',
          '8',
          <String, List<Node>>{
            '8': <Node>[Node('100820'), Node('100825')]
          },
          true));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 50));

      RoomInfoSheet.buildInfoSheet(scaffoldKey.currentState, indoorContext);
      await tester.pump();

      buildingInfoBloc.add(const ConcordiaRoomInfoEvent('H', '8', '100820'));
      await tester.pump();

      mapBloc.add(FloorChange(
          'H',
          '1',
          <String, List<Node>>{
            '1': <Node>[Node('000002'), Node('000001')],
            '9': <Node>[Node('000001'), Node('000002')]
          },
          true));
      await tester.pump();

      // Widgets test
      expect(find.byWidgetPredicate((Widget widget) => widget is PhotoView), findsOneWidget);
      expect(find.byWidgetPredicate((Widget widget) => widget is SvgPicture), findsOneWidget);
      expect(find.byWidgetPredicate((Widget widget) => widget is FloorSelectionDropdown), findsOneWidget);
      expect(find.byWidgetPredicate((Widget widget) => widget is BottomSheet), findsOneWidget);

      // Floor level dropdown
      expect(find.text('1'), findsOneWidget);
      expect(find.byIcon(Icons.import_export), findsOneWidget);

      // Find bottom-sheet triggered with room information
      expect(find.text('H820'), findsOneWidget);
      expect(find.text('Hall Building'), findsOneWidget);
      expect(find.byIcon(Icons.directions), findsOneWidget);

      // Stop Navigation button
      expect(find.text('Stop navigation'), findsOneWidget);
      expect(find.byIcon(Icons.cancel), findsOneWidget);
    },
  );
}
