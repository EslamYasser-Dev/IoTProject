// ignore: file_names
class Tank {
  late String id, UserID,tankLabel,
        tankCapacity,
        tankPercentage,
        tankTemperature,
        tankHumdity,
        tankPressure,
        content,
        timeStamp;

  Tank.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    UserID = json["UserID"];
    tankLabel = json["tankLabel"];
    tankCapacity = json["tankCapacity"];
    tankPercentage = json["tankPercentage"];
    tankTemperature = json["tankTemperature"];
    tankHumdity = json["tankHumdity"];
    tankPressure = json["tankPressure"];
    content = json["content"];
    timeStamp = json["timeStamp"];
  }
}
