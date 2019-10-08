import 'package:biciapp/src/page/day_todolist_page.dart';
import 'package:biciapp/src/page/historylaps_page.dart';
import 'package:biciapp/src/page/night_todolist.dart';
import 'package:biciapp/src/page/register_page.dart';
import 'package:biciapp/src/page/rodinformation_page.dart';
import 'package:biciapp/src/page/rodreedem_page.dart';
import 'package:biciapp/src/provider/nighthtodolist_provider.dart';
import 'package:biciapp/src/provider/register_provider.dart';
import 'package:biciapp/src/provider/routedataapi_provider.dart';
import 'package:biciapp/src/provider/userdataapi_provider.dart';
import 'package:biciapp/src/provider/weatherConsulting_provider.dart';
import 'package:flutter/material.dart';

import 'package:biciapp/src/page/login_page.dart';
import 'package:biciapp/src/page/principal_page.dart';
import 'package:biciapp/src/provider/switchappbarbuttom_provider.dart';
import 'package:biciapp/src/provider/tabs_provider.dart';
import 'package:biciapp/src/provider/chronometer_provider.dart';
import 'package:biciapp/src/provider/geoLocation_provider.dart';

void main() => runApp(MyApp());

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // SwitchButtom Provider
        ChangeNotifierProvider(
          builder: (_) => SwitchAppbarProvider()
        ),
        ChangeNotifierProvider(
          builder: (_) => UserDataAPI(),
        ),
        ChangeNotifierProvider(
          builder: (_) =>RouteProvider(),
        ),
        ChangeNotifierProvider(
          builder: (_) => WeatherConsulting(),
        ),
        // TabsButtom Provider
        ChangeNotifierProvider(
          builder: (_) => TabsProvider()
        ),
        //Chronometer Provider
        ChangeNotifierProvider(
          builder: (_) => ChronometerProvider()
        ),
        // Location Provider
        ChangeNotifierProvider(
          builder: (_) => LocationProvider(),
        ),
        ChangeNotifierProvider(
          builder: (_) => RegisterProvider(),
        ),
        ChangeNotifierProvider(
          builder:  (_) => NightTodolistProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'biciapps App',
        initialRoute: 'login',
        routes: {          
          'login' : (context) => LoginPage(),
          'register' : (context) => RegisterPage(),
          'principal' : (context) => PrincipalPage(),
          'daytodolist' : (context) => DayTodolistPage(),
          'nighttodolist' : (context) => NightTodolistPage(),
          'rodinformation' : (context) => RodInformationPage(),
          'historylaps' : (context) => HistoryLapsPage(),
          'rodreedem' : (context) => RodReedemPage()
        },
      ),
    );
  }
}
