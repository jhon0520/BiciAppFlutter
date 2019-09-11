import 'package:flutter/material.dart';
import 'package:biciapp/src/model/loginStyle/loginStyle_model.dart';
import 'package:biciapp/src/provider/switchappbarbuttom_provider.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

  String dropdownValue = 'Selecciona una fecha';
  int dropdownPosition = 0;

class HistoryLapsView extends StatefulWidget {
  const HistoryLapsView({Key key}) : super(key: key);

  @override
  _HistoryLapsViewState createState() => _HistoryLapsViewState();
}

class _HistoryLapsViewState extends State<HistoryLapsView> {
  @override
  Widget build(BuildContext context) {

    SwitchAppbarProvider dayModeProvider = Provider.of<SwitchAppbarProvider>(context);
    LoginPageStyleModel stylePage = LoginPageStyleModel();
    bool dayMode = dayModeProvider.dayMode;

    if(dropdownValue == 'Selecciona una fecha'){
      dropdownPosition = 0;
    }else{
      //print(int.parse(dropdownValue.substring(0,1).toString()));
      dropdownPosition = int.parse(dropdownValue.substring(0,1).toString());
    }

    return Container(
      padding: EdgeInsets.all(50),
      child: Column(
        children: <Widget>[
        Text('Historial de recorrido', 
              style: TextStyle(fontSize: 20, fontFamily: 'bold',
              color: (dayMode ? stylePage.colorTextDay : stylePage.colorTextNight)),
              ),
              SizedBox(height: 30,),
              _dropDownButton(context, dayMode, stylePage),
              SizedBox(height: 30,),
              _drawMap(dayMode, dropdownPosition),
        ],
      ),
    );
  }

  Widget _dropDownButton (BuildContext context, bool dayMode, LoginPageStyleModel stylePage){

    return Container(
      width: 250,
      // color: Colors.white,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: (dayMode ? Colors.lightBlue : stylePage.colorTextNight),
        width: 5),
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
      ),
      padding: EdgeInsets.all(5),

      child: Center(
              child: DropdownButton<String>(
          value: dropdownValue,
          icon: Icon(Icons.keyboard_arrow_down,
                //color: (dayMode ? stylePage.colorTextDay : stylePage.colorTextNight),),
                color: Colors.black,),
          iconSize: 24,
          elevation: 16,
          style: TextStyle(
            // color: (dayMode ? stylePage.colorTextDay : stylePage.colorTextNight),
            color: Colors.black,
          ),
          underline: Container(
            height: 2,
            color: Colors.lightBlue,
          ),
          onChanged: (String newValue) {
            setState(() {
              dropdownValue = newValue;
            });
          },
          items: <String>['Selecciona una fecha','1. Septimbre 10', '2. Septiembre 11',]
            .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value,
                        style: TextStyle(
                          color: Colors.black)),
              );
            })
            .toList(),
        ),
      ),
    );
  }

  Widget _drawMap (bool dayMode, int dropDownPosition){
    var position = LatLng(3.423849,-76.521541);
    LatLng(3.354404, -76.520375);
    if(dropDownPosition == 1 || dropDownPosition == 2){
      position = LatLng(3.354404, -76.520375);
    }
    return Container(
      height: 300,
      child: FlutterMap(
        options: MapOptions(
          // center: LatLng(3.423849,-76.521541),
          center: position,
          zoom: 15
        ),
        layers: [
          _crearMapa(dayMode),
          // _drawMarker(getlocation),
          _drawPolyline(dayMode,dropdownPosition),
        ],
        
      ),
    );
  }

  TileLayerOptions _crearMapa(bool dayMode, ) {

    return dayMode ? TileLayerOptions(
      urlTemplate: 'https://api.mapbox.com/v4/'
      '{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}',
      additionalOptions: {
        'accessToken': 'pk.eyJ1Ijoia2xlcml0aCIsImEiOiJjanY2MjF4NGIwMG9nM3lvMnN3ZDM1dWE5In0.0SfmUpbW6UFj7ZnRdRyNAw',
        'id': 'mapbox.streets'
      },
    ) : TileLayerOptions(
      urlTemplate: 'https://api.mapbox.com/v4/'
      '{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}',
      additionalOptions: {
        'accessToken': 'pk.eyJ1Ijoia2xlcml0aCIsImEiOiJjanY2MjF4NGIwMG9nM3lvMnN3ZDM1dWE5In0.0SfmUpbW6UFj7ZnRdRyNAw',
        'id': 'mapbox.dark'
      },
    );
  }

  PolylineLayerOptions _drawPolyline(bool dayMode ,int position){

    var points = <LatLng>[];
    if(position == 1){
      points = <LatLng>[
      LatLng(3.354404, -76.520375),
      LatLng(3.354863, -76.520381),
      LatLng(3.355202, -76.520375),
      LatLng(3.355613, -76.520378),
      LatLng(3.355876, -76.520386),
      LatLng(3.356180, -76.520389),
    ];
    }else if(position == 2){
      points = <LatLng>[
      LatLng(3.354404, -76.520375),
      LatLng(3.354863, -76.520381),
      LatLng(3.355202, -76.520375),
      LatLng(3.355613, -76.520378),
      LatLng(3.355876, -76.520386),
      LatLng(3.356180, -76.520389),
    ];
    }
    
    return PolylineLayerOptions( polylines: [
              Polyline(points: points,strokeWidth: 4.0,color: (dayMode ? Colors.blue : Colors.white)),
            ],);
  }

}