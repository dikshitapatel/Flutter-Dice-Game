import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dice_view.dart';
import 'rules_view.dart';
import 'author_view.dart';
import 'game_model.dart';
import 'package:universal_io/io.dart' show Platform;

class GameView extends StatefulWidget {
  @override
  _GameViewState createState() => _GameViewState();
}
// Defines a private state class for GameView widget, handling its state management in Flutter.
class _GameViewState extends State<GameView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(239, 218, 231, 0.937), // Light blue background
      appBar: AppBar(title: Text("Dice Game")),
      body: Consumer<GameModel>(
        builder: (context, gameModel, _) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  _buildHeader(),
                  SizedBox(height: 20),
                  _buildTokensAndRoundsInfo(gameModel),
                  SizedBox(height: 20),
                  DiceView(
                    playerDiceTop: gameModel.playerDiceTop,
                    playerDiceBottom: gameModel.playerDiceBottom,
                    computerDiceTop: gameModel.computerDiceTop,
                    computerDiceBottom: gameModel.computerDiceBottom,
                  ),
                  SizedBox(height: 20),
                  _buildAdjustMoneyButtons(gameModel),
                  _buildBetSlider(gameModel),
                  _buildPlayResetButtons(context, gameModel),
                  _buildRulesAuthorButtons(context),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  // A method to build the header widget of the app
  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Welcome to the Dice Game!',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        // SizedBox(width: 10),
        Image.asset('assets/icon.png', width: 30, height: 30),
      ],
    );
  }

// A method to build widgets displaying tokens and rounds information.
  Widget _buildTokensAndRoundsInfo(GameModel gameModel) {
    return Column(
      children: [
        Text('Tokens: \$${gameModel.money}', style: TextStyle(fontSize: 18)),
        SizedBox(height: 5),
        Text('Rounds Played: ${gameModel.playCount}', style: TextStyle(fontSize: 18)),
      ],
    );
  }

// A method to build widgets adjusting money tokens.
  Widget _buildAdjustMoneyButtons(GameModel gameModel) {
  return Column(
    mainAxisSize: MainAxisSize.min, // To keep the column tight around its children
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0), // Add some space around the text
        child: Text(
          'Add money to your total tokens',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: Icon(Icons.remove_circle_outline),
            onPressed: () => gameModel.adjustMoney(-10),
          ),
          Text(
            '\$10',
            style: TextStyle(fontSize: 18),
          ),
          IconButton(
            icon: Icon(Icons.add_circle_outline),
            onPressed: () => gameModel.adjustMoney(10),
          ),
        ],
      ),
    ],
  );
}


  Widget _buildBetSlider(GameModel gameModel) {
    return Column(
      children: [
        Slider(
          value: gameModel.betPercentage,
          onChanged: (newPercentage) {
            setState(() {
              gameModel.updateBetPercentage(newPercentage);
            });
          },
          min: 0,
          max: 1,
        ),
        Text(
          'Bet Percentage: ${(gameModel.betPercentage * 100).toStringAsFixed(0)}%',
          style: TextStyle(fontSize: 18),
        ),
      ],
    );
  }

  
// A method to build widgets for bet slider.
Widget _buildPlayResetButtons(BuildContext context, GameModel gameModel) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      SizedBox(
        width: 150, 
        child: ElevatedButton(
          onPressed: () {
            if (gameModel.money == 0) {
              showPlatformDialog(context, "No More Tokens", "You have run out of tokens. Please reset the game or add more tokens to continue playing.");
            } else {
              // Proceed to roll dice and show the result immediately
          var result = gameModel.rollDice();
          String title;
          String message;

          if (result['tie']) {
            title = "It's a Tie!";
            message = "Both you and the computer have the same roll total.";
          } else {
            title = result['won'] ? "You Win!" : "You Lose!";
            message = result['won'] ? "Your roll is higher by ${result['amount']}." : "Computer roll is higher by ${result['amount']} tokens.";
          }

          showPlatformDialog(context, title, message);
  }
          },
          child: Text('Roll Dice'),
        ),
      ),
      SizedBox(
        width: 150, 
        child: ElevatedButton(
          onPressed: () => showResetGameDialog(context, gameModel),
          child: Text('Reset Game'),
        ),
      ),
    ],
  );
}
// A method to build widgets to display Rules & Authors button.
Widget _buildRulesAuthorButtons(BuildContext context) {
  return Padding(
    padding: EdgeInsets.only(top: 20.0), 
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          width: 150, 
          child: ElevatedButton(
            child: Text('Rules'),
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => RulesView())),
          ),
        ),
        SizedBox(
          width: 150, 
          child: ElevatedButton(
            child: Text('Author'),
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => AuthorView())),
          ),
        ),
      ],
    ),
  );
}

  // A method to build widgets to reset the game.
  void showResetGameDialog(BuildContext context, GameModel gameModel) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Reset Game'),
        content: Text('Are you sure you want to reset the game?'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Dismiss the dialog
            },
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              gameModel.resetGame(); // Reset the game
              Navigator.of(context).pop(); // Dismiss the dialog
            },
            child: Text('Yes'),
          ),
        ],
      );
    },
  );
}

// A method to generate alerts for android and web and cupertino alerts for IOS.
void showPlatformDialog(BuildContext context, String title, String message) {
  if (Platform.isIOS) {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Text(title),
        content: Text(message),
        actions: <Widget>[
          CupertinoDialogAction(
            child: Text('OK'),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  } else {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            child: Text('OK'),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }
}
}
