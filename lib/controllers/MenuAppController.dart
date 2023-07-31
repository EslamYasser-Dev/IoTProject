// ignore: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class MenuAppController extends GetxController {
  var scaffoldKey = GlobalKey<ScaffoldState>();


  void controlMenu() {
    if (!scaffoldKey.currentState!.isDrawerOpen) {
      scaffoldKey.currentState!.openDrawer();
      update();
    }
  }
}
