import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba/src/provider/switchappbarbuttom_provider.dart';

class AppbarGlobal extends StatelessWidget {
  const AppbarGlobal({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    final _changeState = Provider.of<SwitchAppbarProvider>(context);
    bool dayMode = _changeState.dayMode;

          return Switch(
            value: dayMode,
            onChanged: (bool newValue) {
              _changeState.dayModeChange = newValue;
            },
            activeThumbImage: Image.asset('assets/icons/sun.png').image,
            activeColor: Colors.white,
            activeTrackColor: Colors.yellow,
            inactiveThumbImage: Image.asset('assets/icons/moon.png').image,
            inactiveTrackColor: Colors.black,
          );
        
  }
}