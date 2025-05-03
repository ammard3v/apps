import 'package:flutter/material.dart';

class Nextpage extends StatelessWidget {
  const Nextpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Hero(tag: 'lib/1.jpg', child: Image.asset('lib/1.jpg')),
    );
  }
}
