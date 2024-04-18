import 'package:flutter/material.dart';
class StyledText extends StatelessWidget {
  const StyledText(this.text, {super.key});
  // this.text is used instead of String text since
  // 'this' will auto find the variable with the same name
  // to assign the argument value to
  final String text;

  @ override
  Widget build(context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 20,
        color: Colors.amber,
      ),
    );
  }
}