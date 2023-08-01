import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../screens/main/main_screen.dart';

class loginController extends GetxController {
  bool isLoggedIN = false;
  String? user, pwd;

  login() {
    try {
      {
        if (user == 'eslamqotb' && pwd == '123456') {
          Get.off(() => MainScreen());
          this.isLoggedIN = true;
          update();
        } else {
          Get.defaultDialog(
              title: "Username or Password is wrong",
              middleText:
                  "tap outside the frame to Retry \n enter the correct password and username.",
              backgroundColor: Color.fromARGB(144, 35, 52, 204),
              titleStyle:
                  TextStyle(color: const Color.fromARGB(255, 255, 255, 255)),
              middleTextStyle:
                  TextStyle(color: const Color.fromARGB(136, 255, 255, 255)),
              radius: 35);            
        }
      }
    } catch (err) {
      print(err);
    }
  }
}
