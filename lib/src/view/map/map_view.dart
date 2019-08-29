// import 'package:flutter/material.dart';
// import 'package:flutter_map/plugin_api.dart';
// import 'package:latlong/latlong.dart';

// class MapView extends StatelessWidget {
//   const MapView({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Column(
//         children: <Widget>[
//           _createMapSpecificatios(),
//         ],
//       ),
//     );
//   }

//   Widget _createMapSpecificatios(){
//     return Container(
//       child: FlutterMap(
//         options: MapOptions(
//           center: LatLng(3.3539414,-76.5245147,),
//           zoom: 10,
//         ),
//         layers: [
//           _createMap(),
//         ],
//       ),
//     );
//   }

//   TileLayerOptions _createMap(){
//     return TileLayerOptions(
//       urlTemplate: 'https://api.mapbox.com/v4/'
//       '{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}',
//       additionalOptions: {
//         'accessToken': 'pk.eyJ1IjoiamhvbjA1MjAiLCJhIjoiY2p6d2MzaTY1MTBhaDNsb2VidXVycDZkNiJ9.MbLLAeRxviwJLjt2E3P4ZA',
//         'id': 'mapbox.streets'
//       }
//     );
//   }

// }

import 'package:flutter/material.dart';

class MapView extends StatefulWidget {
  MapView({Key key}) : super(key: key);

  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: null,
    );
  }
}