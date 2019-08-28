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