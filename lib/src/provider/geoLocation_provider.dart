import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:location/location.dart';

export 'package:provider/provider.dart';

class LocationProvider extends ChangeNotifier{

  double _latitude = 0.0;
  double _longitude = 0.0;
  bool _isLocated = true;

  //Location variable
  Location _locationService  = Location();
  LocationData _location;
  bool _permission = false;

  double get getLatitude => _latitude;
  double get getLongitude => _longitude;
  bool get getisLocated =>  _isLocated;

  set latitudeChanged (double newlatitude){
    _latitude = newlatitude;
    notifyListeners();
  }

  set longitudeChanged (double newlongitude) {
    _longitude = newlongitude;
    notifyListeners();
  }

  set isLocatedChanged (bool locatedStatusChanged){
    _isLocated = locatedStatusChanged;
    notifyListeners();
  }

  void getPosition () async {

    await _locationService.changeSettings(accuracy: LocationAccuracy.HIGH, interval: 1000);

    bool serviceStatus = await _locationService.serviceEnabled();
    // print("Service status: $serviceStatus");
    
    if(serviceStatus){
      _permission = await _locationService.requestPermission();
      // print("Permission: $_permission");
      
      if (_permission) {
        _location = await _locationService.getLocation();
        latitudeChanged = _location.latitude;
        longitudeChanged = _location.longitude;
        print("latitude location: $getLatitude");
        print("longitude location: $getLongitude");
      }
    }

  }

  double calculateDistance (double initialLatitude, double endLatitude, double initialLongitude, double endLongitude){

    int radius = 6371; // Radius of the earth in km
    double deltaLatitude = degreeToRadian(endLatitude - initialLatitude);
    double deltaLongitude = degreeToRadian(endLongitude - initialLongitude);

    double angle =  sin(deltaLatitude/2)* sin(deltaLatitude/2) +
                   cos(degreeToRadian(initialLatitude)) *
                   cos(degreeToRadian(endLatitude)) *
                   sin(deltaLongitude / 2) *
                   sin(deltaLongitude / 2);

    double angularDistance = 2 * atan2(sqrt(angle), sqrt(1 - angle));
    double distance = radius * angularDistance;

    return distance;

  }

  double degreeToRadian (double deltaPosition){

    double result = deltaPosition * (pi/180);
    return result;
  }

  double calculateSpeed (double distance, double time){
    // v = x*t

    double speed = distance * time;
    return speed;
  }

}