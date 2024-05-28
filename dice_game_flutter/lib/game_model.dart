import 'dart:math';
import 'package:flutter/foundation.dart';

class GameModel extends ChangeNotifier {
  int playerDiceTop = 1;
  int playerDiceBottom = 1;
  int computerDiceTop = 1;
  int computerDiceBottom = 1;
  int money = 100;
  int playCount = 0;
  double betPercentage = 0.0;
  String alertTitle = '';
  String alertMessage = '';
  bool showAlert = false;

  Map<String, dynamic> rollDice() {
    final random = Random();
    playerDiceTop = random.nextInt(6) + 1;
    playerDiceBottom = random.nextInt(6) + 1;
    computerDiceTop = random.nextInt(6) + 1;
    computerDiceBottom = random.nextInt(6) + 1;
    playCount++;
    int betAmount = (money * betPercentage).toInt();
    int playerProduct = playerDiceTop * playerDiceBottom;
    int computerProduct = computerDiceTop * computerDiceBottom;
    bool playerWon = playerProduct > computerProduct;
    bool isTie = playerProduct == computerProduct;

    if (playerWon) {
      money += betAmount;
    } else if (!isTie) {
      money -= betAmount;
    }
    // No change in money if it's a tie

    // Notify all listeners about changes.
    notifyListeners();

    return {
        'won': playerWon,
        'tie': isTie,
        'amount': betAmount
    };
}


  void resetGame() {
    playerDiceTop = 1;
    playerDiceBottom = 1;
    computerDiceTop = 1;
    computerDiceBottom = 1;
    money = 100;
    playCount = 0;
    updateBetPercentage(0.0);
    alertTitle = 'Game Reset';
    alertMessage = 'The game has been reset.';
    showAlert = false;
    notifyListeners();
  }

  void closeAlert() {
    showAlert = false;
    notifyListeners();
  }


  void adjustMoney(int adjustment) {
    money += adjustment;
    notifyListeners();
  }

  void updateBetPercentage(double newPercentage) {
    betPercentage = newPercentage;
    notifyListeners();
  }
}
