import 'dart:async';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
export 'package:provider/provider.dart';

import 'package:latlong/latlong.dart';

class GeoLocationProvider extends ChangeNotifier{

  final location = new Location();
  Map<String, double> _userLocation;

  LatLng _geoPosition = LatLng(0,0);


  /// get method to get information of user location.
  Map<String, double> get userLocation {
    print('get userLocation $_userLocation');
    return _userLocation;
  }

  LatLng get getPosition {
    print('get _geoPosition $_geoPosition');
    //print('get userLocation $_userLocation');
    return _geoPosition;
    }

  /// void method to set location user information
  // void setLocation(){
  //   _getLocation().then((value) {
  //     this._userLocation = value;
  //     print( this._userLocation);
  //     changegeoPosition = LatLng(_userLocation['latitude'],_userLocation['longitude']);
  //     _geoPosition = LatLng(_userLocation['latitude'],_userLocation['longitude']);
  //     notifyListeners();
  //     //print(LatLng(_userLocation['latitude'],_userLocation['longitude']));
  //     //LatLng position = LatLng(_userLocation['latitude'],_userLocation['longitude']);
  //     //print(_userLocation);
  //     //print(position);
      
  //   });
  // }

  void setLocation() async{
    _userLocation = await _getLocation();
    changegeoPosition = LatLng(_userLocation['latitude'],_userLocation['longitude']);
  }

  set changegeoPosition(LatLng newPosition){
    print('set newPosition $newPosition');
    _geoPosition = newPosition;
    //print('set _geoPosition ${_geoPosition}');
    notifyListeners();
  }

  set locationChanged(Map<String, double> newLocation){
    _userLocation = newLocation;
    //_geoPosition(_userLocation['latitude'],_userLocation['longitude']);
    //print('set _userLocation ${_userLocation}');
    notifyListeners();
  }

  Future<Map<String, double>> _getLocation() async {
    //Map<String, double> currentLocation = <String, double>{};
    try {
      this._userLocation = await location.getLocation();
    } catch (e) {
      this._userLocation = null;
    }
    return this._userLocation;
  }

}