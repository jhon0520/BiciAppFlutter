import 'package:biciapp/src/model/loginStyle/loginStyle_model.dart';
import 'package:biciapp/src/provider/chronometer_provider.dart';
import 'package:biciapp/src/provider/switchappbarbuttom_provider.dart';
import 'package:biciapp/src/provider/tabs_provider.dart';
import 'package:flutter/material.dart';

class RoutinePage extends StatelessWidget {
  const RoutinePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    SwitchAppbarProvider dayModeProvider = Provider.of<SwitchAppbarProvider>(context);
    bool dayMode = dayModeProvider.dayMode;
    LoginPageStyleModel stylePage = LoginPageStyleModel();

    TabsProvider index = Provider.of<TabsProvider>(context);

    ChronometerProvider timer = Provider.of<ChronometerProvider>(context);

    return Column(
      children: <Widget>[
        SizedBox(height: 20),
        _titleText(dayMode, stylePage),
        SizedBox(height: 20),
        _numberofRoads(dayMode, stylePage),
        SizedBox(height: 20),
        _roadsText(dayMode, stylePage),
        SizedBox(height: 20),
        _timerText(timer),
        SizedBox(height: 50),
        _information(),
        SizedBox(height: 50),
        _inputButtoms(timer),

      ],
    );
  }

  Widget _titleText(bool dayMode, LoginPageStyleModel stylePage){

      return Container(
        child: Text(
                  'Rutina',
                  style: dayMode
                      ? stylePage.titleDayModeStyle
                      : stylePage.titleNightModeStyle,
                )
      );
    }

  Widget _numberofRoads(bool dayMode, LoginPageStyleModel stylePage){
      return Container(
        child: Text(
                  '0',
                  style: dayMode
                      ? stylePage.titleDayModeStyle
                      : stylePage.titleNightModeStyle,
                )
      );
    }
  
  Widget _roadsText(bool dayMode, LoginPageStyleModel stylePage){
      return Container(
        child: Text(
                  'ROD´S',
                  style: dayMode
                      ? stylePage.titleDayModeStyle
                      : stylePage.titleNightModeStyle,
                )
      );
    }

  Widget _timerText(ChronometerProvider timer){
    return FittedBox(
            fit: BoxFit.none,
            child: Text(
              //stopwatchText,
              timer.stopwatchText,
              style: TextStyle(fontSize: 72),
            ),
          );
  }

  Widget _information(){
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('0.0 Km',
              style: TextStyle(fontSize: 25)),
              SizedBox(width: 100,),
              Text('0.0 Km/h',
              style: TextStyle(fontSize: 25)),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Distancia',
              style: TextStyle(fontSize: 25)),
              SizedBox(width: 75,),
              Text('Velocidad',
              style: TextStyle(fontSize: 25)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _inputButtoms(ChronometerProvider timer){
    return Center(          
          child: Column(            
            children: <Widget>[
              RaisedButton(
                child: Icon(timer.isStart ? Icons.play_arrow : Icons.stop),
                onPressed: (){
                  timer.startStopButtonPressed();
                },
              ),
              RaisedButton(
                child: Text('Reset'),
                onPressed: (){
                  timer.resetButtonPressed();
                },
              ),
            ],
          ),
        );
  }



}