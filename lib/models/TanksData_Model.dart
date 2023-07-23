// ignore: file_names
class Tank {
  late int id, tankId;
  late String tankLabel,
      tankCapacity,
      tankPercentage,
      tankTemperature,
      tankHumdity,
      timeOfReading;

  Tank.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    tankId = json["tankId"];
    tankLabel = json["tankLabel"];
    tankCapacity = json["tankCapacity"];
    tankPercentage = json["tankPercentage"];
    tankTemperature = json["tankTemperature"];
    tankHumdity = json["tankHumdity"];
    timeOfReading = json["timeOfReading"];
  }
}
