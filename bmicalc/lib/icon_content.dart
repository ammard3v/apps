import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {
  const IconContent({
    super.key,
    required this.icon,
    required this.label,
  });
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80.0,
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          label,
          style: TextStyle(color: Colors.grey, fontSize: 20),
        )
      ],
    );
  }
}
