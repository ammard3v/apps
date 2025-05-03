import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _data = '';
  Future<void> fecthData() async {
    var url = Uri.parse(
      "https://raw.githubusercontent.com/sever-datast/CCT-repo/refs/heads/main/jsonFile.json",
    );
    var responnse = await http.get(url);
    if (responnse.statusCode == 200) {
      setState(() {
        _data = responnse.body;
      });
    } else {
      print('failed');
      setState(() {
        _data = 'Failed';
      });
    }
  }

  Future<void> createData() async {
    var url = Uri.parse("https://jsonplaceholder.typicode.com//posts");
    var responnse = await http.post(
      url,
      body: {
        "userid": "3",
        "id": "101",
        "title": "e3c4  4tr4rer",
        "body": "rd44r4rc4r4  4 trrf4f r",
      },
    );
    if (responnse.statusCode == 200 || responnse.statusCode == 201) {
      setState(() {
        _data = 'Dta created successfully" :${responnse.body}';
      });
    } else {
      setState(() {
        _data = 'Failed';
      });
    }
  }

  Future<void> deleteData() async {
    var url = Uri.parse("https://jsonplaceholder.typicode.com//posts/1");
    var responnse = await http.delete(url);
    if (responnse.statusCode == 200 || responnse.statusCode == 201) {
      setState(() {
        _data = 'Dta deleted successfully" :${responnse.body}';
      });
    } else {
      setState(() {
        _data = 'Failed';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('HomePage')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const SizedBox(height: 20),
                ElevatedButton(onPressed: fecthData, child: Text('Fetch Data')),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: createData,
                  child: Text('Create Data'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: deleteData,
                  child: Text('Delete Data'),
                ),
                const SizedBox(height: 20),
              ],
            ),
            Expanded(child: SingleChildScrollView(child: Text(_data))),
          ],
        ),
      ),
    );
  }
}
