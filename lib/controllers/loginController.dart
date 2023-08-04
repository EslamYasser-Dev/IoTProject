import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tanks/screens/main/main_screen.dart';
import '../repos/ApiLogin.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final LoginService _loginService = LoginService();

  void login() async {
    // Call the login method of the LoginService with the factoryId and password
    await _loginService.login(
      emailController.text,
      passwordController.text,
    );
      Get.offAll(MainScreen());
      // TankController.fetchTanks();
  }
}
