import 'package:get/get.dart';
import 'package:tanks/models/TanksData_Model.dart';
import '../repos/tankRepo.dart';

class TankController extends GetxController {
  final TankRepo tanksRepo;
  var tanks = <Tank>[].obs;

  TankController(this.tanksRepo);

  void getAllTanksFromMot() {
    tanksRepo.getAllTanksFromMot().then((tanks) {
      this.tanks.value = tanks;
    });
  }
}
