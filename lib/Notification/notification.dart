import 'package:firebase_messaging/firebase_messaging.dart';

void setupNotifications() {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  messaging.requestPermission();

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print('Received message: ${message.notification?.title}');
  });
}
