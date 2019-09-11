import 'package:biciapp/src/provider/chronometer_provider.dart';
import 'package:biciapp/src/provider/switchappbarbuttom_provider.dart';
import 'package:flutter/material.dart';
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

    if( (int.parse(timer.stopwatchText.substring(6,8)) % 10)  == 0 && timer.isStart && location.getisStarted){
      location.getPosition();
    } 

    return FlutterMap(
      options: MapOptions(
        center: getlocation,
        zoom: 17
      ),
      layers: [
        _crearMapa(dayMode),
        _drawMarker(getlocation),
        _drawPolyline(dayMode,location),
      ],
      
    );
  }

  TileLayerOptions _crearMapa(bool dayMode) {

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

  MarkerLayerOptions _drawMarker (LatLng getlocation){

    final markers = <Marker>[
      Marker(
        width: 80.0,
        height: 80.0,
        point: getlocation,
        builder: (ctx) => Container(
          child: Icon(Icons.place, color: Colors.red, size: 40,),
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



}