import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  final Map<String, dynamic> studentData;

  const Details({super.key, required this.studentData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details of ${studentData['roll_number']}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Display Roll Number
              Text(
                'Roll Number: ${studentData['roll_number']}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),

              // Loop through each semester dynamically
              ...studentData.keys
                  .where((key) => key.startsWith('sem'))
                  .map((semesterKey) {
                return _buildSemesterDropdown(
                    semesterKey, studentData[semesterKey]);
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }

  // Helper function to build semester dropdown
  Widget _buildSemesterDropdown(
      String semester, Map<String, dynamic> semesterData) {
    return ExpansionTile(
      title: Text(
        semester.toUpperCase(),
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ...semesterData.entries.map((entry) {
                return _buildSubjectCard(entry.key, entry.value ?? 'N/A');
              }).toList(),
            ],
          ),
        ),
      ],
    );
  }

  // Helper function to build a subject card
  Widget _buildSubjectCard(String subject, String grade) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                subject,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              Text(
                grade,
                style: TextStyle(fontSize: 16, color: Colors.green),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
