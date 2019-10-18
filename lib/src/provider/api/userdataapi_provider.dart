import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:biciapp/src/model/api/user_model.dart';

export 'package:biciapp/src/model/api/user_model.dart';

class UserDataAPI extends ChangeNotifier{

  UserModel _userModel;
  http.Response _response;

  //String url = 'http://192.168.1.51:3000/api/ValidarCuenta';
  String url = 'http://157.230.83.235:3000/api/';
  //String url = 'http://192.168.1.53:3000/api/';

  UserModel get userModel => _userModel;

  set setUserModel (UserModel newUserModel){
    _userModel = newUserModel;
    notifyListeners();
  }

  Future<UserModel> apiRequest (String email, String password) async{

    _response = await http.post(url + "validateUser", body: {"email": email,"password" : password});
    // _response = await http.post(url, body: {'name': 'doodle', 'color': 'blue'});
     UserModel userModel;
    if(_response.statusCode != 200){
      if(_response.statusCode == 404){
        userModel = UserModel(response: false, message: null);
        return userModel;
      }      
    }

    userModel = userModelFromJson(_response.body);
    userModel.setResponse = true;
    // UserModel(response: true);
    setUserModel = userModel;
    return userModel;

  }

  Future<UserModel> apiUserChanged (String email, String id) async{

    _response = await http.post(url + "changeUserParams", body: {"email": email, "id" : id});
 
     //print(_response.statusCode);
     //print(_response.body);
     UserModel userModel;
    if(_response.statusCode != 200){
      if(_response.statusCode == 404){
        userModel = UserModel(response: false, message: null);
        return userModel;
      }      
    }

    userModel = userModelFromJson(_response.body);
    userModel.setResponse = true;

    return userModel;

  }

}