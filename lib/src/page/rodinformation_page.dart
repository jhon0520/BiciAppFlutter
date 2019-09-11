import 'package:biciapp/src/view/rod_information/rodinformation_view.dart';
import 'package:flutter/material.dart';
import 'package:biciapp/src/global/switchappbarbuttom_global.dart';
import 'package:biciapp/src/global/wallpaper_global.dart';


class RodInformationPage extends StatelessWidget {
  const RodInformationPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          RodInformationView(),
        ],
      ),
    );
  }
}