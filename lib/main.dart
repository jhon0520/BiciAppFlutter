import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:prueba/src/page/login_page.dart';
import 'package:prueba/src/page/principal_page.dart';
import 'package:prueba/src/provider/switchappbarbuttom_provider.dart';
import 'package:prueba/src/provider/tabs_provider.dart';

void main() => runApp(MyApp());

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          builder: (_) => SwitchAppbarProvider()
        ),
        ChangeNotifierProvider(
          builder: (_) => TabsProvider()
        ),
        ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pruebas App',
        initialRoute: 'login',
        routes: {          
          'login' : (context) => LoginPage(),
          'principal' : (context) => PrincipalPage()
        },
      ),
    );
  }
}
