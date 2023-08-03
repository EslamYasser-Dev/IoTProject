import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tanks/controllers/loginController.dart';
import 'package:tanks/screens/main/main_screen.dart';
import '../../constants.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    return Scaffold(
        backgroundColor: CupertinoColors.secondarySystemFill,
        body: SafeArea(
          child: Obx(
            () => Container(
              decoration: BoxDecoration(gradient: gradient),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      'assets/loginlogo.png',
                      height: 128,
                      width: 128,
                      scale: 2.5,
                    ),
                    const Text(
                      'Login',
                      style: TextStyle(
                          color: CupertinoColors.activeBlue,
                          fontSize: 35,
                          fontWeight: FontWeight.bold),
                    ),
                    const Text("IoT Tank Monitoring"),
                    const SizedBox(
                      height: 19,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: CupertinoColors.systemBackground,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        children: [
                          CupertinoTextFormFieldRow(
                            controller: emailController,
                            prefix: const Center(
                                child:
                                    Icon(Icons.supervised_user_circle_sharp)),
                            placeholder: 'Email',
                            placeholderStyle: TextStyle(
                                color: CupertinoColors.darkBackgroundGray
                                    .withOpacity(0.6)),
                            keyboardType: TextInputType.emailAddress,
                            keyboardAppearance: Brightness.dark,
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            decoration: const BoxDecoration(
                                border: Border(
                                    top: BorderSide(
                                        color: CupertinoColors.separator))),
                          ),
                          CupertinoTextFormFieldRow(
                            controller: passwordController,
                            prefix:
                                const Center(child: Icon(Icons.password_sharp)),
                            obscureText: true,
                            placeholder: 'Password',
                            placeholderStyle: TextStyle(
                                color: CupertinoColors.darkBackgroundGray
                                    .withOpacity(0.6)),
                            keyboardType: TextInputType.emailAddress,
                            keyboardAppearance: Brightness.dark,
                          ),
                        ],
                      ),
                      ////
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    SizedBox(
                        width: Get.width,
                        child: CupertinoButton.filled(
                            child: const FittedBox(
                              child: Text(
                                'Login Here',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 20),
                              ),
                            ),
                            onPressed: Get.find<LoginController>().isLoading
                                ? null
                                : () => {
                                      (BuildContext context) async {
                                        final LoginController controller =
                                            Get.find<LoginController>();
                                        final String email =
                                            emailController.text;
                                        final String password =
                                            passwordController.text;
                                        if (email.isEmpty || password.isEmpty) {
                                          Get.snackbar(
                                            'Login Failed',
                                            'Please enter your email and password',
                                            duration: Duration(seconds: 5),
                                          );
                                        } else {
                                          await controller.loginUser(
                                              email: email, password: password);
                                          // Navigate to the home screen on successful login
                                          if (!controller.isLoading) {
                                            Get.offAll(MainScreen());
                                          }
                                        }
                                      }
                                    })),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
