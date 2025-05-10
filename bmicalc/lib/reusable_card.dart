import 'package:flutter/material.dart';

class ReuseableCard extends StatelessWidget {
  final Color color;
  final Widget? cardChild;
  final VoidCallback? onPress;

  const ReuseableCard({
    required this.color,
    this.cardChild,
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: cardChild,
      ),
    );
  }
}
