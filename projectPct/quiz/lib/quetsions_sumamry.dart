import 'package:flutter/material.dart';

class QuetsionsSumamry extends StatelessWidget {
  const QuetsionsSumamry({super.key, required this.summaryData});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children:
          summaryData.map((data) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(((data['question_index'] as int) + 1).toString()),
                const SizedBox(width: 15),
                Expanded(
                  child: Column(
                    children: [
                      Text(data['question'] as String),
                      Text(
                        data['correct_answer'] as String,
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(data['user_answer'] as String),
                    ],
                  ),
                ),
              ],
            );
          }).toList(),
    );
  }
}
