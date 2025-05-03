import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:listjson/note.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future fetchNotes() async {
    var url =
        "https://raw.githubusercontent.com/sever-datast/30dysF/refs/heads/main/a.json";
   var notes=List<Note>();
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var notes=json.decode(response.body);
      for(var noteJson in notesJson){
        note.add(Note.fromJson(noteJson));
      }
      
    }
     
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Listview Json')),
        body: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('title', style: TextStyle(fontSize: 20)),
                    Text('sub-tittle', style: TextStyle(fontSize: 16)),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
