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
}
