import 'package:biciapp/src/provider/chronometer_provider.dart';
import 'package:biciapp/src/provider/switchappbarbuttom_provider.dart';
import 'package:biciapp/src/provider/api/userdataapi_provider.dart';
import 'package:biciapp/src/utils/local_notications_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:latlong/latlong.dart';
import 'package:provider/provider.dart';
import 'package:flutter_map/flutter_map.dart';

import 'package:biciapp/src/provider/geoLocation_provider.dart';

class MapView extends StatelessWidget {
  const MapView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    ChronometerProvider timer = Provider.of<ChronometerProvider>(context);
    LocationProvider location = Provider.of<LocationProvider>(context);
    LatLng getlocation = LatLng(location.getLatitude,location.getLongitude);

    SwitchAppbarProvider dayModeProvider = Provider.of<SwitchAppbarProvider>(context);
    bool dayMode = dayModeProvider.dayMode;

    if(timer.isStart){
      // final position = location.getLocation();
      // position.then((value) {
      //   getlocation = LatLng(value.latitude, value.longitude);
        
      // }, onError: (error) {
      //   print('completed with error $error');
      // });
      getlocation = LatLng(3.477438, -76.494755);
    }

    // if( (int.parse(timer.stopwatchText.substring(6,8)) % 10)  == 0 && timer.isStart && location.getisStarted){
    //   location.getPosition();
    // } 

    return Scaffold(

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.info_outline),
        onPressed: ()async {

          final notifications = FlutterLocalNotificationsPlugin();

          showSilentNotification(notifications, title: 'RoadApp', body: 'Notificación', id: 30);

        },
      ),
          body: FlutterMap(
        options: MapOptions(
          center: getlocation,
          //center: LatLng(3.477438, -76.494755),
          zoom: 17
        ),
        layers: [
          _createMap(dayMode),
          //_drawMarker(getlocation),
          _drawPolyline(dayMode,location),
          _drawCircleStole(),
          _drawMarker(getlocation),

        ],
        
      ),
    );
  }

  TileLayerOptions _createMap(bool dayMode) {

    return dayMode ? TileLayerOptions(
      urlTemplate: 'https://api.mapbox.com/v4/'
      '{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}',
      // urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
      additionalOptions: {
        'accessToken': 'pk.eyJ1Ijoia2xlcml0aCIsImEiOiJjanY2MjF4NGIwMG9nM3lvMnN3ZDM1dWE5In0.0SfmUpbW6UFj7ZnRdRyNAw',
        'id': 'mapbox.streets'
      },
      //subdomains: ["a","b","c"]
    ) : TileLayerOptions(
      urlTemplate: 'https://api.mapbox.com/v4/'
      '{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}',
      additionalOptions: {
        'accessToken': 'pk.eyJ1Ijoia2xlcml0aCIsImEiOiJjanY2MjF4NGIwMG9nM3lvMnN3ZDM1dWE5In0.0SfmUpbW6UFj7ZnRdRyNAw',
        'id': 'mapbox.dark'
      },
    );
  }

  MarkerLayerOptions _drawMarker (LatLng getlocation){

    final markers = <Marker>[
      Marker(
        width: 80.0,
        height: 80.0,
        point: getlocation,
        builder: (ctx) => Container(
          child: Icon(Icons.fiber_manual_record, color: Colors.blue.withOpacity(0.5), size: 40,),
        ),
      )
    ];

    return MarkerLayerOptions(markers: markers);
  }

  PolylineLayerOptions _drawPolyline(bool dayMode ,LocationProvider location){

    final points = location.getPoints;

    return PolylineLayerOptions( polylines: [
              Polyline(points: points,strokeWidth: 4.0,color: (dayMode ? Colors.blue : Colors.white)),
            ],);
  }

  CircleLayerOptions _drawCircleStole (){
    
    return CircleLayerOptions(
            circles: [
              // CircleMarker(
              //   point: LatLng(3.477438, -76.494755),
              //   radius: 50,
              //   useRadiusInMeter: true,
              //   color: Colors.red.withOpacity(0.7)
              // ),
              CircleMarker(
                point: LatLng(3.445474, -76.535538),
                radius: 1000,
                useRadiusInMeter: true,
                color: Colors.red.withOpacity(0.7)
              ),
              CircleMarker(
                point: LatLng(3.434008, -76.524534),
                radius: 200,
                useRadiusInMeter: true,
                color: Colors.red.withOpacity(0.7)
              ),
              CircleMarker(
                point: LatLng(3.405022, -76.522711),
                radius: 600,
                useRadiusInMeter: true,
                color: Colors.red.withOpacity(0.7)
              ),
              CircleMarker(
                point: LatLng(3.388490, -76.525060),
                radius: 400,
                useRadiusInMeter: true,
                color: Colors.red.withOpacity(0.7)
              ),
              CircleMarker(
                point: LatLng(3.378409, -76.538981),
                radius: 300,
                useRadiusInMeter: true,
                color: Colors.red.withOpacity(0.7)
              ),
            ],
          );
  }

}