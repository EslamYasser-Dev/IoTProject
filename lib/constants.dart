import 'package:flutter/material.dart';
import 'package:gradients/gradients.dart';



// Colors Constants 
const primaryColor = Color(0xFF2465EA);
const secondaryColor = Color.fromARGB(218, 215, 215, 218);
const bgColor = Color.fromARGB(255, 255, 255, 255);
const fontColor = Color.fromARGB(255, 0, 0, 0);
const SideMenuIconsColor = Color.fromARGB(232, 177, 176, 176);

const colors = <Color>[];
const gradient = LinearGradientPainter(
    colors: colors,);

//Design Constans
const defaultPadding = 13.0;
const defualtShadow = [BoxShadow(blurRadius: 10,offset: Offset(1,2),blurStyle: BlurStyle.normal,color: Color.fromARGB(177, 173, 173, 173))];
conditonalShadow(e) =>{e?[BoxShadow()]:defualtShadow};

// connection constants
const baseURL = "https://beta.masterofthings.com/tank_readings_api?DriverManagerId=1&DriverManagerPassword=123";

