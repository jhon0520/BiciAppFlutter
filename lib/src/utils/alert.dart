import 'package:biciapp/src/provider/chronometer_provider.dart';
import 'package:biciapp/src/provider/geoLocation_provider.dart';
import 'package:biciapp/src/provider/tabs_provider.dart';
import 'package:flutter/material.dart';

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
            onPressed: (){
              timer.resetButtonPressed();
              geoposition.setisStarted = false;
              geoposition.restarted();
              index.pageSelectedChange = 0;
              Navigator.of(context, rootNavigator: true).pop('principal');
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