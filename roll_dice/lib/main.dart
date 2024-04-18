import 'package:flutter/material.dart';
import 'package:roll_dice/gradient_container.dart';
void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: GradientColoring(
            Colors.amber, 
            Colors.transparent,
        ),
      ),
    ),
  );
}

