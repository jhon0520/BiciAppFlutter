import 'package:biciapp/src/model/api/weather_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

export 'package:biciapp/src/model/api/weather_model.dart';

class WeatherConsulting extends ChangeNotifier{


  http.Response _response;
  WeatherModel _weatherModel;

  String _apikey = 'ce941ecc1451e665fd49e5d29ab788c6';

  get getWeatherModel => _weatherModel;
  set setWeatherModel (WeatherModel newWeatherModel){
    _weatherModel = newWeatherModel;
    notifyListeners();
  }

  Future<WeatherModel> apiRequest (double latitude, double longitude) async{

    String _url = 'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$_apikey';
    _response = await http.get(_url);

    //print(_response.statusCode);
  
    _weatherModel = weatherModelFromJson(_response.body);
   
    return _weatherModel;

  }
}