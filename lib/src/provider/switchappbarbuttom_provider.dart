import 'package:flutter/material.dart';

export 'package:provider/provider.dart';

class SwitchAppbarProvider with ChangeNotifier{

  bool _dayMode =true;

  /// get method to call dayMode variable
  /// 
  /// dayMode is initialized to true to activate the day mode.
  /// 
  /// if dayMode is changed to false, this change to darck mode.
  /// ```
  /// bool get dayMode
  /// ```
  bool get dayMode => _dayMode;

  /// ```set dayModeChane(bool  newDayState)```
  /// 
  /// Set to change the State of Day Mode to activate the Darck Mode on the App
  set dayModeChange(bool newDayState) {
    _dayMode = newDayState; //actualizamos el valor
    notifyListeners(); //notificamos a los widgets que esten escuchando el stream.
  }
}