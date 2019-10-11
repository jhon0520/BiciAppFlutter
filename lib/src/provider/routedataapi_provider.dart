import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:biciapp/src/model/api/route_model.dart';

export 'package:biciapp/src/model/api/route_model.dart';

class RouteProvider extends ChangeNotifier{

  RouteModel _routeModel;
  http.Response _response;

  //String url = 'http://192.168.1.51:3000/api/ValidarCuenta';
  String url = 'http://157.230.83.235:3000/api/createRoute';
  //String url = 'http://192.168.1.53:3000/api/createRoute';

  RouteModel get getrouteModel => _routeModel;

  set setRouteModel (RouteModel newRouteModel){
    _routeModel = newRouteModel;
    notifyListeners();
  }

  Future<RouteModel> apiRequest (String routeDate, String time, List<double> velocity, List<double> distance, List<double> latitude, List<double> longitude) async{

    dynamic jsonRequest = {
      "routeDate": routeDate,
	    "time": time,
	    "velocity": velocity.toString(),
	    "distance": distance.toString(),
	    "latitude": latitude.toString(),
      "longitude": longitude.toString()
    };

    //print(jsonRequest);

    _response = await http.post(url, body: jsonRequest);

    //print(_response);
    
     RouteModel routeModel;
    if(_response.statusCode != 200){
      if(_response.statusCode == 404){
         routeModel = RouteModel(response: false, message: null);
        return routeModel;
      }      
    }

    routeModel = routeModelFromJson(_response.body);
    routeModel.setResponse = true;

    return routeModel;

  }
}