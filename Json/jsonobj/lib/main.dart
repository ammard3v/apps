import 'package:flutter/material.dart';
import 'package:jsonobj/notifier.dart';

void main() {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Home());
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            NotiService().showNotifictaion(title: 'Hello', body: 'oko ok');
          },
          child: Text('Click for notifn'),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:jsonobj/home.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(home: Home());
//   }
// }
