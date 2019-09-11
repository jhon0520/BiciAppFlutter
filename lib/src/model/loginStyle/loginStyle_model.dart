import 'package:flutter/material.dart';

class LoginPageStyleModel {
  
  final titleDayModeStyle = TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 30.0);
  final titleNightModeStyle = TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 30.0);

  final styleIcosDay = TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 30.0);

  List<Color> buttomGradientColorsDay = <Color>[
              Colors.lightBlue[300],
              Colors.lightBlue[500],
              Colors.lightBlue[700]
            ];

  List<Color> buttomGradientColorsNight = <Color>[
              Colors.blue[500],
              Colors.blue[700],
              Colors.blue[900]
            ];
  

  Color colorTextButtom = Colors.white;

  Color colorIconsDay = Colors.black;
  Color colorIconNight = Colors.white;

  Color colorTextDay = Colors.black;
  Color colorTextNight = Colors.white;

  Color colorBackGroundTabsDay = Colors.white;
  Color colorBackGroundTabsNight = Colors.black;

  Color colorTabsSelectedDay = Colors.blueAccent;
  Color colorTabsSelectedNight = Colors.white;

  IconThemeData styleIconTabsSelectedDay = IconThemeData(color: Colors.blueAccent);
  IconThemeData styleIconTabsSelectedNight = IconThemeData(color: Colors.white);

}