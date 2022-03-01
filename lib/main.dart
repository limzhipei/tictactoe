import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/models/constants.dart';
import 'package:tic_tac_toe/screens/gameplay_screen.dart';
import 'package:tic_tac_toe/screens/main_screen.dart';
import 'package:tic_tac_toe/screens/settings_screen.dart';
import 'package:tic_tac_toe/screens/setup_screen.dart';
import 'package:tic_tac_toe/game_mechanism.dart';

void main() => runApp(TicTacToeApp());

class TicTacToeApp extends StatelessWidget {

  GameMechanism gameMechanism = GameMechanism();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<GameMechanism>(
      create: (context) => gameMechanism,
      child: MaterialApp(
        title: 'Tic Tac Toe',
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        initialRoute: kMainScreen,
        routes: {
          kMainScreen: (context) => MainScreen(),
          kGamePlayScreen: (context) => GameplayScreen(),
          kSettingsScreen: (context) => SettingsScreen(),
          kSetupScreen: (context) => SetupScreen(),
        },
      ),
    );
  }
}
