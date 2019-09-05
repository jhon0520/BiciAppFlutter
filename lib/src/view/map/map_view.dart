import 'package:flutter/material.dart';
import 'package:latlong/latlong.dart';
import 'package:provider/provider.dart';
import 'package:flutter_map/flutter_map.dart';

import 'package:biciapp/src/provider/geoLocation_provider.dart';

class MapView extends StatelessWidget {
  const MapView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    LocationProvider location = Provider.of<LocationProvider>(context);

    LatLng getlocation = LatLng(location.getLatitude,location.getLongitude);
    print('print map $getlocation');


    return FlutterMap(
      options: MapOptions(
        center: getlocation,
        zoom: 17
      ),
      layers: [
        _crearMapa(),
        _drawMarker(getlocation),
        _drawPolyline(),
      ],
      
    );
  }

  TileLayerOptions _crearMapa() {

    return TileLayerOptions(
      urlTemplate: 'https://api.mapbox.com/v4/'
      '{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}',
      additionalOptions: {
        'accessToken': 'pk.eyJ1Ijoia2xlcml0aCIsImEiOiJjanY2MjF4NGIwMG9nM3lvMnN3ZDM1dWE5In0.0SfmUpbW6UFj7ZnRdRyNAw',
        'id': 'mapbox.streets'
      },
      //backgroundColor: Colors.black,
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

  PolylineLayerOptions _drawPolyline(){
    var points = <LatLng>[
      LatLng(3.353732, -76.523345),
      LatLng(3.354476, -76.523455),
      LatLng(3.354392, -76.522335),
    ];

    return PolylineLayerOptions( polylines: [
              Polyline(points: points,strokeWidth: 4.0,color: Colors.purple),
            ],);
  }



}