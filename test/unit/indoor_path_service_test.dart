import 'package:concordia_go/services/indoor_path_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:xml/xml.dart' as xml;

void main() {
  final String svgTemplate = '''<svg width="1024" height="1024" xmlns="http://www.w3.org/2000/svg">
    <metadata id="metadata7">image/svg+xml</metadata>
   
    <g>
     <title>background</title>
     <rect x="-1" y="-1" width="1026" height="1026" id="canvas_background" fill="none"/>
    </g>
    <g>
     <title>Layer 1</title>
     <text fill="#000000" stroke="#000000" stroke-width="0" x="769.997645" y="814.992849" id="svg_42" font-size="24" font-family="Helvetica, Arial, sans-serif" text-anchor="start" xml:space="preserve">928</text>
   </g>
   </svg>''';

  test('parse', () {
    var mockSVG = svgTemplate;
    var parsedSVG = IndoorPathService.parse(mockSVG, [
      [0, 1],
      [1, 20]
    ]);
    var parsedSVGtoXML = xml.parse(parsedSVG);
    expect(parsedSVGtoXML.findAllElements('path').length == 2, true);
    expect(parsedSVGtoXML.findAllElements('line').length == 1, true);
    expect(parsedSVG != null, true);
  });

  test('addMarkerTag', () {
    var mockSVG = svgTemplate;
    var parsedSVG = IndoorPathService.parse(mockSVG, [
      [0, 1]
    ]);
    var parsedSVGtoXML = xml.parse(parsedSVG);
    expect(parsedSVGtoXML.findAllElements('path').length == 1, true);
    expect(parsedSVG != null, true);
  });
}
