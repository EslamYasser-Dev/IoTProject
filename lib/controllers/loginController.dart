// Get.defaultDialog(
//     title: "Username or Password is wrong",
//     middleText:
//         "tap outside the frame to Retry \n enter the correct password and username.",
//     backgroundColor: Color.fromARGB(144, 35, 52, 204),
//     titleStyle:
//         TextStyle(color: const Color.fromARGB(255, 255, 255, 255)),
//     middleTextStyle:
//         TextStyle(color: const Color.fromARGB(136, 255, 255, 255)),
//     radius: 35);
import 'package:get/get.dart';
import '../repos/loginprov.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginController extends GetxController {
  final LoginApiProvider _loginApiProvider = LoginApiProvider();
  final FlutterSecureStorage _secureStorage = FlutterSecureStorage();

  final RxBool _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  

  Future<void> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      _isLoading.value = true;
      Response<dynamic> response = await _loginApiProvider.loginUser(
        email: email,
        password: password,
      );

      // Store the user's email and password securely
      await _secureStorage.write(key: 'email', value: email);
      await _secureStorage.write(key: 'password', value: password);
      // Handle the response here
      _isLoading.value = false;
    } catch (error) {
      Get.snackbar(
        'Login Failed',
        'Please check your email and password and try again',
        duration: Duration(seconds: 5),

      );
      _isLoading.value = false;
    }
  }
}
