import 'package:flutter/material.dart';
import 'package:prueba/src/global/switchappbarbuttom_global.dart';
import 'package:prueba/src/global/wallpaper_global.dart';
import 'package:prueba/src/view/login/loginPage_view.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

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
          LoginPageView(),
        ],
      ),
    );
  }
}