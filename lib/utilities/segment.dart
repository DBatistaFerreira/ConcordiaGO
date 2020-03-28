import 'package:concordia_go/utilities/direction.dart';

class Segment {
  Direction mainDirective;
  List<Direction> substeps;
  bool hasSubstep;

  Segment(this.mainDirective) {
    substeps = <Direction>[];
  }

  void addSubstep(Direction substep) {
    hasSubstep = true;
    if (substep == null) {
    } else {
      substeps.add(substep);
    }
  }
}
