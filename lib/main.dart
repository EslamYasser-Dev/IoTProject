import 'package:get/get.dart';
import 'package:tanks/constants.dart';
import 'package:tanks/repos/tankRepo.dart';
import 'package:tanks/screens/main/login.dart';
import 'package:tanks/screens/main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tanks/web_services/mot.dart';

import 'controllers/tanksController.dart';
import 'cubit/tank_cubit.dart';

void main() {
  Get.put(TankController(TankRepo(MotWebServices())));
  runApp(MyApp());
  
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  late TankCubit tankCubit;
  late TankRepo tankRepo;

  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        // key: MenuAppController.scaffoldKey,
        initialRoute: "Login_Screen",
        routes: {
          'login': (context) => LoginScreen(),
          'main': (context) => MainScreen(),
        },
        debugShowCheckedModeBanner: false,
        title: 'Industrial Tanks Summary',
        theme: ThemeData.light().copyWith(
          textTheme:
              GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme).apply(
            bodyColor: Color.fromARGB(255, 0, 0, 0),
          ),
          canvasColor: secondaryColor,
        ),
        home: LoginScreen());
  }
}
