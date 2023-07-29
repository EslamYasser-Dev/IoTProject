// // ignore_for_file: constant_pattern_never_matches_value_type, body_might_complete_normally_nullable

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:tanks/cubit/tank_cubit.dart';
// import 'package:tanks/repos/tankRepo.dart';
// import 'package:tanks/screens/main/main_screen.dart';
// // import 'package:tanks/screens/main/login.dart';
// import 'package:tanks/web_services/mot.dart';

// class AppRouter {
//   late TankRepo tankRepo;
//   late TankCubit tankCubit;

//   AppRouter() {
//     tankRepo = TankRepo(MotWebServices());
//     tankCubit = TankCubit(tankRepo);
//   }
  

//   Route? generateRoute(RouteSettings settings) {
//     switch (settings.name) {
//       case MainScreen:
//         return MaterialPageRoute(
//             builder: (_) => Provider(
//                   create: (BuildContext context) => tankCubit,child:MainScreen()),
//                 );         
//     }
//   }
// }
