import 'package:dio/dio.dart';
import 'package:tanks/constants.dart';
import '../models/loginModel.dart';

class LoginService {
  final Dio _dio = Dio();

  Future<List<Loginm>> login(String factoryId, String password) async {
    try {
      final r = await _dio.get(
        loginURL,
        queryParameters: {
          "factoryId": factoryId,
          "password": password,
        },
      );
      return (r.data as List).map((log) => Loginm.fromJson(log)).toList();
      // sensor_id = log[0].factoryId.toString();
      // Handle the response here
    } catch (e) {
      print(e);
      return [];
    }
  }
}
