import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.all(1),
            child: ListView.separated(
              separatorBuilder: (context, index) {
                return Divider(color: Colors.black);
              },
              itemCount: 4,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(child: Text('L')),
                  title: Text('Title'),
                  subtitle: Text('SubTitle'),
                  trailing: Text('Trail'),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
