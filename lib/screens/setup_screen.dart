import 'package:flutter/material.dart';
import 'package:tic_tac_toe/game_mechanism.dart';
import 'package:tic_tac_toe/models/constants.dart';

class SetupScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'SETUP',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          vertical: 150.0,
          horizontal: 80.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Choose your shape',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: Colors.deepOrangeAccent,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 30.0,
            ),
            ElevatedButton(
              child: Container(
                height: 80.0,
                child: FittedBox(
                  child: kCircleIcon,
                ),
              ),
              onPressed: () {
                kUserShape = kCircleIcon;
                kDisplayIcon['user'] = kUserShape;
                Navigator.pop(context);
                Navigator.pushNamed(context, kGamePlayScreen);
              },
            ),
            ElevatedButton(
              child: Container(
                height: 80.0,
                child: FittedBox(
                  child: kTriangleIcon,
                ),
              ),
              onPressed: () {
                kUserShape = kTriangleIcon;
                kDisplayIcon['user'] = kUserShape;
                Navigator.pop(context);
                Navigator.pushNamed(context, kGamePlayScreen);
              },
            ),
            ElevatedButton(
              child: Container(
                height: 80.0,
                child: FittedBox(
                  child: kSquareIcon,
                ),
              ),
              onPressed: () {
                kUserShape = kSquareIcon;
                kDisplayIcon['user'] = kUserShape;
                Navigator.pop(context);
                Navigator.pushNamed(context, kGamePlayScreen);
              },
            )
          ],
        ),
      ),
    );
  }
}
