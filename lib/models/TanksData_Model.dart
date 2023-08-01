//History
class Tank {
  int? id;
  String? timeStamp,
      captureTime,
      phoneVersion,
      appVersion,
      currentLuxValue,
      liter,
      prcentage,
      temp,
      press;

  Tank(
      {this.id,
      this.timeStamp,
      this.captureTime,
      this.phoneVersion,
      this.appVersion,
      this.currentLuxValue,
      this.liter,
      this.prcentage,
      this.temp,
      this.press});

  Tank.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    timeStamp = json['TimeStamp'];
    captureTime = json['captureTime'];
    phoneVersion = json['phoneVersion'];
    appVersion = json['appVersion'];
    currentLuxValue = json['currentLuxValue'];
    liter = json['Liter'];
    prcentage = json['prcentage'];
    temp = json['Temp'];
    press = json['Press'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['TimeStamp'] = this.timeStamp;
    data['captureTime'] = this.captureTime;
    data['phoneVersion'] = this.phoneVersion;
    data['appVersion'] = this.appVersion;
    data['currentLuxValue'] = this.currentLuxValue;
    data['Liter'] = this.liter;
    data['prcentage'] = this.prcentage;
    data['Temp'] = this.temp;
    data['Press'] = this.press;
    return data;
  }
}
