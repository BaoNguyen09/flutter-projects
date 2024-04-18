import 'package:flutter/material.dart';
import 'dart:math';

final randomizer = Random();


class RollPic extends StatefulWidget {
  const RollPic({super.key});
  
  @override
  State<RollPic> createState() => _RollPic();
  
}

class _RollPic extends State<RollPic> {
  void rollPic() {
    setState( () {
      imageRoll = 1 + randomizer.nextInt(13);
    });
  }
  var imageRoll = 3;
  
  @override
  Widget build(context) {
    
    return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/pic$imageRoll.jpg',
                //width: 300,
                height: 500,
              ),
              const SizedBox(height: 30),
              TextButton(
                onPressed: rollPic,  
                child: const Text(
                  "Roll Pic",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                  ),),
              ),
            ],
          );
  }
}