import 'package:biciapp/src/provider/chronometer_provider.dart';
import 'package:biciapp/src/provider/geoLocation_provider.dart';
import 'package:flutter/material.dart';
import 'package:biciapp/src/global/switchappbarbuttom_global.dart';
import 'package:biciapp/src/global/wallpaper_global.dart';
import 'package:biciapp/src/model/loginStyle/loginStyle_model.dart';
import 'package:biciapp/src/provider/switchappbarbuttom_provider.dart';
import 'package:biciapp/src/view/principal/principalPage_view.dart';
import 'package:flutter/services.dart';

class PrincipalPage extends StatefulWidget {
  PrincipalPage({Key key}) : super(key: key);

  _PrincipalPageState createState() => _PrincipalPageState();
}

class _PrincipalPageState extends State<PrincipalPage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    // Get location on all pages
    ChronometerProvider timer = Provider.of<ChronometerProvider>(context);
    LocationProvider geoposition = Provider.of<LocationProvider>(context);

    if ((int.parse(timer.stopwatchText.substring(6, 8)) % 10) == 0 &&
        !timer.isStart && geoposition.getisStarted) {
      geoposition.getPosition();
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
