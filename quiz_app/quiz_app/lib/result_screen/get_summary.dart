import 'package:flutter/material.dart';
import 'package:quiz_app/result_screen/question_index.dart';

class GetSummary extends StatelessWidget {
  const GetSummary(this.summary_data, {super.key});
  final List<Map<String, Object>> summary_data;
  
  @override 
  Widget build(context) {
    
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summary_data.map( (data) {
            bool answerColor = true;
            if (data['chosen_answer'].toString() != data['answer'].toString()) {
              answerColor = false;
            }
            return Row(
              children: [
                QuestionIndex(
                  answerColor: answerColor, 
                  index: ((data['question_index'] as int) + 1).toString()
                  ),
                const SizedBox(width: 20,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data['question'].toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                        ),
                      Text(
                        data['answer'].toString(),
                        style: const TextStyle(
                          color: Color.fromARGB(255, 110, 166, 230),
                          fontSize: 12,
                        ),
                        ),
                      Text(
                        data['chosen_answer'].toString(),
                        style: TextStyle(
                          color: answerColor
                            ? const Color.fromARGB(255, 110, 166, 230)
                            : const Color.fromARGB(255, 189, 52, 180),
                          fontSize: 12,
                        ),
                        ),
                  ],),
                )
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}