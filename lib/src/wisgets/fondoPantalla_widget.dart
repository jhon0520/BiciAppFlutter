import 'package:flutter/material.dart';

class FondoPantallaWidget extends StatelessWidget {

  bool dayModeActivate;

  FondoPantallaWidget({this.dayModeActivate});

  @override
  Widget build(BuildContext context) {

       Container containerMode = Container();

    if (dayModeActivate) {
      containerMode = Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.lightBlue[50],
        child: Image(
          image: AssetImage('assets/img/fondo.png'),
          fit: BoxFit.fill,
        ),
      );
    } else if (!dayModeActivate) {
      containerMode = Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.black,
        child: Image(
          image: AssetImage('assets/img/fondo.png'),
          fit: BoxFit.fill,
        ),
      );
    }

    return containerMode;
  }
}