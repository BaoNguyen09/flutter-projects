import 'package:flutter/material.dart';
import 'package:roll_dice/styled_text.dart';
import 'package:roll_dice/roll_dice.dart';
var startAlignment = Alignment.center;
var endAlignment = Alignment.bottomCenter;



class GradientColoring extends StatelessWidget {
  const GradientColoring(this.firstcolor, this.secondcolor, {super.key}); // constructor function
  // GradientColoring({key}): super(key: key); // full version
  // used to forward the 'key' argument to parent class StatelessWidget
  
  const GradientColoring.black({super.key})
      : firstcolor = Colors.black12,
        secondcolor = Colors.red;

  final Color firstcolor;
  final Color secondcolor;
  @override
  Widget build(context) {
    
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            firstcolor,
            secondcolor,
          ],
          begin: startAlignment,
          end: endAlignment,
        )
      ),
      child: const Center(
        child: RollDice()
      )
    );
  }
}

class GradientColoring2 extends StatelessWidget {
  const GradientColoring2({super.key, required this.color}); // constructor function
  
  //const GradientColoring2.black({super.key, required, required this.color [Colors.black12,Colors.red]});

  final List<Color> color;

  @override
  Widget build(context) {
    
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: color,
          begin: startAlignment,
          end: endAlignment,
        )
      ),
      child: const Center(
        child: StyledText('Day 3.0'),
      )
    );
  }
}