import 'package:bmicalc/input_page.dart';

import 'package:flutter/material.dart';

const bottomContainerHeight = 80.0;
const activeCardColor = Colors.purple;
const inactiveCardColor = Colors.purple;
const bottomContainerColor = Color(0xFFEB1555);

void main() {
  runApp(BMICalculator());
}

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Color(0xFF0A0E21),
          appBarTheme: AppBarTheme(
            backgroundColor: Color(0xFF0A0E21),
            titleTextStyle: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          textTheme: TextTheme(
            bodyLarge: TextStyle(color: Colors.white),
            bodyMedium: TextStyle(color: Colors.white),
            titleLarge: TextStyle(color: Colors.white),
          )),
      home: InputPage(),
    );
  }
}
