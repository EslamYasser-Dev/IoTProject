import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tanks/models/TanksData_Model.dart';
import '../repos/tankRepo.dart';
part 'tank_state.dart';

class TankCubit extends Cubit<TankState> {
final TankRepo tanksRepo;
 
 late List<Tank> tanks;

  TankCubit(this.tanksRepo) : super(TankInitial());
  List<Tank> getAllTanksFromMot (){
    tanksRepo.getAllTanksFromMot().then((tanks){
        emit(TankLoaded(tanks));
        this.tanks = tanks;
    });
    return tanks;
  }


  Color? statex(double percentage) {
    Color color;
    if (percentage > 70) {
      color = Color.fromARGB(255, 238, 36, 160);
    } else if (percentage < 20) {
      color = Color.fromARGB(247, 62, 65, 255);
    } else {
      color = const Color.fromARGB(247, 92, 245, 99);
    }
    return color;
  }
}
