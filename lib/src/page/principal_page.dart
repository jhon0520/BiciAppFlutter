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
