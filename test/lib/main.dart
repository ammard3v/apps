import 'package:flutter/material.dart';
import 'package:test/first_route.dart';
import 'package:test/second_route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      // routes: {
      //   '/': (context) => FirstRoute(),
      //   '/secondRoute': (context) => SecondRoute(),
      // },
      onGenerateRoute: (settings) {
        final arg = settings.arguments;
        if (settings.name == '/') {
          return MaterialPageRoute(builder: (context) => FirstRoute());
        } else if (settings.name == '/secondRoute') {
          if (arg is UserData) {
            return MaterialPageRoute(
              builder: (context) => SecondRoute(userData: arg),
            );
          }
        } else {
          return MaterialPageRoute(
            builder: (_) => Scaffold(body: Text('error')),
          );
        }
      },
    );
    // home: FirstRoute());
  }
}
