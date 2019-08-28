import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba/src/provider/switchappbarbuttom_provider.dart';

class WallpaperGlobal extends StatelessWidget {
  const WallpaperGlobal({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final _changeState = Provider.of<SwitchAppbarProvider>(context);
    bool dayMode = _changeState.dayMode;

    return Container(
      width: double.infinity,
        height: double.infinity,
        color: dayMode ? Colors.lightBlue[50] : Colors.black,
        child: Image(
          image: AssetImage('assets/img/fondo.png'),
          fit: BoxFit.fill,
        ),
    );
  }
}