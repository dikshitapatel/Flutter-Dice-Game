import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'game_model.dart';
import 'game_view.dart'; 

void main() {
  runApp(MyApp());
}

// MyApp class which is a StatelessWidget. This is the root widget of your application.

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<GameModel>(
      create: (_) => GameModel(),
      child: MaterialApp(
        // Setting the title of the application, displayed in the task switcher.
        title: 'Dice Game',
        // Defining the home page of the app by calling GameView widget.
        // This is the first screen displayed when the app is launched.
        home: GameView(),
      ),
    );
  }
}
