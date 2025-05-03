import 'package:flutter/material.dart';

class GroceryItemTile extends StatelessWidget {
  const GroceryItemTile({
    super.key,
    required this.itemName,
    required this.itemPrice,
    required this.itemPath,
    required this.color,
  });

  final String itemName;
  final String itemPrice;
  final String itemPath;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
