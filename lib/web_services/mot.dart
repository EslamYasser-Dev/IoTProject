import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../constants.dart';

class MotWebServices {
  late Dio dio;

  MotWebServices() {
    BaseOptions options = BaseOptions(
        baseUrl: baseURL,
        receiveDataWhenStatusError: true,
        connectTimeout:const Duration(seconds: 30),
        receiveTimeout:const Duration(seconds: 30),
        
        );
    dio = Dio(options);
  }

  Future<List<dynamic>> getAllTanksFromMot() async {
    try {
      Response res = await dio.get('tanks');
      if (kDebugMode) {
        print(res.data.toString());
      }
      return res.data;
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return [];
    }
  }
}
