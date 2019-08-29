import 'package:flutter/material.dart';
export 'package:provider/provider.dart';

class TabsProvider with ChangeNotifier{

  int _position = 0;
  int _pageSelected = 0;

  /// get method to call tabsposition value
  /// this in order to get index position that have the tabs principal page
  /// ```
  /// int get tabsposition
  /// ```
  int get position => _position;

  /// get method to call pageSelected value
  /// this in order to get page selected on principal page tabs to don't call method to redirect
  /// to new page
  /// ```
  /// int get pageSelected
  /// ```
  int get pageSelected => _pageSelected;

  /// ```set dayModeChane(bool  newDayState)```
  /// 
  /// Set to change the State of Day Mode to activate the Darck Mode on the App
  set positionChange(int newPosition) {
    _position = newPosition; //actualizamos el valor
    notifyListeners(); //notificamos a los widgets que esten escuchando el stream.
  }

  set pageSelectedChange(int newPageSelected) {
    _pageSelected = newPageSelected; //actualizamos el valor
    notifyListeners(); //notificamos a los widgets que esten escuchando el stream.
  }
}