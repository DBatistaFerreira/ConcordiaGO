import 'package:xml/xml.dart' as xml;

class IndoorPathService {
  xml.XmlDocument document;

  IndoorPathService(String documentFile) {
    document = xml.parse(documentFile);
  }

  String parse(List<List<double>> nodeCoordinates) {
    List<xml.XmlNode> textGroup =
        document.findAllElements('text').first.parent.children;
    for (int i = 0; i < nodeCoordinates.length - 1; i++) {
      addLine(textGroup, nodeCoordinates[i][0], nodeCoordinates[i][1],
          nodeCoordinates[i + 1][0], nodeCoordinates[i + 1][1]);
    }
    return document.toString();
  }

  void addLine(List<xml.XmlNode> targetGroup, double x1, double y1, double x2,
      double y2) {
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

  void addStartTag(List<xml.XmlNode> targetGroup, double x, double y) {
    targetGroup.add(xml.XmlElement(xml.XmlName.fromString('path'), [
      xml.XmlAttribute(xml.XmlName.fromString('fill'), '#7f0000'),
      xml.XmlAttribute(xml.XmlName.fromString('d'),
          'm16.999999,11.136364c-3.415454,0 -6.181818,2.847727 -6.181818,6.363636s2.766363,6.363636 6.181818,6.363636s6.181818,-2.847727 6.181818,-6.363636s-2.766363,-6.363636 -6.181818,-6.363636zm13.816363,4.772727c-0.710909,-6.63409 -5.826363,-11.899999 -12.270908,-12.631817l0,-3.277273l-3.090909,0l0,3.277273c-6.444545,0.731818 -11.559999,5.997727 -12.270908,12.631817l-3.183636,0l0,3.181818l3.183636,0c0.710909,6.63409 5.826363,11.899999 12.270908,12.631817l0,3.277273l3.090909,0l0,-3.277273c6.444545,-0.731818 11.559999,-5.997727 12.270908,-12.631817l3.183636,0l0,-3.181818l-3.183636,0zm-13.816363,12.727272c-5.980909,0 -10.818181,-4.979545 -10.818181,-11.136363s4.837272,-11.136363 10.818181,-11.136363s10.818181,4.979545 10.818181,11.136363s-4.837272,11.136363 -10.818181,11.136363z'),
      xml.XmlAttribute(xml.XmlName.fromString('transform'), 'translate(${x} ${y})'),
    ]));

    void addEndTag(List<xml.XmlNode> targetGroup, double x, double y) {
      targetGroup.add(xml.XmlElement(xml.XmlName.fromString('path'), [
        xml.XmlAttribute(xml.XmlName.fromString('fill'), '#7f0000'),
        xml.XmlAttribute(xml.XmlName.fromString('d'),
            'm16.293334,3.176471l-0.693333,-3.176471l-15.599999,0l0,27l3.466667,0l0,-11.117647l9.706666,0l0.693333,3.176471l12.133333,0l0,-15.882353l-9.706666,0z'),
        xml.XmlAttribute(xml.XmlName.fromString('transform'), 'translate(${x} ${y})'),
      ]));
  }
}
