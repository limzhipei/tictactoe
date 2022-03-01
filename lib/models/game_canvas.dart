import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/game_mechanism.dart';

import 'package:tic_tac_toe/models/constants.dart';

class GameCanvas extends StatefulWidget {

  @override
  _GameCanvasState createState() => _GameCanvasState();
}

class _GameCanvasState extends State<GameCanvas> {

  String dialogTitle = '';

  void _onGameEnd(int winner) {
    switch(winner) {
      case 0:
        dialogTitle = 'You Win!';
        break;
      case 1:
        dialogTitle = 'You Lose!';
        break;
      case 2:
        dialogTitle = 'It\'s a draw!';
        break;
    }
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(dialogTitle),
          actions: <Widget>[
            TextButton(
              child: Text('Play Again'),
              onPressed: () {
                Provider.of<GameMechanism>(context, listen: false).restartGame();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 50.0,
          vertical: 20.0,
        ),
        child: GridView.builder(
          itemCount: 9,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () async {
                if (kGameOn && Provider.of<GameMechanism>(context, listen: false).kYourTurn) {
                  setState(() {
                    Provider.of<GameMechanism>(context, listen: false).movePlayed(index);
                  });
                  if (kGameOn == false) {
                    _onGameEnd(Provider
                        .of<GameMechanism>(context, listen: false)
                        .kWinner!);
                    return;
                  }
                  Future.delayed(const Duration(milliseconds: 2050), ()
                  {
                    if (kGameOn == false) {
                      _onGameEnd(Provider
                          .of<GameMechanism>(context, listen: false)
                          .kWinner!);
                    }
                  });
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    style: BorderStyle.solid,
                    width: 5,
                  ),
                ),
                child: FittedBox(
                  child: kDisplayIcon[Provider.of<GameMechanism>(context).kDisplayKey[index]],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

