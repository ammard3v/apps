import 'package:flutter/material.dart';
import 'package:jsonobj/name_model.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<NamesModel> names = [
    NamesModel(
      name: 'Ammar',
      age: 12,
      profession: 'dr',
      details: Details(fatherName: ''),
    ),
    NamesModel(name: 'awe', age: 42, profession: 'Ar'),
    NamesModel(name: 'a4rr', age: 12, profession: 'eee'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Models')),
      body: ListView.builder(
        itemCount: names.length,
        itemBuilder: (context, index) {
          if (names[index].details.toString() == 'null') {
            return ListTile(
              title: Text(names[index].name.toString()),
              // subtitle: Text(names[index].age.toString()),
              subtitle: Text(names[index].age.toString()),

              trailing: IconButton(
                onPressed: () {
                  names.removeAt(index);
                  setState(() {});
                },
                icon: Icon(Icons.delete),
              ),
            );
          }
          return ListTile(
            title: Text(names[index].name.toString()),
            // subtitle: Text(names[index].age.toString()),
            subtitle: Text(names[index].details!.fatherName.toString()),
            trailing: IconButton(
              onPressed: () {
                names.removeAt(index);
                setState(() {});
              },
              icon: Icon(Icons.delete),
            ),
          );
        },
      ),
    );
  }
}
