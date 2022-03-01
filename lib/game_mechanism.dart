import 'package:flutter/material.dart';
import 'package:tic_tac_toe/models/constants.dart';
import 'dart:math';

class GameMechanism extends ChangeNotifier{

  String noWinnerYet = 'Game on-going';
  String titleText = 'It\'s your turn';
  bool comTurn = false;
  int kScore = 0;
  int? kWinner;
  bool kYourTurn = true;
  Random random = Random();
  List<int> _playIndex = [
    0,1,2,3,4,5,6,7,8,
  ];
  List<String> kDisplayKey = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];

  void getText() {
    if (kYourTurn) {
      titleText = 'It\'s your turn';
      notifyListeners();
    } else {
      titleText = 'It\'s computer\'s turn';
      notifyListeners();
    }
  }

  void onHumanPlayed() async {
    if (_checkWinner() != noWinnerYet) {
      kGameOn = false;
      kWinner = kGameResults[_checkWinner()];
      notifyListeners();
      if (kWinner == 0) {
        kScore ++;
        notifyListeners();
      } else if (kWinner == 1) {
        kScore = 0;
        notifyListeners();
      }
    } else {
      comTurn = true;
      Future.delayed(const Duration(seconds: 2), () {
        int randomIndex = _playIndex[random.nextInt(_playIndex.length)];
        kDisplayKey[randomIndex] = 'com';
        _playIndex.remove(randomIndex);
        kGameIndex ++;
        kYourTurn = true;
        getText();
        notifyListeners();
        if (_checkWinner() != noWinnerYet) {
          kGameOn = false;
          kWinner = kGameResults[_checkWinner()];
          notifyListeners();
          if (kWinner == 0) {
            kScore ++;
            notifyListeners();
          } else if (kWinner == 1) {
            kScore = 0;
            notifyListeners();
          }
        }
        comTurn = false;
      });
    }
  }

  void movePlayed(int index) {
    if (kYourTurn && (kDisplayKey[index] == '')) {
      kDisplayKey[index] = 'user';
      notifyListeners();
      _playIndex.remove(index);
      kGameIndex ++;
      kYourTurn = false;
      getText();
      onHumanPlayed();
    }
  }

  void restartGame() {
    _playIndex = [
      0,1,2,3,4,5,6,7,8,
    ];
    kDisplayKey = [
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
    ];
    titleText = 'It\'s your turn';
    kGameIndex = 0;
    kYourTurn = true;
    kGameOn = true;
    kWinner = 2;
    notifyListeners();
  }

  String _checkWinner() {
    // Check rows
    if (kDisplayKey[0] == kDisplayKey[1] &&
        kDisplayKey[1] == kDisplayKey[2] &&
        kDisplayKey[0] != '') {
      return kDisplayKey[0];
    } else if (kDisplayKey[3] == kDisplayKey[4] &&
        kDisplayKey[4] == kDisplayKey[5] &&
        kDisplayKey[3] != '') {
      return kDisplayKey[3];
    } else if (kDisplayKey[6] == kDisplayKey[7] &&
        kDisplayKey[7] == kDisplayKey[8] &&
        kDisplayKey[6] != '') {
      return kDisplayKey[6];
    }
    // Check columns
    else if (kDisplayKey[0] == kDisplayKey[3] &&
        kDisplayKey[3] == kDisplayKey[6] &&
        kDisplayKey[0] != '') {
      return kDisplayKey[0];
    } else if (kDisplayKey[1] == kDisplayKey[4] &&
        kDisplayKey[4] == kDisplayKey[7] &&
        kDisplayKey[1] != '') {
      return kDisplayKey[1];
    } else if (kDisplayKey[2] == kDisplayKey[5] &&
        kDisplayKey[5] == kDisplayKey[8] &&
        kDisplayKey[2] != '') {
      return kDisplayKey[2];
    }
    // Check diagonals
    else if (kDisplayKey[0] == kDisplayKey[4] &&
        kDisplayKey[4] == kDisplayKey[8] &&
        kDisplayKey[0] != '') {
      return kDisplayKey[0];
    } else if (kDisplayKey[2] == kDisplayKey[4] &&
        kDisplayKey[4] == kDisplayKey[6] &&
        kDisplayKey[2] != '') {
      return kDisplayKey[2];
    } else if (kGameIndex == 9) {
      return 'draw';
    } else {
      return noWinnerYet;
    }
  }
}

