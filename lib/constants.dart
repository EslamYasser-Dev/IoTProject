import 'package:flutter/material.dart';
import 'package:gradients/gradients.dart';

// Colors Constants
const primaryColor = Color(0xFF2465EA);
const secondaryColor = Color.fromARGB(218, 215, 215, 218);
const bgColor = Color.fromARGB(223, 255, 255, 255);
const fontColor = Color.fromARGB(255, 0, 0, 0);
const SideMenuIconsColor = Color.fromARGB(232, 226, 226, 226);

const colors = <Color>[Color(0xFFFDFBFB), Color(0xFFEBEDEE)];





LinearGradient gradient = LinearGradient(
    begin: Alignment.topRight, end: Alignment.center, colors: colors);
//Design Constans

LinearGradient bottonGradient = LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xFF0061FF),
                Color(0xFF60EFFF),
              ],
              );



const defaultPadding = 13.0;
const defualtShadow = [
  BoxShadow(
      blurRadius: 10,
      offset: Offset(1, 2),
      blurStyle: BlurStyle.normal,
      color: Color.fromARGB(177, 173, 173, 173))
];
conditonalShadow(e) => {
      e ? [BoxShadow()] : defualtShadow
    };

// connection constants
const baseURL =
    "https://beta.masterofthings.com/tank_readings_api?DriverManagerId=1&DriverManagerPassword=123";
const mqttServ = "aee36ff0c4064c9eac7c51c2c492629e.s1.eu.hivemq.cloud";
const mqttSoc = "8884";
