import 'package:flutter/material.dart';
import 'package:test/first_route.dart';

class SecondRoute extends StatelessWidget {
  const SecondRoute({super.key, required this.userData});

  final UserData userData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Secons page')),
      body: Center(
        child: Column(
          children: [
            Text('Username: ${userData.userID} UserId: ${userData.userName}'),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Back'),
            ),
          ],
        ),
      ),
    );
  }
}
