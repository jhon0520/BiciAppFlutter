
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:latlong/latlong.dart';

import 'package:biciapp/src/model/api/traffic_model.dart';

export 'package:biciapp/src/model/api/traffic_model.dart';

class TrafficProvider extends ChangeNotifier{


  http.Response _response;
  TrafficModel _trafficModel;
  bool _hasData = false;
  List<LatLng> _trafficPolyline = <LatLng>[];

  String _apikey = 'GmRAdG4dn63MT92pYB5JesuQI5enGG1K';

  get getTrafficModel => _trafficModel;
  get getHasData => _hasData;

  get getTrafficPolyline => _trafficPolyline;

  set setTrafficModel (TrafficModel newTrafficModel){
    _trafficModel = newTrafficModel;
    notifyListeners();
  }

  set seHasData (bool newHasData){
    _hasData = newHasData;
    notifyListeners();
  }

  set setTrafficPolyline (List<LatLng> newTrafficPolyline){

    _trafficPolyline = newTrafficPolyline;
    notifyListeners();
  }

  Future<TrafficModel> apiRequest (double latitude, double longitude) async{

    String _url = 'https://api.tomtom.com/traffic/services/4/flowSegmentData/relative-delay/6/json?key=$_apikey&point=$latitude,$longitude';
    
    _response = await http.get(_url);
    // print(_response.body);

    if(_response.body.substring(2,7) == "error"){
      _trafficModel = trafficModelErrorFromJson(_response.body);
      return _trafficModel;
    }else{
    _trafficModel = trafficModelFromJson(_response.body);
    return _trafficModel; 
    }
  }

  void addTrafficPolyline (){

    if(getTrafficPolyline != null){
      _trafficPolyline.clear();
    }

    TrafficModel trafficData = _trafficModel;
    int trafficLenght = trafficData.flowSegmentData.coordinates.coordinate.length;
    List<LatLng> newTrafficPolyline = [];

    for (int index = 0; index < trafficLenght; index ++){
      double latitude = trafficData.flowSegmentData.coordinates.coordinate[index].latitude;
      double longitude = trafficData.flowSegmentData.coordinates.coordinate[index].longitude;

      newTrafficPolyline.add(LatLng(latitude,longitude));
    }
    
    setTrafficPolyline = newTrafficPolyline;
    
  }


}