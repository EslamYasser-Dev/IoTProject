
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


  List<List> tankTemperature(){
    List<String> temp=[];
    final environmentSensors = EnvironmentSensors();   
    var tempAvailable = await environmentSensors.getSensorAvailable(SensorType.AmbientTemperature);
    var humidityAvailable = await environmentSensors.getSensorAvailable(SensorType.Humidity);
    var pressureAvailable = await environmentSensors.getSensorAvailable(SensorType.Pressure);

tempAvailable?
  environmentSensors.temperature.listen((temperature) {
      temp.add(temperature.toString());    
  }) : print("error");


  humidityAvailable?environmentSensors.temperature.listen((temperature) {
      temp[1]=temperature.toString();    
  }) : print("error");
  }






}
