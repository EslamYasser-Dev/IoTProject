/*

   ------------------- Authored By: Eslam Yasser ---------------------

*this for edge computing on Devices have an Android OS installed on it.

* >>>> SensorMeasurements.getPercentFromSensor() retutns List for accelerometer sensor.
* values are in String ------ List<String>

* >>>> SensorMeasurements.tankStatus() returns Map conatins temp, humidity, pressure as keys
* values are in double

** you can remove print("") statments and add an event according to use case

*/

import 'package:sensors_plus/sensors_plus.dart';
import 'package:environment_sensors/environment_sensors.dart';

class SensorMeasurements {
  List<String> getPercentFromSensor() {
    //currentReading[0] ==> ord
    //currentReading[1] ==> user
    List<String> currentReading = [];

    accelerometerEvents.listen(
      (AccelerometerEvent event) {
        currentReading[0] = event.y.toString();
      },
      onError: (error) {
        currentReading[0] = "Error: Sensor is broken";
      },
      cancelOnError: true,
    );
// [AccelerometerEvent (x: 0.0, y: 9.8, z: 0.0)]

    userAccelerometerEvents.listen(
      (UserAccelerometerEvent event) {
        currentReading[1] = event.y.toString();
      },
      onError: (error) {
        currentReading[1] = "Error: Sensor is broken";
      },
      cancelOnError: true,
    );
    return currentReading;
  }

  Future<Map<String, double>> tankStatus() async {
    Map<String, double> readings = {};
    //قياس الضغط و الحرارة والرطوبة داخل الخزان

    //شوف السينسور مودود ولا لا
    final environmentSensors = EnvironmentSensors();
    var tempAvailable =
        environmentSensors.getSensorAvailable(SensorType.AmbientTemperature);
    var humidityAvailable =
        environmentSensors.getSensorAvailable(SensorType.Humidity);
    var pressureAvailable =
        environmentSensors.getSensorAvailable(SensorType.Pressure);

    await tempAvailable
        ? environmentSensors.temperature.listen((temperature) {
            //موجود نفذ الكود و خزن قيمتة داخل الماب
            readings["temp"] = temperature.toDouble();
            temperature.toDouble() > 50.0
                ? print("Coution temperature is higher than 50 C\n")
                : print("temperature OK \n");
          })
        : print(
            "temprature sensor is broken or not in the kit\n"); // طب مش موجود قول انو مش موجود

    await humidityAvailable
        ? environmentSensors.humidity.listen((humidity) {
            //موجود نفذ الكود و خزن قيمتة داخل الماب
            readings["humidity"] = humidity.toDouble();
            humidity.toDouble() > 45.0
                ? print("Coution humidity is higher than 45\n") //نقدر نشيلها و نحط ايفنت علي سبيل المثال سيجنال تشغل الشفاط عشان الرطوبة تقل 
                : print("humidity OK \n"); 
          })
        : print(
            "Humidty sensor is broken or not in the kit\n"); // طب مش موجود قول انو مش موجود

    await pressureAvailable
        ? environmentSensors.pressure.listen((pressure) {
            //موجود نفذ الكود و خزن قيمتة داخل الماب
            readings["pressure"] = pressure.toDouble();
            pressure.toDouble() > 3.5
                ? print("Coution pressure is higher than 3.5 Bar\n")
                : print("pressure OK \n");
          })
        : print(
            "pressure sensor is broken or not in the kit\n"); // طب مش موجود قول انو مش موجود

    return readings;
  }
}
