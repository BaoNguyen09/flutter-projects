import 'package:flutter/material.dart';
import 'package:quiz_app/StartScreen.dart';
import 'package:quiz_app/question_screen/QuestionsScreen.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/result_screen/result_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  // Widget? activeScreen;
  var activeScreen = 'start-screen';
  List<String> selectedAnswer = [];
  
  // @override
  // void initState() { 
  //   super.initState();
  //   activeScreen = QuizUI(switchScreen);
    
  // }

  void switchScreen () {
    setState(() {
      activeScreen = 'question-screen';
    });
  }
  
  void chooseAnswer(String answer) {
    selectedAnswer.add(answer);

    if (selectedAnswer.length == questions.length) {
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }

  void reStart() {
    setState( () {
    selectedAnswer = [];
    activeScreen = 'question-screen';
    });
    
  }


  @override
  Widget build(context) {
    Widget SwitchScreen = QuizUI(switchScreen);
    if (activeScreen == 'question-screen') {
      SwitchScreen = QuestionScreen(onSelectedAnswer: chooseAnswer);
    }
    if (activeScreen == 'result-screen') {
      SwitchScreen = ResultScreen(chosenAnswer: selectedAnswer, reStart: reStart,);
    }
    // if (activeScreen == 'restart-quiz') {
    //   SwitchScreen = ResultScreen(reStart: reStart, chosenAnswer: selectedAnswer);
    // }
    

    return MaterialApp(
      home: Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 62, 3, 164),
                  Color.fromARGB(255, 71, 9, 239),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: SwitchScreen,
          )
        ),
      );
  }
}
