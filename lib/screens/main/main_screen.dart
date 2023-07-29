import 'package:tanks/controllers/MenuAppController.dart';
// import 'package:tanks/cubit/tank_cubit.dart';
import 'package:tanks/responsive.dart';
import 'package:tanks/screens/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/TanksData_Model.dart';
import 'components/side_menu.dart';

class MainScreen extends StatefulWidget {

const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {


late List<Tank> allTanks;


// @override
// void initState(){
//   super.initState();
//   allTanks = Provider.of<TankCubit>(context).getAllTanksFromMot();
// }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read<MenuAppController>().scaffoldKey,
      drawer: const SideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            if (Responsive.isDesktop(context))
              const Expanded(
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
