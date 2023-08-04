// ignore_for_file: deprecated_member_use

import 'package:dio/dio.dart';
import '../constants.dart';
import '../models/TanksData_Model.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<List<Tank>> fetchTanks(String sensor_id) async {
    try {
      final response = await _dio.get(
        baseURL,
        queryParameters: {"sensor_id": sensor_id},
      );
      
      return (response.data as List).map((tank) => Tank.fromJson(tank)).toList();
    } on DioError catch (e) {
      print(e.message);
      return [];

    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
