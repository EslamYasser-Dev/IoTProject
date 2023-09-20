
# Tanks Monitoring

This app manages factory tanks at a time. This repository contains code and resources as part of an IoT project, using Master of Things as an Application Enablement platform.

## Devices/Sensors

The following sensors are used in this project:

1. An ultrasonic sensor to indicate the percentage of content in a tank.
2. Temperature sensor.
3. Pressure sensor.
4. PH sensor.

Hint: You can use Sensit or custom embedded devices.

## Wireless Technology

The sensors are connected to a gateway that supports WIFI (2.4 GHz).

## Gateways & Carrier Network

Any router that supports WIFI (2.4 GHz) and can connect to the internet via cable, 3G, or 4G can be used.

## AEP Platform

All data collected is sent to the Master Of Things AEP for storage and analysis, handling events, and performing firmware updates via secure MQTTs protocols. All these analytics can be viewed on Android devices, Linux, and macOS via the MOT API.

## About the Project

IoT, or the Internet of Things, refers to the interconnection of devices and objects over the internet. IoT projects can range from simple home automation systems to complex industrial applications. This project focuses on building an IoT system using various sensors and microcontrollers.

### Getting Started

To get started with this project, you will need some basic knowledge of electronics and programming. You may also want to familiarize yourself with some common IoT technologies such as Arduino, ESP32, and Raspberry Pi.

1. Clone this repository to your local machine.
2. Install the necessary libraries and dependencies.
3. Follow the instructions in the project documentation to set up your hardware and run the code.

For edge computing on devices with Android OS installed:

- `SensorMeasurements.getPercentFromSensor()` returns a list for accelerometer sensor values in `List<String>`.
- `SensorMeasurements.tankStatus()` returns a map containing `temp`, `humidity`, and `pressure` as keys.

## Contributing

Contributions are welcome! If you have any ideas or suggestions for improving this project, please feel free to open an issue or submit a pull request.

## License

This project is licensed under the MIT License. See the LICENSE file for more information.
