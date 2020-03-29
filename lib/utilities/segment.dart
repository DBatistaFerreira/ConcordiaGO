import 'package:concordia_go/utilities/direction.dart';

class Segment {
  Segment(this.mainDirective) {
    substeps = <Direction>[];
  }

  Direction mainDirective;
  List<Direction> substeps;
  bool hasSubstep;

  void addSubstep(Direction substep) {
    hasSubstep = true;
    if (substep == null) {
    } else {
      substeps.add(substep);
    }
  }
}
