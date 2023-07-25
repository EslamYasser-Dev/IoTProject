import 'package:mqtt_client/mqtt_browser_client.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';



void onConnected() {
  print('Connected');
}

// unconnected
void onDisconnected() {
  print('Disconnected');
}

// subscribe to topic succeeded
void onSubscribed(String topic) {
  print('Subscribed topic: $topic');
}

// subscribe to topic failed
void onSubscribeFail(String topic) {
  print('Failed to subscribe $topic');
}

// unsubscribe succeeded
void onUnsubscribed(String topic) {
  print('Unsubscribed topic: $topic');
}

// PING response received
void pong() {
  print('Ping response client callback invoked');
}

Future<MqttServerClient> connect() async {
  MqttBrowserClient client = MqttBrowserClient(
    'broker.emqx.io', 'flutter_client', maxConnectionAttempts: 3);
  client.logging(on: true);
  client!.port = 8083;
  client.onConnected = onConnected;
  client.onDisconnected = onDisconnected;
  client.onUnsubscribed = onUnsubscribed;
  client.onSubscribed = onSubscribed;
  client.onSubscribeFail = onSubscribeFail;
  client.pongCallback = pong;
​
  final connMessage = MqttConnectMessage()
      .authenticateAs('username', 'password')
      .keepAliveFor(60)
      .withWillTopic('willtopic')
      .withWillMessage('Will message')
      .startClean()
      .withWillQos(MqttQos.atLeastOnce);
  client.connectionMessage = connMessage;
  try {
    await client.connect();
  } catch (e) {
    print('Exception: $e');
    client.disconnect();
  }
​
  client.updates.listen((List<MqttReceivedMessage<MqttMessage>> c) {
    final MqttPublishMessage message = c[0].payload;
    final payload =
    MqttPublishPayload.bytesToStringAsString(message.payload.message);
​
    print('Received message:$payload from topic: ${c[0].topic}>');
  });
​
  return client;
}