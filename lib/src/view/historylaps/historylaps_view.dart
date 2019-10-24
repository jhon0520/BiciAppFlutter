import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:latlong/latlong.dart';

import 'package:biciapp/src/model/loginStyle/loginStyle_model.dart';
import 'package:biciapp/src/provider/historylaps_provider.dart';
import 'package:biciapp/src/provider/switchappbarbuttom_provider.dart';
import 'package:biciapp/src/provider/tabs_provider.dart';
import 'package:biciapp/src/provider/api/userdataapi_provider.dart';

List<Polyline> listOfPolyline = <Polyline> [];

final colors = [Colors.red, Colors.blue, Colors.purple, Colors.yellow];

int lastDistancePosition;
String lasDistance;

String duration;

int lastVelocityPosition;
String lasVelocity;

class HistoryLapsView extends StatelessWidget {
  const HistoryLapsView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserDataAPI userProvider = Provider.of<UserDataAPI>(context);
    HistoryLapsProvider historyLapsProvider = Provider.of<HistoryLapsProvider>(context);
    SwitchAppbarProvider dayModeProvider = Provider.of<SwitchAppbarProvider>(context);

    LoginPageStyleModel stylePage = LoginPageStyleModel();
    bool dayMode = dayModeProvider.dayMode;

    int dropDownPosition = historyLapsProvider.getDropDownPosition;
    LatLng centerMap = LatLng(3.404142, -76.523088);

    UserModel userData = userProvider.userModel;
    if(dropDownPosition == 0){
      historyLapsProvider.initState(userData);
    }else{
      historyLapsProvider.searchDataRoute(dropDownPosition , userData);
    }
    //historyLapsProvider.initState(userData);

