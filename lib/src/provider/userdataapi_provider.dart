import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:biciapp/src/model/api/user_model.dart';

export 'package:biciapp/src/model/api/user_model.dart';

class UserDataAPI extends ChangeNotifier{

  UserModel _userModel;
  http.Response _response;

  String url = 'http://192.168.1.51:3000/api/ValidarCuenta';

   UserModel get userModel => _userModel;

  Future<UserModel> apiRequest (String userName, String password) async{

    if( userName == null || password == null)
    return _userModel = UserModel(ok: false, usuario: null);

    _response = await http.post(url, body: {"nickName": userName,"contrasena" : password});
    // print(_response.statusCode);
    // print(_response.body);
    if(_response.statusCode != 200){
      if(_response.statusCode == 400){
        _userModel = UserModel(ok: false, usuario: null);
        return _userModel;
      }
      
    }
    _userModel = userModelFromJson(_response.body);
    return _userModel;

  }

  String biciapp (String a, String b){
    return a + b;
  }
}