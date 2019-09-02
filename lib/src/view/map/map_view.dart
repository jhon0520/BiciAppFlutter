import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

class MapView extends StatelessWidget {
  const MapView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return FlutterMap(
      options: MapOptions(
        center: LatLng(3.353571, -76.522356),
        zoom: 17
      ),
      layers: [
        _crearMapa(),
        _drawMarker(),
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
      }
    );
  }

  MarkerLayerOptions _drawMarker (){

    final markers = <Marker>[
      Marker(
        width: 80.0,
        height: 80.0,
        point: LatLng(3.353571, -76.522356),
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