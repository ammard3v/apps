import 'package:cct/student_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home.dart'; // The main page widget

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => StudentProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Result',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}
