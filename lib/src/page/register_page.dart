import 'package:biciapp/src/view/register/registerPage_view.dart';
import 'package:flutter/material.dart';
import 'package:biciapp/src/global/wallpaper_global.dart';
import 'package:biciapp/src/global/switchappbarbuttom_global.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login page'),
        centerTitle: true,
        actions: <Widget>[
          AppbarGlobal(),
        ],
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          WallpaperGlobal(),
          RegisterPageView(),
        ],
      ),
    );
  }
}