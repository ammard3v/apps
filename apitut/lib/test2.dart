import 'dart:convert';
import 'package:apitut/models/products_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Test2 extends StatefulWidget {
  const Test2({super.key});

  @override
  State<Test2> createState() => _Test2State();
}

class _Test2State extends State<Test2> {
  Future<ProductsModel> getProductsApi() async {
    final response = await http.get(
        Uri.parse('https://webhook.site/2e62987e-cc28-45fc-b2d9-e9a0a7c0786e'));

    if (response.statusCode == 200) {
      // Decode the response body into a Map<String, dynamic> and pass it to ProductsModel
      var data = jsonDecode(response.body);
      return ProductsModel.fromJson(data);
    } else {
      throw Exception('Failed to load products');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Test2'),
        ),
        body: Column(
          children: [
            Expanded(
              child: FutureBuilder<ProductsModel>(
                  future: getProductsApi(),
                  builder: (builder, snapshot) {
                    // Handle error state
                    if (snapshot.hasError) {
                      print(snapshot.error);
                      return Center(child: Text('Error: ${snapshot.error}'));
                    }

                    // Show loading indicator while waiting for the data
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }

                    // Handle if there's no data
                    if (!snapshot.hasData) {
                      return Center(child: Text('No data available.'));
                    } else {
                      // Show the data
                      var products = snapshot.data!.data;
                      return ListView.builder(
                        itemCount: products.length,
                        itemBuilder: (context, index) {
                          var product = products[index];
                          return Column(
                            children: [
                              Text('Product ${index + 1}: ${product.title}'),
                              Text('Price: \$${product.price.toString()}'),
                            ],
                          );
                        },
                      );
                    }
                  }),
            ),
          ],
        ));
  }
}
