import 'dart:convert';
import 'package:apitut/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Test1 extends StatefulWidget {
  const Test1({super.key});

  @override
  State<Test1> createState() => _Test1State();
}

class _Test1State extends State<Test1> {
  List<UserModel> userList = [];
  Future<List<UserModel>> getUserApi() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map<String, dynamic> i in data) {
        userList.add(UserModel.fromMap(i));
      }
      return userList;
    }
    return userList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Test1'),
        ),
        body: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                  future: getUserApi(),
                  builder: (context, AsyncSnapshot<List<UserModel>> snapshot) {
                    if (!snapshot.hasData) {
                      return CircularProgressIndicator();
                    } else {
                      return ListView.builder(
                          itemCount: userList.length,
                          itemBuilder: (context, index) {
                            return Card(
                              child: Column(
                                children: [
                                  ResuableRow(
                                    value: snapshot.data![index].name,
                                    title: 'Name',
                                  ),
                                  ResuableRow(
                                    value: snapshot.data![index].username,
                                    title: 'Username',
                                  ),
                                  ResuableRow(
                                    value: snapshot.data![index].email,
                                    title: 'Email',
                                  ),
                                  ResuableRow(
                                    value: snapshot.data![index].address.city +
                                        snapshot.data![index].address.suite,
                                    title: 'Address',
                                  ),
                                ],
                              ),
                            );
                          });
                    }
                  }),
            )
          ],
        ));
  }
}

class ResuableRow extends StatelessWidget {
  const ResuableRow({super.key, required this.title, required this.value});

  final String title, value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text(value),
        ],
      ),
    );
  }
}
