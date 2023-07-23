// ignore: file_names
import '../web_services/mot.dart';
import '../models/TanksData_Model.dart';

class TankRepo {
  final MotWebServices motWebServices;

  TankRepo(this.motWebServices);

  Future<List<Tank>> getAllTanksFromMot() async {
    final tanks = await motWebServices.getAllTanksFromMot();
    return tanks.map((tank) => Tank.fromJson(tank)).toList();
  }
}
  