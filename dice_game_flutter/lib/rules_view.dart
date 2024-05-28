import 'package:flutter/material.dart';

class RulesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(240, 255, 255, 0.95), // Light blue background
      appBar: AppBar(
        title: Text("Game Rules"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),      
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 20),
            _buildRuleText('1. The game features four dice: two for the player and two for the computer.'),
            _buildRuleText('2. Each dice roll results in a random number between 1 and 6.'),
            _buildRuleText('3. Players must choose a wager, expressed as a percentage of their current token balance, before playing.'),
            _buildRuleText('4. The wager cannot exceed the player\'s current token balance.'),
            _buildRuleText('5. The product of the player\'s dice is compared with the product of the computer\'s dice to determine the outcome.'),
            _buildRuleText('6. If the player\'s product is greater, the player wins and their token balance increases by the wagered amount.'),
            _buildRuleText('7. If the computer\'s product is greater, the player loses and their token balance decreases by the wagered amount.'),
            _buildRuleText('8. A tie occurs if both products are equal, resulting in no change to the player\'s token balance.'),
            _buildRuleText('9. The game alerts the player if their token balance reaches zero, suggesting they add more tokens or reset the game.'),
            SizedBox(height: 20),
            Center(
              child: Text(
                'Enjoy the game, and may the odds be ever in your favor!',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.red),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRuleText(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        text,
        style: TextStyle(fontSize: 16, color: Colors.blue),
      ),
    );
  }
}
