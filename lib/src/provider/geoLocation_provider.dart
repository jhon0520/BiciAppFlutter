import 'dart:io';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:location/location.dart';
import 'package:latlong/latlong.dart';

export 'package:provider/provider.dart';

class LocationProvider extends ChangeNotifier{

  double _latitude = 3.423849;
  double _longitude = -76.521541;
  bool _isStarted = false;

  List<LatLng> _listofPoints = <LatLng>[];
  List<double> _listofDistances = <double>[0.00001];
 
  double _velocity = 0.00001;
  double _distance = 0.0;

  double _time = 0.0;

  //Location variable
  Location _locationService  = Location();
  LocationData _location;
  bool _permission = false;

  double get getLatitude => _latitude;
  double get getLongitude => _longitude;
  bool get getisStarted =>  _isStarted;
  double get getDistance => _distance;
  double get getVelocity => _velocity;
  List<LatLng> get getPoints => _listofPoints;
  List<double> get getDistances => _listofDistances;
  double get getTime => _time;

  set latitudeChanged (double newlatitude){
    _latitude = newlatitude;
    notifyListeners();
  }

  set longitudeChanged (double newlongitude) {
    _longitude = newlongitude;
    notifyListeners();
  }

  set setisStarted (bool newisStarted){
    _isStarted = newisStarted;
    notifyListeners();
  }

  set setVelocityChanged (double velocityChanged){
    _velocity = velocityChanged;
    notifyListeners();
  }

  set setDistaceChanged(double distanceChanged){
    _distance = distanceChanged;
    notifyListeners();
  }

  set setNewPoint (LatLng newPoint){
    _listofPoints.add(newPoint);
    notifyListeners();
  }

  set setNewVelocity (double newVelocity){
    _velocity = newVelocity;
    notifyListeners();
  }

  void restarted (){
    getPoints.clear();
    getDistances.clear();
    setnewDistance = 0.00001;
    setNewVelocity = 0.00001;
  }

  set setnewDistance (double newDistance){
    _listofDistances.add(newDistance);
    notifyListeners();
  }

  set setTime (double newTime){
    _time = newTime;
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
        sleep(const Duration(seconds:1));
        latitudeChanged = _location.latitude;
        longitudeChanged = _location.longitude;

        if(_isStarted){
          LatLng newposition = LatLng(_location.latitude,_location.longitude);
          setNewPoint = newposition;
          print('lista de puntos ${getPoints.length }');
          //print('Puntos posicion uno ${getPoints[0] }');

          if(getPoints.length > 1){
            setTime = getTime + 10;
            int position = getPoints.length;
            double distance = calculateDistance(getPoints[position-2].latitude,getPoints[position-1].latitude,
                                               getPoints[position-2].longitude,getPoints[position-1].longitude);
            //print('distance: ${distance.toString()}');
            setnewDistance = getDistances[position-1] + distance;

            //print('Time $getTime');
            print('Distance Length ${getDistances.length}');
            if(getDistances.length > 1){
              double time = 10 / 3600;
              int position = getDistances.length;
              double speed = calculateSpeed(getDistances[position-2], getDistances[position-1], time);
              setVelocityChanged = speed;
              print('Speed: $speed');
            }
          }
        }
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

  double calculateSpeed (double initialDistance,double endlDistance , double time){
    // v = x/t

    double speed = (endlDistance - initialDistance) / time;
    return speed;
  }

}