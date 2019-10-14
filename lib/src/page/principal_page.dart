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

    bool streetRobbery = geoposition.getStreetRobbery;
    LatLng getlocation = LatLng(geoposition.getLatitude,geoposition.getLongitude);

    if ((int.parse(timer.stopwatchText.substring(6, 8)) % 5) == 0 && !timer.isStart && geoposition.getisStarted) {
        
        geoposition.getPosition();

        if(3.477268 > getlocation.latitude && getlocation.latitude < 3.477640 && 
             3.475706 < getlocation.latitude && getlocation.latitude > 3.476184 &&

             3.477268 > getlocation.latitude && getlocation.latitude > 3.475706 &&
             3.477640 >  getlocation.latitude && getlocation.latitude > 3.476184 &&

            streetRobbery
            ){
              geoposition.setStreetRobbery = false;
              showSilentNotification(notifications, title: 'RoadApp', body: 'Cuidado, Zona peligrosa.', id: 30);
          }
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
