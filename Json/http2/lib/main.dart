import 'package:flutter/material.dart';
import 'package:http2/model/post_model.dart';
import 'package:http2/services/api_services.dart';

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
      home: Scaffold(
        body: FutureBuilder(
          future: getPosts(),
          builder: (context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            } else {
              List<Product> product = snapshot.data;
              return ListView.builder(
                itemCount: product.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Text(product[index].id.toString()),
                    title: Text(product[index].title),
                    subtitle: Row(
                      children: [
                        Expanded(child: Text(product[index].description)),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(product[index].price.toString()),
                        ),
                      ],
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
