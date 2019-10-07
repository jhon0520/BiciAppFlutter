import 'package:flutter/material.dart';

class NightTodolistProvider extends ChangeNotifier{

  int _value = 1;
  int _grupValue = 0;

  int _grupValue1 =  1;
  int _grupValue2 =  2;
  int _grupValue3 =  3;
  int _grupValue4 =  4;
  int _grupValue5 =  5;
  int _grupValue6 =  6;
  int _grupValue7 =  7;

  int get getTodoListValue => _value;
  int get getTodoListGrupValue => _grupValue;

  int get getGrupValue1 => _grupValue1;
  int get getGrupValue2 => _grupValue2;
  int get getGrupValue3 => _grupValue3;
  int get getGrupValue4 => _grupValue4;
  int get getGrupValue5 => _grupValue5;
  int get getGrupValue6 => _grupValue6;
  int get getGrupValue7 => _grupValue7;

  set setGrupValue1 ( int newValue){
    _grupValue1 = newValue;
    notifyListeners();
  }
  set setGrupValue2 ( int newValue){
    _grupValue2 = newValue;
    notifyListeners();
  }
  set setGrupValue3 ( int newValue){
    _grupValue3 = newValue;
    notifyListeners();
  }
  set setGrupValue4 ( int newValue){
    _grupValue4 = newValue;
    notifyListeners();
  }
  set setGrupValue5 ( int newValue){
    _grupValue5 = newValue;
    notifyListeners();
  }
  set setGrupValue6 ( int newValue){
    _grupValue6 = newValue;
    notifyListeners();
  }
  set setGrupValue7 ( int newValue){
    _grupValue7 = newValue;
    notifyListeners();
  }
  

  set setTodoListGrupValue (int newTodoListGrupValue){

    _grupValue = newTodoListGrupValue;
    notifyListeners();

  }

}