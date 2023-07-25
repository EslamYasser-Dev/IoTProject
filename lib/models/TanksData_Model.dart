
class Tank {
  late String id, UserID,tankLabel,
        tankCapacity,
        tankPercentage,
        tankTemperature,
        tankHumdity,
        tankPressure,
        contentLabel,
        contentNotes,
        timeStamp;

  Tank.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    UserID = json["UserID"];
    tankLabel = json["tankLabel"];
    tankCapacity = json["tankCapacity"]; // fixed value
    tankPercentage = json["tankPercentage"]; //ultraSonic Sensor readings
    tankTemperature = json["tankTemperature"];
    tankHumdity = json["tankHumdity"];
    tankPressure = json["tankPressure"];
    contentLabel = json["contentLabel"];
    contentNotes = json["contentNotes"];
    timeStamp = json["timeStamp"];
  }
}
