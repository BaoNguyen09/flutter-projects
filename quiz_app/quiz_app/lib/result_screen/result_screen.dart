import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/result_screen/get_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen ({
    super.key,
    required this.chosenAnswer,
    required this.reStart,
  });
  final List<String> chosenAnswer;
  final void Function() reStart;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> result = [];
    for (var i=0; i < chosenAnswer.length; i++) {
      result.add({
        'question_index': i,
        'question': questions[i].text,
        'answer': questions[i].answers[0],
        'chosen_answer': chosenAnswer[i],
      });
    }
    return result;
  }
  @override
  Widget build(context) {
    final List<Map<String, Object>> summary = getSummaryData();
    final totalQuestions = questions.length;
    var correctAnswers = summary.where((data) {
      return data['answer'] == data['chosen_answer'];
    }).length;
    

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(60),
        child: Column( 
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $correctAnswers out of $totalQuestions correctly',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
              textAlign: TextAlign.center,
              ),
            const SizedBox(height: 20),
            GetSummary(summary),
            const SizedBox(height: 25),
            TextButton.icon(
              onPressed: reStart, 
              label: const Text('Restart Quiz', style: TextStyle(color: Colors.white),),
              icon: const Icon(
                    Icons.refresh, 
                    color: Colors.white,
                  ),
              ),
        ],),
      ),
    );
  }
}