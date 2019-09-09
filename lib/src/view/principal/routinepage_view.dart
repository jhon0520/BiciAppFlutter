import 'package:biciapp/src/model/loginStyle/loginStyle_model.dart';
import 'package:biciapp/src/provider/chronometer_provider.dart';
import 'package:biciapp/src/provider/geoLocation_provider.dart';
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

    LocationProvider geoposition = Provider.of<LocationProvider>(context);

    return Column(
      children: <Widget>[
        SizedBox(height: 20),
        _titleText(dayMode, stylePage),
        SizedBox(height: 20),
        _numberofRoads(dayMode, stylePage),
        SizedBox(height: 20),
        _roadsText(dayMode, stylePage),
        SizedBox(height: 20),
        _timerText(dayMode, stylePage, timer),
        //SizedBox(height: 50),
        _information(dayMode, stylePage, geoposition),
        //SizedBox(height: 50),
        _inputButtoms(dayMode, stylePage, timer, geoposition),
        
        //Text("latitude location: ${geoposition.getLatitude}"),
        //Text("longitude location: ${geoposition.getLongitude}")

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

  Widget _timerText(bool dayMode, LoginPageStyleModel stylePage, ChronometerProvider timer){
    return FittedBox(
            fit: BoxFit.none,
            child: Text(
              timer.stopwatchText,
              style: TextStyle(fontSize: 72,
              color: (dayMode ? stylePage.colorTextDay : stylePage.colorTextNight)),
            ),
          );
  }

  Widget _information(bool dayMode, LoginPageStyleModel stylePage, LocationProvider geoposition){
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //.substring(0,6)
              Text('${geoposition.getDistances[geoposition.getDistances.length-1].toString().substring(0,6)} Km',
              style: TextStyle(fontSize: 25,
              color: (dayMode ? stylePage.colorTextDay : stylePage.colorTextNight))),
              SizedBox(width: 50,),
              Text('${geoposition.getVelocity.toString().substring(0,6)} Km/h',
              style: TextStyle(fontSize: 25,
              color: (dayMode ? stylePage.colorTextDay : stylePage.colorTextNight))),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Distancia',
              style: TextStyle(fontSize: 25,
              color: (dayMode ? stylePage.colorTextDay : stylePage.colorTextNight))),
              SizedBox(width: 75,),
              Text('Velocidad',
              style: TextStyle(fontSize: 25,
              color: (dayMode ? stylePage.colorTextDay : stylePage.colorTextNight))),
            ],
          ),
        ],
      ),
    );
  }

  Widget _inputButtoms(bool dayMode, LoginPageStyleModel stylePage, ChronometerProvider timer, LocationProvider geoposition){
    return Center(          
          child: Column(            
            children: <Widget>[
              SizedBox(height: 10,),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                  colors: <Color>[
                    Color(0xFF42A5F5),
                    Color(0xFF1976D2),
                    Color.fromRGBO(34, 139, 134, 100.0),
                  ],
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: MaterialButton(
                    padding: EdgeInsets.symmetric(horizontal: 50.0,),
                    onPressed: (){
                      timer.startStopButtonPressed();
                      geoposition.setisStarted = true;
                    },
                    child: Icon((timer.isStart ? Icons.play_arrow : Icons.pause),
                           color: (dayMode ? stylePage.colorIconsDay : stylePage.colorIconNight),
                    ),
                ),
              ),
              SizedBox(height: 10,),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                  colors: <Color>[
                    Color(0xFF42A5F5),
                    Color(0xFF1976D2),
                    Color.fromRGBO(34, 139, 134, 100.0),
                  ],
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: MaterialButton(
                    padding: EdgeInsets.symmetric(horizontal: 50.0,),
                    onPressed: (){
                      timer.resetButtonPressed();
                      geoposition.setisStarted = false;
                      geoposition.restarted();
                    },
                    child: Icon(Icons.stop,
                           color: (dayMode ? stylePage.colorIconsDay : stylePage.colorIconNight),
                    ),
                ),
              ),
            ],
          ),
        );
  }



}