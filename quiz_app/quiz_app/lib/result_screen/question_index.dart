import 'package:flutter/material.dart';


class QuestionIndex extends StatelessWidget {
  const QuestionIndex({
    super.key,
    required this.answerColor,
    required this.index,
  });
  final bool answerColor;
  final String index;
  @override
  Widget build(context) {
    return Container(
      height: 30,
      width: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: answerColor
             ?const Color.fromARGB(255, 110, 166, 230)
             :const Color.fromARGB(255, 189, 52, 180),
        borderRadius: BorderRadius.circular(100),
      ),
      
      child: Text(
        index,
      ),
    );
  }
}