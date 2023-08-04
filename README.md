# tanks
this app manages factory tanks at a time
# IoTProject

This repository contains code and resources a part of an IoT project. Using Master of things as an Aplication Enablement platform.

## Devices/Sensors

1. To indicates the percentage of a content of a tank used an ultrasonic sensor. 
2. Temprature sensor.
3. pressure senesor.
4. PH sensor
hint: you can use sensit, or custom embbeded devices 

## Wireless Technology

connected these sensors to a gateway that supports WIFI (2.4 GHZ)

## Gateways & Carrier network

any router supports WIFI (2.4GHZ) and can connect to the internet via cable, 3G, 4G.


## AEP platform
all datacollected goes to Master Of things AEP to store and analyse handle event, do firmware updates via secure MQTTs protocols.
all these analytics can be viewded on android devices, linux, mac OS via MOT Api. 


## About the Project

IoT, or the Internet of Things, refers to the interconnection of devices and objects over the internet. IoT projects can range from simple home automation systems to complex industrial applications. This project focuses on building an IoT system using various sensors and microcontrollers.

### Getting Started

To get started with this project, you will need some basic knowledge of electronics and programming. You may also want to familiarize yourself with some common IoT technologies such as Arduino, ESP32, and Raspberry Pi.

1. Clone this repository to your local machine.
2. Install the necessary libraries and dependencies.
3. Follow the instructions in the project documentation to set up your hardware and run the code.
*this for edge computing on Devices have an Android OS installed on it.

* >>>> <SensorMeasurements.getPercentFromSensor()> retutns List for accelerometer sensor.
* values are in String ------ List<String>

* >>>> <SensorMeasurements.tankStatus()> returns Map conatins temp, humidity, pressure as keys

## Contributing

Contributions are welcome! If you have any ideas or suggestions for improving this project, please feel free to open an issue or submit a pull request.

## License

This project is licensed under the MIT License. See the LICENSE file for more information.
