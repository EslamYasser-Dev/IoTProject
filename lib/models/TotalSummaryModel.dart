// ignore_for_file: file_names

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
    temperature: "35",
    humdity: "48",
    color: const Color.fromARGB(255, 250, 246, 15)),
  TotalSummary(
    tankLabel: "sidrawood Oil",
    percentage: "81",
    temperature: "63",
    humdity: "55",
    color: const Color.fromARGB(255, 52, 201, 64),
  ),
  TotalSummary(
    tankLabel: "Argan Oil",
    percentage: "35",
    temperature: "15",
    humdity: "73",
    color: const Color.fromARGB(255, 233, 77, 72),
  ),
  TotalSummary(
    tankLabel: "Argan Oil",
    percentage: "35",
    temperature: "15",
    humdity: "73",
    color: const Color.fromARGB(255, 233, 77, 72),
  ),
  
  TotalSummary(
    tankLabel: "Argan Oil",
    percentage: "35",
    temperature: "15",
    humdity: "73",
    color: const Color.fromARGB(255, 233, 77, 72),
  ),
  TotalSummary(
    tankLabel: "Argan Oil",
    percentage: "35",
    temperature: "15",
    humdity: "73",
    color: const Color.fromARGB(255, 233, 77, 72),
  ),
  TotalSummary(
    tankLabel: "Argan Oil",
    percentage: "35",
    temperature: "15",
    humdity: "73",
    color: const Color.fromARGB(255, 233, 77, 72),
  ),
];
