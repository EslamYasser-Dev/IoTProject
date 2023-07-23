
import 'package:sensors_plus/sensors_plus.dart';
import 'package:environment_sensors/environment_sensors.dart';

class SensorMeasure {
  List<String> getPercentFromSensor() {
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


  Future<Map<String, double>> tankTemperature() async {
    Map<String,double> readings = {};
  

  //شوف السينسور مودود ولا لا 
    final environmentSensors = EnvironmentSensors();   
    var tempAvailable =  environmentSensors.getSensorAvailable(SensorType.AmbientTemperature);
    var humidityAvailable =  environmentSensors.getSensorAvailable(SensorType.Humidity);
    var pressureAvailable =  environmentSensors.getSensorAvailable(SensorType.Pressure);


await tempAvailable?
  environmentSensors.temperature.listen((temperature) {  //موجود نفذ الكود و خزن قيمتة داخل الماب
      readings["temp"]=temperature.toDouble();
  }): print("temprature sensor is broken or not in the kit");// طب مش موجود قول انو مش موجود 


await humidityAvailable?
  environmentSensors.humidity.listen((humidity) { //موجود نفذ الكود و خزن قيمتة داخل الماب
      readings["humidity"]=humidity.toDouble();
  }):print("Humidty sensor is broken or not in the kit");

await pressureAvailable?
 environmentSensors.pressure.listen((pressure) { //موجود نفذ الكود و خزن قيمتة داخل الماب
      readings["pressure"]=pressure.toDouble();
  }):print("pressure sensor is broken or not in the kit");

 return readings;
  }



}
