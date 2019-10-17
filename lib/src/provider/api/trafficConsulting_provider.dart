
import 'package:biciapp/src/model/api/traffic_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

export 'package:biciapp/src/model/api/traffic_model.dart';

class TrafficConsulting extends ChangeNotifier{


  http.Response _response;
  TrafficModel _trafficModel;

  String _apikey = 'GmRAdG4dn63MT92pYB5JesuQI5enGG1K&point';

  get getWeatherModel => _trafficModel;
  set setWeatherModel (TrafficModel newWeatherModel){
    _trafficModel = newWeatherModel;
    notifyListeners();
  }

  Future<TrafficModel> apiRequest (double latitude, double longitude) async{

    String _url = 'https://api.tomtom.com/traffic/services/4/flowSegmentData/relative-delay/6/json?key=$_apikey&point=$latitude,$longitude';
    _response = await http.get(_url);

    //print(_response.statusCode);
  
    _trafficModel = trafficModelFromJson(_response.body);
   
    return _trafficModel;

  }
}