
import 'package:biciapp/src/model/api/traffic_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

export 'package:biciapp/src/model/api/traffic_model.dart';

class TrafficProvider extends ChangeNotifier{


  http.Response _response;
  TrafficModel _trafficModel;
  bool _hasData = false;

  String _apikey = 'GmRAdG4dn63MT92pYB5JesuQI5enGG1K';

  get getTrafficModel => _trafficModel;
  get getHasData => _hasData;

  set setTrafficModel (TrafficModel newTrafficModel){
    _trafficModel = newTrafficModel;
    notifyListeners();
  }

  set seHasData (bool newHasData){
    _hasData = newHasData;
    notifyListeners();
  }

  Future<TrafficModel> apiRequest (double latitude, double longitude) async{

    String _url = 'https://api.tomtom.com/traffic/services/4/flowSegmentData/relative-delay/6/json?key=$_apikey&point=$latitude,$longitude';
    
    _response = await http.get(_url);
    print(_response.body);

    if(_response.body.substring(2,7) == "error"){
      _trafficModel = trafficModelErrorFromJson(_response.body);
      return _trafficModel;
    }else{
    _trafficModel = trafficModelFromJson(_response.body);
    return _trafficModel; 
    }
  }

  
}