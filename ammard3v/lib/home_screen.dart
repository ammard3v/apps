import 'package:ammard3v/notifications_services.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  NotificationsServices notificationsServices = NotificationsServices();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    notificationsServices.isTokenRefresh();
    notificationsServices.requestNotificationsPermission();
    notificationsServices.getDeviceToken().then((value) {
      print('DeviCE token');
      print(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
