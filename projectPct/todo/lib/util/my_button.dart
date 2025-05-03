import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({super.key, required this.buttonClicked, required this.text});

  final VoidCallback buttonClicked;
  final String text;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: buttonClicked,
      color: Colors.amber[200],
      child: Text(text),
    );
  }
}
