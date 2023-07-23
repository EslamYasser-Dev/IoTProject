// ignore_for_file: file_names

import 'package:tanks/constants.dart';
import 'package:flutter/material.dart';
//this file is a placeholder

class TotalSummary {
  late String tankLabel, percentage, temperature, humdity;
  final Color? color;

  TotalSummary(
      {required this.tankLabel,
      required this.percentage,
      required this.temperature,
      required this.humdity,
      this.color});
}

List summarys = [
  TotalSummary(
      tankLabel: "Orange Oil B",
      percentage: "35",
      temperature: "55",
      humdity: "55",
      color: primaryColor),
  TotalSummary(
    tankLabel: "Orange Oil B",
    percentage: "81",
    temperature: "55",
    humdity: "55",
    color: const Color.fromARGB(255, 52, 201, 64),
  ),
  TotalSummary(
    tankLabel: "Argan Oil",
    percentage: "35",
    temperature: "15",
    humdity: "73",
    color: const Color(0xFFA4CDFF),
  ),
  TotalSummary(
    tankLabel: "UnConsoildated Butter",
    percentage: "9",
    temperature: "23",
    humdity: "49",
    color: const Color(0xFF007EE5),
  ),
];
