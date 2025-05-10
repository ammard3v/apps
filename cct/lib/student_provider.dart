import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class StudentProvider with ChangeNotifier {
  List<dynamic> _students = [];

  List<dynamic> get students => _students;

  // Fetch data from the API
  Future<void> fetchStudents() async {
    final response = await http.get(Uri.parse(
        'https://raw.githubusercontent.com/sever-datast/result/refs/heads/main/combined_results.json'));

    if (response.statusCode == 200) {
      _students = jsonDecode(response.body);
      notifyListeners();
    } else {
      throw Exception('Failed to load student data');
    }
  }
}
