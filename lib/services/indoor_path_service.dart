import 'package:xml/xml.dart' as xml;

class IndoorPathService {

  static String parse(String documentFile, List<List<int>> nodeCoordinates) {
    xml.XmlDocument document = xml.parse(documentFile);
    List<xml.XmlNode> textGroup =
        document.findAllElements('text').first.parent.children;

    if(nodeCoordinates.length<2){
      addMarkerTag(textGroup, nodeCoordinates.first[0], nodeCoordinates.first[1]);
      return document.toString();
    }

    for (int i = 0; i < nodeCoordinates.length - 1; i++) {
      addLine(textGroup, nodeCoordinates[i][0], nodeCoordinates[i][1],
          nodeCoordinates[i + 1][0], nodeCoordinates[i + 1][1]);
    }

    addStartTag(textGroup, nodeCoordinates.first[0], nodeCoordinates.first[1]);

    addEndTag(textGroup, nodeCoordinates.last[0], nodeCoordinates.last[1]);
    return document.toString();
  }

  static void addLine(List<xml.XmlNode> targetGroup, int x1, int y1,
      int x2, int y2) {
    targetGroup.add(xml.XmlElement(xml.XmlName.fromString('line'), [
      xml.XmlAttribute(xml.XmlName.fromString('x1'), x1.toString()),
      xml.XmlAttribute(xml.XmlName.fromString('y1'), y1.toString()),
      xml.XmlAttribute(xml.XmlName.fromString('x2'), x2.toString()),
      xml.XmlAttribute(xml.XmlName.fromString('y2'), y2.toString()),
      xml.XmlAttribute(xml.XmlName.fromString('stroke'), "#bf0000"),
      xml.XmlAttribute(xml.XmlName.fromString('stroke-width'), "6"),
      xml.XmlAttribute(xml.XmlName.fromString('stroke-dasharray'), "5,2,2,2")
    ]));
  }

  static void addStartTag(List<xml.XmlNode> targetGroup, int x, int y) {
    targetGroup.add(xml.XmlElement(xml.XmlName.fromString('path'), [
      xml.XmlAttribute(xml.XmlName.fromString('fill'), '#7f0000'),
      xml.XmlAttribute(xml.XmlName.fromString('d'),
          'm2,-3.86364c-3.41546,0 -6.18182,2.84773 -6.18182,6.36364s2.76636,6.36364 6.18182,6.36364s6.18182,-2.84773 6.18182,-6.36364s-2.76637,-6.36364 -6.18182,-6.36364zm13.81636,4.77273c-0.71091,-6.63409 -5.82636,-11.9 -12.27091,-12.63182l0,-3.27727l-3.09091,0l0,3.27727c-6.44454,0.73182 -11.55999,5.99773 -12.2709,12.63182l-3.18364,0l0,3.18182l3.18364,0c0.71091,6.63409 5.82636,11.9 12.2709,12.63182l0,3.27727l3.09091,0l0,-3.27727c6.44455,-0.73182 11.56,-5.99773 12.27091,-12.63182l3.18364,0l0,-3.18182l-3.18364,0zm-13.81636,12.72727c-5.98091,0 -10.81818,-4.97954 -10.81818,-11.13636s4.83727,-11.13636 10.81818,-11.13636s10.81818,4.97954 10.81818,11.13636s-4.83727,11.13636 -10.81818,11.13636z'),
      xml.XmlAttribute(
          xml.XmlName.fromString('transform'), 'translate(${x} ${y})'),
    ]));
  }

  static void addEndTag(List<xml.XmlNode> targetGroup, int x, int y) {
    targetGroup.add(xml.XmlElement(xml.XmlName.fromString('path'), [
      xml.XmlAttribute(xml.XmlName.fromString('fill'), '#7f0000'),
      xml.XmlAttribute(xml.XmlName.fromString('d'),
          'm1.29333,-11.82353l-0.69333,-3.17647l-15.6,0l0,27l3.46667,0l0,-11.11765l9.70667,0l0.69333,3.17647l12.13333,0l0,-15.88235l-9.70666,0l-0.00001,0z'),
      xml.XmlAttribute(
          xml.XmlName.fromString('transform'), 'translate(${x} ${y})'),
    ]));
  }

  static void addMarkerTag(List<xml.XmlNode> targetGroup, int x, int y) {
    targetGroup.add(xml.XmlElement(xml.XmlName.fromString('path'), [
      xml.XmlAttribute(xml.XmlName.fromString('fill'), '#7f0000'),
      xml.XmlAttribute(xml.XmlName.fromString('d'),
          'm-4.5,-15c-5.805,0 -10.5,5.4775 -10.5,12.25c0,9.1875 10.5,22.75 10.5,22.75s10.5,-13.5625 10.5,-22.75c0,-6.7725 -4.695,-12.25 -10.5,-12.25zm0,16.625c-2.07,0 -3.75,-1.96 -3.75,-4.375s1.68,-4.375 3.75,-4.375s3.75,1.96 3.75,4.375s-1.68,4.375 -3.75,4.375z'),
      xml.XmlAttribute(
          xml.XmlName.fromString('transform'), 'translate(${x} ${y})'),
    ]));
  }
}