    return WillPopScope(
      onWillPop: () async {
        listOfPolyline.clear();
        historyLapsProvider.restarted();
        Navigator.pushReplacementNamed(context, 'principal');
        return true;
      },
      child: SingleChildScrollView(
        child: Container(
          //padding: EdgeInsets.all(30),
          child: Column(
            children: <Widget>[
              _titleText(dayMode, stylePage),
              _crearDropdown(historyLapsProvider),
              //_createMap(dropDownPosition, centerMap, historyLapsProvider)
              _drawMap(dayMode, dropDownPosition, centerMap, historyLapsProvider),
              SizedBox(height: 50,),
              _history(dayMode, dropDownPosition, stylePage, userData),
            ],
          ),
        ),
      ),
    );
  }

  Widget _titleText(bool dayMode, LoginPageStyleModel stylePage) {
    return Container(
      child: Text(
        'Historial de recorrido',
        style: TextStyle(
            fontSize: 20,
            fontFamily: 'bold',
            color:
                (dayMode ? stylePage.colorTextDay : stylePage.colorTextNight)),
      ),
    );
  }

  Widget _crearDropdown(HistoryLapsProvider historyLapsProvider) {
    return Container(
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(width: 30.0),
            Expanded(
              child: DropdownButton(
                value: historyLapsProvider.getOptionSelected,
                items: getOpcionesDropdown(historyLapsProvider),
                onChanged: (option) {
                  listOfPolyline.clear();
                  historyLapsProvider.setOptionSelected = option;                  
                  print(int.parse(option.substring(0,2).toString()));
                  historyLapsProvider.setDropDownPositon = int.parse(option.substring(0,2).toString());
                  //print(historyLapsProvider.getDropDownPosition);
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  List<DropdownMenuItem<String>> getOpcionesDropdown(HistoryLapsProvider historyLapsProvider) {
    List<DropdownMenuItem<String>> lista = new List();

    historyLapsProvider.getDropDownListOptios.forEach((historyOptions) {
      lista.add(DropdownMenuItem(
        child: Text(historyOptions, textAlign: TextAlign.center,),
        value: historyOptions,
      ));
    });

    return lista;
  }

  Widget _drawMap (bool dayMode, int dropDownPosition, LatLng centerMap, HistoryLapsProvider historyLapsProvider){

    return Container(
      height: 300,
      child: FlutterMap(
        options: MapOptions(
          center: centerMap,
          zoom: 12
        ),
        layers: [
          _crearMapa(dayMode),
          _drawPolyline(dayMode , dropDownPosition, historyLapsProvider),
        ],
        
      ),
    );
  }

  TileLayerOptions _crearMapa(bool dayMode, ) {

    return dayMode ? TileLayerOptions(
      urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
      additionalOptions: {
        'accessToken': 'pk.eyJ1Ijoia2xlcml0aCIsImEiOiJjanY2MjF4NGIwMG9nM3lvMnN3ZDM1dWE5In0.0SfmUpbW6UFj7ZnRdRyNAw',
        'id': 'mapbox.streets'
      },
      subdomains: ["a","b","c"]
    ) : TileLayerOptions(
      urlTemplate: 'https://api.mapbox.com/v4/'
      '{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}',
      additionalOptions: {
        'accessToken': 'pk.eyJ1Ijoia2xlcml0aCIsImEiOiJjanY2MjF4NGIwMG9nM3lvMnN3ZDM1dWE5In0.0SfmUpbW6UFj7ZnRdRyNAw',
        'id': 'mapbox.dark'
      },
    );
  }

    PolylineLayerOptions _drawPolyline(bool dayMode , int dropDownPosition, HistoryLapsProvider historyLapsProvider){

      List<List<LatLng>> polylineArray = historyLapsProvider.getPolilyneList;

    if( dropDownPosition == 0 ){
      int index = 0;

      for(index = 0; index < polylineArray.length ; index++){
        final polyline = Polyline(
          points: polylineArray[index],
          color: Colors.lightBlueAccent,
          //color: colors[index],
          strokeWidth: 4.0,
        );
        listOfPolyline.add(polyline);
      }

      return PolylineLayerOptions( polylines: listOfPolyline);

    }

    final polyline = Polyline(
          points: polylineArray[0],
          color: Colors.lightBlueAccent,
          strokeWidth: 4,
        );
      listOfPolyline.add(polyline);

    return PolylineLayerOptions( polylines: listOfPolyline);
  }

  Widget _history(bool dayMode , int dropDownPosition, LoginPageStyleModel stylePage, UserModel userData){
    
    if(dropDownPosition != 0){
      lastDistancePosition = userData.routes[dropDownPosition-1].distance.length;
      lasDistance = userData.routes[dropDownPosition-1].distance[lastDistancePosition-1].toString();
      lasDistance = lasDistance.substring(0,5);

      duration = userData.routes[dropDownPosition-1].time;

      lastVelocityPosition = userData.routes[dropDownPosition-1].velocity.length;
      lasVelocity = userData.routes[dropDownPosition-1].distance[lastVelocityPosition-1].toString();
      lasVelocity = lasDistance.substring(0,5);

    }

    return (dropDownPosition == 0) ? Container() : Container(
      child: Center(
              child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                SizedBox(width: 50,),
                Text('Kilometros Recorridos',
                style: TextStyle(fontSize: 12,
                color: (dayMode ? stylePage.colorTextDay : stylePage.colorTextNight))),
                SizedBox(width: 70,),

                Text('Duración',
                style: TextStyle(fontSize: 12,
                color: (dayMode ? stylePage.colorTextDay : stylePage.colorTextNight))),
                SizedBox(width: 50,),
              ],
            ),

            SizedBox(height: 10,),
            Row(
              children: <Widget>[
                SizedBox(width: 100,),
                Text('$lasDistance',
                style: TextStyle(fontSize: 12,
                color: (dayMode ? stylePage.colorTextDay : stylePage.colorTextNight))),
                SizedBox(width: 100,),

                Text('$duration',
                style: TextStyle(fontSize: 12,
                color: (dayMode ? stylePage.colorTextDay : stylePage.colorTextNight))),
                SizedBox(width: 50,),
              ],
            ),

            SizedBox(height: 30,),
            Row(
              children: <Widget>[
                SizedBox(width: 90,),
                Text('Roads',
                style: TextStyle(fontSize: 12,
                color: (dayMode ? stylePage.colorTextDay : stylePage.colorTextNight))),

                SizedBox(width: 75,),

                Text('Velocidad promedio',
                style: TextStyle(fontSize: 12,
                color: (dayMode ? stylePage.colorTextDay : stylePage.colorTextNight))),
                SizedBox(width: 50,),
              ],
            ),

            SizedBox(height: 10,),
            Row(
              children: <Widget>[
                SizedBox(width: 100,),
                Text('${userData.routes[dropDownPosition-1].rods}',
                style: TextStyle(fontSize: 12,
                color: (dayMode ? stylePage.colorTextDay : stylePage.colorTextNight))),
                SizedBox(width: 125,),

                Text('$lasVelocity',
                style: TextStyle(fontSize: 12,
                color: (dayMode ? stylePage.colorTextDay : stylePage.colorTextNight))),
                SizedBox(width: 50,),
              ],
            ),
          ],
        ),
      ),
    );
  }

}
