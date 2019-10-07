import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:biciapp/src/model/api/user_model.dart';


export 'package:biciapp/src/model/api/user_model.dart';

class RegisterProvider extends ChangeNotifier{

  UserModel _userModel;
  http.Response _response;

  //final _now = DateTime.now();
  //final _formatter = DateFormat('yyyy-MM-dd');
  String _datePicked = DateFormat('yyyy-MM-dd').format(DateTime.now());

  //String url = 'http://192.168.1.51:3000/api/ValidarCuenta';
  //String url = 'http://157.230.83.235:3000/api/validateUser';
  String url = 'http://192.168.1.51:3000/api/createUser';

   UserModel get userModel => _userModel;

  String get getdateNow => _datePicked;

  set setDatePicked (String newDatePicked){
    _datePicked = newDatePicked;
    notifyListeners();
  }

  Future<DateTime> selecDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
      context : context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1980),
      lastDate:  DateTime(2020),
    );

    if(picked != null){
      print(picked);
      setDatePicked = DateFormat('yyyy-MM-dd').format(picked);
      print(getdateNow);
    }

    return picked;
  }
  


  Future<UserModel> apiRequest (String firstName, String secondName, String firstLastName, String secondLastName, String email,
            String nickName, String password, String birthDay, int weight, int age, int height) async{

    if( email == null || password == null)
    return _userModel = UserModel(response: false, message: null);

    //_response = await http.post(url, body: {"nickName": email,"contrasena" : password});
    //print('email: $email - password: $password');

    dynamic jsonRequest = {
      "firstName": firstLastName,
	    "secondName": secondName,
	    "firstLastName": firstLastName,
	    "secondLastName": secondLastName,
	    "email": email,
	    "password": password,
	    "nickName": nickName,
	    "birthDay": birthDay,
	    "weight": weight.toString(),
	    "age": age.toString(),
	    "height": height.toString()
    };

    print('Json Request $jsonRequest');

    _response = await http.post(url, body: jsonRequest);
    // _response = await http.post(url, body: {'name': 'doodle', 'color': 'blue'});
    print(_response.statusCode);
    print(_response.body);
    if(_response.statusCode != 200){
      if(_response.statusCode == 404){
        _userModel = UserModel(response: false, message: null);
        return _userModel;
      }      
    }

    _userModel = userModelFromJson(_response.body);
    _userModel.setResponse = true;
    // UserModel(response: true);
    return _userModel;

  }

  String biciapp (String a, String b){
    return a + b;
  }
}