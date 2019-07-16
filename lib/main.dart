
import 'package:flutter/material.dart';
import 'package:prueba/src/pages/login_page.dart';
import 'package:prueba/src/pages/pruebs_page.dart';

void main() => runApp(MyApp());

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bici App',
      initialRoute: 'login',
      routes: {
        'login'  : (BuildContext context ) => LoginPage(),
        'prueba' : (BuildContext context ) => SnackBarDemo(),
      },

    );
  }
}