import 'package:concordia_go/utilities/direction.dart';

class Segment {
  Direction mainDirective;
  List<Direction> substeps;
  bool hasSubstep;

  Segment(this.mainDirective) {
    substeps = List<Direction>();
  }

  void addSubstep(Direction substep) {
    hasSubstep = true;
    if (substep == null) {
      print(substep);
    } else {
      substeps.add(substep);
    }
  }
}