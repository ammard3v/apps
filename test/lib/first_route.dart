import 'package:flutter/material.dart';

class UserData {
  final String userName;
  final String userID;
  UserData(this.userName, this.userID);
}

class FirstRoute extends StatelessWidget {
  const FirstRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('first page')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(
              context,
              '/secondRoute',
              arguments: UserData('ammar', 'ok'),
            );
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (ctx) => SecondRoute()),
            // );
          },
          child: Text('Go to'),
        ),
      ),
    );
  }
}
