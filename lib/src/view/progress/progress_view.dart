import 'package:flutter/material.dart';

import 'package:biciapp/src/model/loginStyle/loginStyle_model.dart';
import 'package:biciapp/src/provider/switchappbarbuttom_provider.dart';

class ProgressPage extends StatelessWidget {
  const ProgressPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    SwitchAppbarProvider dayModeProvider = Provider.of<SwitchAppbarProvider>(context);
    LoginPageStyleModel stylePage = LoginPageStyleModel();
    bool dayMode = dayModeProvider.dayMode;

    return Container(
      child: Column(
        children: <Widget>[
          SizedBox(height: 120),
          _roadobtaineds(dayMode, stylePage),
          _roadTextinformation(context, dayMode, stylePage),
          SizedBox(height: 40),
          _yourTravels(context, dayMode, stylePage),
        ],
      )
    );
  }

  Widget _roadobtaineds(bool dayMode, LoginPageStyleModel stylePage){
    return Container(
      width: 200,
      decoration: BoxDecoration(
        border: Border.all(color: (dayMode ? stylePage.colorTextDay : stylePage.colorTextNight),
        width: 5),
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
      ),
      child: Column(
        children: <Widget>[
          SizedBox(height: 20),
          Text('Tienes',
          style: TextStyle(fontSize: 25, 
          color: (dayMode ? stylePage.colorTextDay : stylePage.colorTextNight))
          ),
          SizedBox(height: 20),
          Text('0',
          style: TextStyle(fontSize: 25, 
          color: (dayMode ? stylePage.colorTextDay : stylePage.colorTextNight))
          ),
          SizedBox(height: 20),
          Text('Rod´s',
          style: TextStyle(fontSize: 25, 
          color: (dayMode ? stylePage.colorTextDay : stylePage.colorTextNight))
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _roadTextinformation(BuildContext context,bool dayMode, LoginPageStyleModel stylePage){
    return FlatButton(
              color: Colors.transparent,
              textColor: dayMode ? stylePage.colorTextDay : stylePage.colorTextNight,
              child: Text('¿Que es un Rod?', 
              style: TextStyle(fontSize: 20, fontFamily: 'bold'),),
              onPressed: () {
              Navigator.pushNamed(context, 'rodinformation');
              },
            );
  }

  Widget _yourTravels(BuildContext context,bool dayMode, LoginPageStyleModel stylePage){
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: (dayMode ? stylePage.buttomGradientColorsDay : stylePage.buttomGradientColorsNight),
          ),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: MaterialButton(
        padding: EdgeInsets.symmetric(horizontal: 50.0,),
        onPressed: () {
        Navigator.pushNamed(context, 'historylaps'); 
        },
        child: Text('Mis recorridos',
              style: TextStyle(color: (dayMode ? stylePage.colorTextButtom : stylePage.colorTextNight),
              fontSize: 20)
        ),
      ),
    );
  }

}