import 'package:get/get_connect.dart';
import 'package:tanks/constants.dart';

class LoginApiProvider extends GetConnect {
  final String _loginUrl = loginURL;

  Future<Response<dynamic>> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      final Map<String, dynamic> data = {
        'email': email,
        'password': password,
      };
      final Response<dynamic> response = await get(
        _loginUrl,
        query: data,
      );
      return response;
    } catch (error) {
      throw error;
    }
  }
}