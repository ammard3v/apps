import 'package:http/http.dart' as http;
import 'package:http2/model/post_model.dart';

var base = "https://www.dummyjson.com";
Future getPosts() async {
  Uri url = Uri.parse('https://dummyjson.com/products');
  var res = await http.get(url);

  try {
    if (res.statusCode == 200) {
      print("Data fetched successfully: ${res.body}"); // Debugging print
      var data = postsModelFromJson(res.body); // Decoding JSON
      return data.products; // Return products from the API
    } else {
      print('Failed to load data: ${res.statusCode}');
      throw Exception('Failed to load products');
    }
  } catch (e) {
    print("Error: $e");
    throw Exception("Error: $e");
  }
}
