import 'package:flutter/material.dart';
import 'package:quiz/data/questions.dart';
import 'package:quiz/quetsions_sumamry.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.choosenAnswer});

  final List<String> choosenAnswer;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < choosenAnswer.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': choosenAnswer[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numTotalAnswers =
        summaryData.where((data) {
          return data['user_answer'] == data['correct_answer'];
        }).length;

    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'You answered $numTotalAnswers out of  $numTotalQuestions quetsions',
              ),
              const SizedBox(height: 10),
              QuetsionsSumamry(summaryData: summaryData),
              const SizedBox(height: 30),
              ElevatedButton(onPressed: () {}, child: Text('Restart')),
            ],
          ),
        ),
      ),
    );
  }
}
