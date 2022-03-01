import 'package:flutter/material.dart';
import 'package:tic_tac_toe/models/constants.dart';
import 'package:tic_tac_toe/models/menu_button.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class MainScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
        ),
        padding: EdgeInsets.symmetric(
          vertical: 180.0,
          horizontal: 80.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              'TIC TAC TOE',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 50.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
            MenuButton(
              buttonText: 'NEW GAME',
              onPressed: () {
                Navigator.pushNamed(context, kSetupScreen);
              },
              shape: Icon(
                Icons.play_arrow_outlined,
                size: 50,
              ),
            ),
            MenuButton(
              buttonText: 'SETTINGS',
              onPressed: () {
                Navigator.pushNamed(context, kSettingsScreen);
              },
              shape: Icon(
                Icons.settings,
                size: 50,
              ),
            ),
          ],
        ),
      ),
    );
  }
  Future<InitializationStatus> _initGoogleMobileAds() {
    return MobileAds.instance.initialize();
  }
}

