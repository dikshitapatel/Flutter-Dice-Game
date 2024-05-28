# Dice Game - Flutter App

## Overview

Welcome to the Dice Game! This game is a simple yet engaging Flutter app where players compete against the computer by rolling dice and wagering tokens. The rules are straightforward, and the gameplay is quick and fun. This README will guide you through the game's rules, how to navigate the app, and how to enjoy the game to its fullest.

## Game Rules

1. **Dice Setup**: The game features four dice in total - two for the player and two for the computer.
2. **Rolling Dice**: Each dice roll results in a random number between 1 and 6.
3. **Placing a Wager**: Players must choose a wager, expressed as a percentage of their current token balance, before playing.
4. **Wager Limit**: The wager cannot exceed the player's current token balance.
5. **Determining Outcome**:
    - The product of the player's dice is compared with the product of the computer's dice.
    - If the player's product is greater, the player wins and their token balance increases by the wagered amount.
    - If the computer's product is greater, the player loses and their token balance decreases by the wagered amount.
    - A tie occurs if both products are equal, resulting in no change to the player's token balance.
6. **Token Balance**: The game alerts the player if their token balance reaches zero, suggesting they add more tokens or reset the game.

## User Interface

### Main Screen
- The main screen displays the current token balance and provides options to roll the dice and place a wager.

### Rules Screen
- The rules screen outlines the game rules in a clear and concise manner. It can be accessed from the main screen and features a light blue background for a calming visual experience.

### AppBar
- The AppBar at the top of the screen contains the title "Game Rules" and a back arrow icon for easy navigation back to the main screen.

### Dice Roll Results
- After placing a wager and rolling the dice, the results are displayed on the screen, showing the numbers rolled by both the player and the computer.

### Wagering
- Before rolling the dice, players must enter the percentage of their token balance they wish to wager. The app ensures that the wager does not exceed the current token balance.

## How to Play

1. **Start the Game**: Open the app and navigate to the main screen.
2. **Place a Wager**: Enter the percentage of your token balance you wish to wager.
3. **Roll the Dice**: Tap the button to roll your dice and see the result.
4. **Check Results**: The game will display the products of the dice rolls for both you and the computer, and your token balance will be updated accordingly.
5. **Continue Playing**: Keep playing until your token balance runs out or you decide to stop.
6. **Zero Balance Alert**: If your token balance reaches zero, the game will prompt you to add more tokens or reset the game.

