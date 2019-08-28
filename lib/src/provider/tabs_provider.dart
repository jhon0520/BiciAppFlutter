import 'package:flutter/material.dart';

export 'package:provider/provider.dart';

class TabsProvider with ChangeNotifier{

  int _position = 0;

  /// get method to call tabsposition variable
  /// this in order to get index position that have the tabs principal page
  /// ```
  /// int get tabsposition
  /// ```
  int get position => _position;

  /// ```set dayModeChane(bool  newDayState)```
  /// 
  /// Set to change the State of Day Mode to activate the Darck Mode on the App
  set positionChange(int newPosition) {
    _position = newPosition; //actualizamos el valor
    notifyListeners(); //notificamos a los widgets que esten escuchando el stream.
  }
}