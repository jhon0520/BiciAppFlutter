import 'package:biciapp/src/provider/api/trafficConsulting_provider.dart';
import 'package:biciapp/src/utils/local_notications_helper.dart';
import 'package:flutter/material.dart';
import 'package:latlong/latlong.dart';
import 'package:biciapp/src/provider/chronometer_provider.dart';
import 'package:biciapp/src/provider/geoLocation_provider.dart';
import 'package:biciapp/src/global/switchappbarbuttom_global.dart';
import 'package:biciapp/src/global/wallpaper_global.dart';
import 'package:biciapp/src/model/loginStyle/loginStyle_model.dart';
import 'package:biciapp/src/provider/switchappbarbuttom_provider.dart';
import 'package:biciapp/src/view/principal/principalPage_view.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

int counter = 0;

class PrincipalPage extends StatefulWidget {
  PrincipalPage({Key key}) : super(key: key);

  _PrincipalPageState createState() => _PrincipalPageState();
}

class _PrincipalPageState extends State<PrincipalPage> {

  final notifications = FlutterLocalNotificationsPlugin();
  

  @override
  void initState() {
    super.initState();

    final settingsAndroid = AndroidInitializationSettings('app_icon');
    final settingsIOS = IOSInitializationSettings(
        onDidReceiveLocalNotification: (id, title, body, payload) =>
            onSelectNotification(payload));

    notifications.initialize(
        InitializationSettings(settingsAndroid, settingsIOS),
        onSelectNotification: onSelectNotification);
  }

  Future onSelectNotification(String payload) async => await Navigator.pushReplacementNamed(context, 'principal');


  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    // Get location on all pages
    ChronometerProvider timer = Provider.of<ChronometerProvider>(context);
    LocationProvider geoposition = Provider.of<LocationProvider>(context);
    TrafficProvider trafficProvider = Provider.of<TrafficProvider>(context);

    bool streetRobbery = geoposition.getStreetRobbery;
    LatLng getlocation = LatLng(geoposition.getLatitude,geoposition.getLongitude);

    if ((int.parse(timer.stopwatchText.substring(6, 8)) % 5) == 0 && !timer.isStart && geoposition.getisStarted) {
        
        geoposition.getPosition();
        if(3.457088 > getlocation.latitude && 3.435853 < getlocation.latitude &&
             -76.545545 < getlocation.longitude && -76.525545 > getlocation.longitude && streetRobbery
            ){
              showSilentNotification(notifications, title: 'RoadApp', body: 'Ten cuidado, esta zona es peligrosa.', id: 30);
              streetRobbery = false;
          }else if(3.436042 > getlocation.latitude && 3.431242 < getlocation.latitude &&
             -76.527099 < getlocation.longitude && -76.522099 > getlocation.longitude && streetRobbery
             ){
            showSilentNotification(notifications, title: 'RoadApp', body: 'Ten cuidado, esta zona es peligrosa.', id: 30);
            streetRobbery = false;
          }
          else if(3.411684 > getlocation.latitude && 3.398684 < getlocation.latitude &&
             -76.529001 < getlocation.longitude && -76.517001 > getlocation.longitude && streetRobbery
             ){
            showSilentNotification(notifications, title: 'RoadApp', body: 'Ten cuidado, esta zona es peligrosa.', id: 30);
            streetRobbery = false;
          } if(3.392515 > getlocation.latitude && 3.384515 < getlocation.latitude &&
             -76.529991 < getlocation.longitude && -76.519991 > getlocation.longitude && streetRobbery
             ){
            showSilentNotification(notifications, title: 'RoadApp', body: 'Ten cuidado, esta zona es peligrosa.', id: 30);
            streetRobbery = false;
          }if(3.381675 > getlocation.latitude && 3.374675 < getlocation.latitude &&
             -76.542268 < getlocation.longitude && -76.535768 > getlocation.longitude && streetRobbery
             ){
            showSilentNotification(notifications, title: 'RoadApp', body: 'Ten cuidado, esta zona es peligrosa.', id: 30);
            streetRobbery = false;
          }
    }else if((int.parse(timer.stopwatchText.substring(3, 5)) % 5) == 0 && !timer.isStart && geoposition.getisStarted) {

      if ((int.parse(timer.stopwatchText.substring(3, 5))) == counter) {

        counter = counter + 5;

        trafficProvider.apiRequest(getlocation.latitude, getlocation.longitude).then((trafficData){
        //trafficProvider.apiRequest(3.353773, -76.521786).then((trafficData){
          if (trafficData.error == null) {
            print('good request');
          }else{
            print('bad request');
          }
        });
        
      }
      // trafficProvider.apiRequest(getlocation.latitude, getlocation.longitude).then((traffic){
        
      //   TrafficModel traffic;
      //   int arrayLength = traffic.flowSegmentData.coordinates.coordinate.length;

      //   if (traffic != null &&
      //     traffic.flowSegmentData.coordinates.coordinate[0].latitude > getlocation.latitude && traffic.flowSegmentData.coordinates.coordinate[arrayLength-1].latitude < getlocation.latitude &&
      //     traffic.flowSegmentData.coordinates.coordinate[0].latitude < getlocation.longitude && traffic.flowSegmentData.coordinates.coordinate[arrayLength-1].longitude > getlocation.longitude && streetRobbery
      // ) {
      //   showSilentNotification(notifications, title: 'RoadApp', body: 'Hay trafico en tu zona', id: 30);
      // }
      // });
      
    }

    Size size = MediaQuery.of(context).size;
    SwitchAppbarProvider dayModeProvider =
    Provider.of<SwitchAppbarProvider>(context);
    bool dayMode = dayModeProvider.dayMode;
    LoginPageStyleModel stylePage = LoginPageStyleModel();

    return Scaffold(
      appBar: AppBar(
        title: Container(          
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[Icon(Icons.directions_bike), SizedBox(width: 5), Text('RodApp')],
          ),
        ),
        centerTitle: true,
        actions: <Widget>[
          AppbarGlobal(),
        ],
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          WallpaperGlobal(),
          PrincipalPageView(size: size, dayMode: dayMode, stylePage: stylePage),
        ],
      ),
    );
  }
}
