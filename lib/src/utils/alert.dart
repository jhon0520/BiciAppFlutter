import 'package:biciapp/src/provider/chronometer_provider.dart';
import 'package:biciapp/src/provider/geoLocation_provider.dart';
import 'package:biciapp/src/provider/routedataapi_provider.dart';
import 'package:biciapp/src/provider/tabs_provider.dart';
import 'package:biciapp/src/provider/userdataapi_provider.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

void showAlert (BuildContext context, String menssageTitle, String message){
  showDialog(
    context: context,
    builder: (context){
      return AlertDialog(
        title: Text(menssageTitle),
        // backgroundColor: Colors.red,
        contentPadding: EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 24.0),
        content: Text(message),
        actions: <Widget>[
          FlatButton(
            child: Text('ok'),
            onPressed: ()=> Navigator.of(context).pop(),
          ),
        ],
      );
    }
  );
}

void showAlertExit (BuildContext context){
  TabsProvider index = Provider.of<TabsProvider>(context);
  ChronometerProvider timer = Provider.of<ChronometerProvider>(context);
  LocationProvider geoposition = Provider.of<LocationProvider>(context);

  UserDataAPI   userProvider = Provider.of<UserDataAPI>(context);
  RouteProvider routeProvider = Provider.of<RouteProvider>(context);
  
  showDialog(
    context: context,
    builder: (context){
      return AlertDialog(
        title: Text('Finalizar sesion'),
        // backgroundColor: Colors.red,
        contentPadding: EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 24.0),
        content: Text('¿Deseas finalizar la sesion?'),
        actions: <Widget>[
          FlatButton(
            child: Text('ok'),
            onPressed: ()async {
              
              try{

              String dateNow = DateFormat('yyyy-MM-dd').format(DateTime.now());
              print('Date Time = $dateNow');
              
              RouteModel response = await routeProvider.apiRequest(dateNow.toString(), timer.stopwatchText, geoposition.getVelocitys, geoposition.getDistances, geoposition.getListOfLatitude, geoposition.getListOfLongitude);
              routeProvider.setRouteModel = response;

              if(response.response){

              UserModel user = userProvider.userModel;

              UserModel newDataUser = await userProvider.apiUserChanged(user.email, response.id);
              userProvider.setUserModel = newDataUser;
              //print(response);

              timer.resetButtonPressed();
              geoposition.setisStarted = false;
              geoposition.restarted();
              Navigator.of(context).pop();
              index.pageSelectedChange = 0;
               
              }else{
                showAlert(context, 'Ruta', 'Disculpa, ocurrio un error');
              }

              } catch (e) {
                showAlert(context, 'Ruta', 'En estos momentos presentamos problemas con la red.');
              }

            },
          ),
          FlatButton(
            child: Text('cancel'),
            onPressed: ()=> Navigator.of(context).pop(),
          ),
        ],
      );
    }
  );
}

void showAlerttodolistNight (BuildContext context, String title, String content){
  
  showDialog(
    context: context,
    builder: (context){
      return AlertDialog(
        //title: Text('Ten cuidado'),
        title: Text(title),
        // backgroundColor: Colors.red,
        contentPadding: EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 24.0),
        //content: Text('Ya es de noche, deberias de revisar algunas de estas cosas en tu bicicleta.'),
        content: Text(content),
        actions: <Widget>[
          FlatButton(
            child: Text('ok'),
            onPressed: (){
              Navigator.of(context).pop();
              Navigator.pushNamed(context, 'nighttodolist');
            },
          ),
          FlatButton(
            child: Text('cancel'),
            onPressed: ()=> Navigator.of(context).pop(),
          ),
        ],
      );
    }
  );
}

void showAlerttodolistDay (BuildContext context, String title, String content){
  
  showDialog(
    context: context,
    builder: (context){
      return AlertDialog(
        //title: Text('Ten cuidado'),
        title: Text(title),
        // backgroundColor: Colors.red,
        contentPadding: EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 24.0),
        //content: Text('Ya es de noche, deberias de revisar algunas de estas cosas en tu bicicleta.'),
        content: Text(content),
        actions: <Widget>[
          FlatButton(
            child: Text('ok'),
            onPressed: (){
              Navigator.of(context).pop();
              Navigator.pushNamed(context, 'nighttodolist');
            },
          ),
          FlatButton(
            child: Text('cancel'),
            onPressed: ()=> Navigator.of(context).pop(),
          ),
        ],
      );
    }
  );
}