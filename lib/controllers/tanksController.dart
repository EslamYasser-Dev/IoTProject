import 'package:get/get.dart';
import 'package:tanks/models/TanksData_Model.dart';
import '../constants.dart';
import '../repos/ApiService.dart';

class TankController extends GetxController {
  final ApiService _apiService = ApiService();
  final tanks = <Tank>[].obs;
  final isLoading = false.obs;

  void fetchTanks() async {
    isLoading.value = true;
    final result = await _apiService.fetchTanks(factoryId);
    tanks.value = result;
    isLoading.value = false;
              update();

  }
}
