import 'package:cct/student_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'details.dart'; // The details page

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Fetch students' data when the app starts
    Future.microtask(() =>
        Provider.of<StudentProvider>(context, listen: false).fetchStudents());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Results'),
      ),
      body: Consumer<StudentProvider>(
        builder: (context, studentProvider, child) {
          List<dynamic> students = studentProvider.students;
          String query = searchController.text.toLowerCase();

          // Apply filtering if text is entered
          List<dynamic> filtered = query.isEmpty
              ? students
              : students.where((student) {
                  String rollNumber = student['roll_number'].toLowerCase();
                  return rollNumber.contains(query);
                }).toList();

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: searchController,
                  onChanged: (value) {
                    setState(() {});
                  },
                  decoration: InputDecoration(
                    hintText: 'Search Roll Number',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: filtered.length,
                  itemBuilder: (context, index) {
                    var student = filtered[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  Details(studentData: student),
                            ),
                          );
                        },
                        child: Card(
                          child: Container(
                            height: 80,
                            child: Center(
                              child: Text(
                                student['roll_number'],
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
