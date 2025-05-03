import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double boxX = -0.9; // Start near the top-left
  double boxY = -0.9; // Start near the top-left

  void expandBox() {
    setState(() {
      boxX = 0; // Move to the center horizontally
      boxY = 0; // Move to the center vertically
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: expandBox, // Trigger the move when tapped
        child: AnimatedContainer(
          duration: Duration(seconds: 2), // Smooth animation
          alignment: Alignment(boxX, boxY), // Move box to new position
          color: Colors.deepPurpleAccent,
          padding: EdgeInsets.all(12),
          height: 100,
          width: 100,
        ),
      ),
    );
  }
}
