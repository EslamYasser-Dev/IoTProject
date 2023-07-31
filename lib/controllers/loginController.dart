import 'package:get/get.dart';

import '../screens/main/main_screen.dart';

class loginController extends GetxController{

     bool isLoggedIN = false; 
     String? user, pwd;

  
  login() {
    try {
     {
        if (user == 'eslamqotb' && pwd == '123456') {
          Get.off(()=>MainScreen());
          this.isLoggedIN = true;
          update();
        } else {
          print("username wrong");
        }
      }
    } catch (err) {
      print(err);
    }
  }

}