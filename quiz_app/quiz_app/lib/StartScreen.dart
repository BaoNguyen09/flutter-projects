// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';


class QuizUI extends StatefulWidget {
  const QuizUI(this.startQuiz, {super.key});
  final void Function() startQuiz;

  @override
  State<QuizUI> createState() {
    return _QuizUIState();
  } 
}

class _QuizUIState extends State<QuizUI> {


  
  @override
  Widget build(context) {
    return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                    'assets/images/quiz-logo.png',
                    height: 300,
                    color: const Color.fromARGB(150, 255, 255, 255),
                ),
                // Opacity(
                //   opacity: 0.6,
                //   child: Image.asset(
                //     'assets/images/quiz-logo.png',
                //     height: 300,
                //   ),
                // ),
                const SizedBox(height: 100),
                const Text(
                  'Learn Flutter the fun way!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                  ),
                ),
                const SizedBox(height: 30),
                OutlinedButton.icon(
                  onPressed: widget.startQuiz,
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.white10,
                  ),
                  icon: const Icon(
                    Icons.arrow_forward_ios_sharp, 
                    color: Colors.cyan,
                  ),
                  label: const Text('Start Quiz', style: TextStyle(color: Colors.white), ),
                )
              ],
            ),
          );
  }
}