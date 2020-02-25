import 'package:concordia_go/utilities/Direction.dart';

class Segment{
  Direction mainDirective;
  List<Direction> substeps;
  bool HasSubstep;


  Segment(this.mainDirective){
    substeps = List<Direction>();
  }

  void addSubstep(Direction substep){
    HasSubstep = true;
    if (substep == null){
      print(substep);
    }
    else{
      substeps.add(substep);
    }
  }



}