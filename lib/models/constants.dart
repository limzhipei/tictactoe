import 'package:flutter/material.dart';

String kMainScreen = 'main_screen';
String kGamePlayScreen = 'gameplay_screen';
String kSettingsScreen = 'settings_screen';
String kSetupScreen = 'setup_screen';

Icon kCrossIcon = Icon(
  Icons.clear_outlined,
);

Icon kCircleIcon = Icon(
  Icons.circle_outlined,
);

Icon kTriangleIcon = Icon(
  Icons.change_history,
);

Icon kSquareIcon = Icon(
  Icons.crop_square_sharp,
);

Icon kUserShape = kCircleIcon;

bool kGameOn = true;
int kGameIndex = 0;

Map<String, Icon> kDisplayIcon = {
  '': Icon(null),
  'user': kCircleIcon,
  'com': kCrossIcon,
};

Map<String, int> kGameResults = {
  'user': 0,
  'com': 1,
  'draw': 2,
};



