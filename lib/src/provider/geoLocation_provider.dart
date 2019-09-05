import 'package:flutter/cupertino.dart';
import 'package:location/location.dart';

export 'package:provider/provider.dart';

class LocationProvider extends ChangeNotifier{

  double _latitude = 0.0;
  double _longitude = 0.0;

  //Location variable
  Location _locationService  = Location();
  LocationData _location;
  bool _permission = false;

  double get getLatitude => _latitude;
  double get getLongitude => _longitude;

  set latitudeChanged (double newlatitude){
    _latitude = newlatitude;
    notifyListeners();
  }

  set longitudeChanged (double newlongitude) {
    _longitude = newlongitude;
    notifyListeners();
  }

  void getPosition () async {

    await _locationService.changeSettings(accuracy: LocationAccuracy.HIGH, interval: 1000);

    bool serviceStatus = await _locationService.serviceEnabled();
    print("Service status: $serviceStatus");
    
    if(serviceStatus){
      _permission = await _locationService.requestPermission();
      print("Permission: $_permission");
      
      if (_permission) {
        _location = await _locationService.getLocation();
        latitudeChanged = _location.latitude;
        longitudeChanged = _location.longitude;
        print("latitude location: $getLatitude");
        print("longitude location: $getLongitude");
      }
    }

  }

}