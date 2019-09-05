import 'dart:async';
import 'package:flutter/material.dart';
export 'package:provider/provider.dart';

import 'package:biciapp/src/provider/geoLocation_provider.dart';

class ChronometerProvider extends ChangeNotifier{

  

  bool _isStart = true;
  String _stopwatchText = '00:00:00';
  Stopwatch _stopWatch = new Stopwatch();
  Duration _timeout = const Duration(seconds: 1);

  bool get isStart => _isStart;
  String get stopwatchText => _stopwatchText;
  Stopwatch get stopwatch => _stopWatch;
  Duration get timeout => _timeout;

  BuildContext context;

  set isSartChanged (bool newisStartedState){
    _isStart = newisStartedState;
    notifyListeners();
  }

  set stopwatchTextChanged (String newStopwatchTextState){
    _stopwatchText = newStopwatchTextState;
    notifyListeners();
  }

  set stopwatchChanged (Stopwatch newstopwatchState){
    _stopWatch = newstopwatchState;
    notifyListeners();
  }

  set timeoutChanged (Duration newtimeoutState){
    _timeout = newtimeoutState;
    notifyListeners();
  }


  // Logica de negocio para cronometro
  void startStopButtonPressed() {
      if (_stopWatch.isRunning) {
        isSartChanged = true;
        _stopWatch.stop();
      } else {
        isSartChanged = false;
        _stopWatch.start();
        _startTimeout();
      }
  }

  void resetButtonPressed(){
    if(_stopWatch.isRunning){
      startStopButtonPressed();
    }
     _stopWatch.reset();
     _setStopwatchText(); 

  }

    void _startTimeout() {
    new Timer(_timeout, _handleTimeout);
  }

  void _handleTimeout() {
    if (_stopWatch.isRunning) {
      _startTimeout();

      // if( ( int.parse(_stopwatchText.substring(6,8)) % 10 )  == 0 ){
      //   //print('estoy dentro yea!');
      //   location.setLocation();
      // }

    }  
    _setStopwatchText();

  }
 

  void _setStopwatchText(){
    stopwatchTextChanged = _stopWatch.elapsed.inHours.toString().padLeft(2,'0') + ':'+
                     (_stopWatch.elapsed.inMinutes%60).toString().padLeft(2,'0') + ':' +
                     (_stopWatch.elapsed.inSeconds%60).toString().padLeft(2,'0');
  }


}