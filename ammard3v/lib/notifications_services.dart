import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationsServices {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  void requestNotificationsPermission() async {
    NotificationSettings settings = await messaging.requestPermission(
        alert: true,
        announcement: true,
        badge: true,
        carPlay: true,
        criticalAlert: true,
        provisional: true,
        sound: true);
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('user granted persm');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      print('user allowed provisn per');
    } else {
      print('blocked');
    }
  }

  Future<String> getDeviceToken() async {
    String? token = await messaging.getToken();
    return token!;
  }

  void isTokenRefresh() async {
    messaging.onTokenRefresh.listen((event) {
      event.toString();
      print('refresh'); 
    });
  }
}
