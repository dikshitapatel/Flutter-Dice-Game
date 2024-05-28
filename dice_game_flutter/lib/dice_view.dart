import 'package:flutter/material.dart';

class DiceView extends StatelessWidget {
  final int playerDiceTop;
  final int playerDiceBottom;
  final int computerDiceTop;
  final int computerDiceBottom;

  DiceView({
    Key? key,
    required this.playerDiceTop,
    required this.playerDiceBottom,
    required this.computerDiceTop,
    required this.computerDiceBottom,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Your Roll',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset('assets/dice$playerDiceTop.png', width: 100, height: 100),
            Image.asset('assets/dice$playerDiceBottom.png', width: 100, height: 100),
          ],
        ),
        SizedBox(height: 20),
        Text(
          'Computer Roll',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset('assets/dice$computerDiceTop.png', width: 100, height: 100),
            Image.asset('assets/dice$computerDiceBottom.png', width: 100, height: 100),
          ],
        ),
      ],
    );
  }
}
