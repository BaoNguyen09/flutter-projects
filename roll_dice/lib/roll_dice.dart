import 'package:flutter/material.dart';
import 'dart:math';
final randomize = Random();

class RollDice extends StatefulWidget{
  const RollDice({super.key});

  @override
  State<RollDice> createState() => _RollDice();
  
}

class _RollDice extends State<RollDice> {
  var currDiceRoll = 2; 

  void rollDice() {
    setState( () {
      currDiceRoll = randomize.nextInt(6) + 1;


    });
  
}
  @override
  Widget build(context) {
    return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/dice-$currDiceRoll.png',
              width: currDiceRoll*50,
            ),
            const SizedBox(height: 50),
            TextButton(
              onPressed: rollDice,
              style: TextButton.styleFrom(
                padding: const EdgeInsets.only(
                  top: 20,
                ) ,
                foregroundColor: Colors.white,
                backgroundColor: Colors.black26,
                textStyle: const TextStyle(
                  fontSize: 28,
                )
              ),
              child: const Text('Roll Dice')),
          ]
        );
  }
}
  