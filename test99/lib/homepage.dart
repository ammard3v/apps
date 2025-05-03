import 'package:flutter/material.dart';
import 'package:test99/nextpage.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('home')),

      body: IconButton(
        onPressed: () {
          Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (ctx) => Nextpage()));
        },
        icon: Hero(tag: 'lib/1.jpg', child: Image.asset('lib/1.jpg')),
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.verified),
        onPressed: () {
          // setState(() {
          //   _counter++;
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
      drawer: Drawer(),
    );
  }
}
