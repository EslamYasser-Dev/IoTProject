import 'package:get/get.dart';
import 'package:tanks/controllers/MenuAppController.dart';
import 'package:tanks/responsive.dart';
import 'package:tanks/screens/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';
import '../../models/TanksData_Model.dart';
import 'components/side_menu.dart';

// ignore: must_be_immutable
class MainScreen extends StatelessWidget {


late List<Tank> allTanks;

// @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      drawer:  GetBuilder(init:MenuAppController()  ,builder: (controller) => SideMenu()),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            if (Responsive.isDesktop(context))
               Expanded(
                // default flex = 1
                // and it takes 1/6 part of the screen
                child: SideMenu(),
              ),
            Expanded(
              // It takes 5/6 part of the screen
              flex: 5,
              child: DashboardScreen(),
            ),
          ],
        ),
      ),
    );
  }
}
