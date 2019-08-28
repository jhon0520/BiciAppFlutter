import 'package:flutter/material.dart';

class LoginPageStyleModel {
  
  final titleDayModeStyle = TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 30.0);
  final titleNightModeStyle = TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 30.0);

  final styleIcosDay = TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 30.0);

  Color colorIconsDay = Colors.black;
  Color colorIconNight = Colors.white;

  Color colorTextDay = Colors.black;
  Color colorTextNight = Colors.white;

  Color colorBackGroundTabsDay = Colors.white;
  Color colorBackGroundTabsNight = Colors.black;

  Color colorTabsSelectedDay = Colors.black;
  Color colorTabsSelectedNight = Colors.white;

  IconThemeData styleIconTabsSelectedDay = IconThemeData(color: Colors.black);
  IconThemeData styleIconTabsSelectedNight = IconThemeData(color: Colors.white);

}