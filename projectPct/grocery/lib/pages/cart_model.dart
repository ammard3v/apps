import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  final List _shopItems = [
    ['Avacoda', '4.00', 'lib/images/1.png', Colors.green],
    ['Banana', '1.00', 'lib/images/2.png', Colors.yellow],
    ['Milk', '2.00', 'lib/images/3.png', Colors.grey],
  ];

  get shopItems=>_shopItems;
}
