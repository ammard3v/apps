import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

void main() {
  AwesomeNotifications().initialize(null, [
    NotificationChannel(
      channelKey: 'basic_channel',
      channelName: 'Basic Notifications',
      channelDescription: 'Notification for basic tests',
      importance: NotificationImportance.Max,
    ),
  ], debug: true);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });
    // TODO: implement initState
    super.initState();
  }

  createNotifications() {
    AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 10,
        channelKey: 'basic_channel',
        title: 'test Title',
        body:
            'its body its body its bodyits bodyits bodyits bodyits bodyits bodyits bodyits bodyits bodyits bodyits body',
        notificationLayout: NotificationLayout.BigText,

        // bigPicture: 'asset://lib/1.jpg',
        // notificationLayout: NotificationLayout.BigPicture,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: ElevatedButton(
            onPressed: createNotifications,
            child: Text('notify'),
          ),
        ),
      ),
    );
  }
}
