
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _count = 0;

  bool _value1 = true;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sample Code'),
        actions: <Widget>[
        new Switch(
          value: _value1,
          onChanged: (bool value){
            setState((){
            _value1 = value;
            } );
          },
          activeThumbImage: new Image.asset('assets/icons/sun.png').image,
          activeColor: Colors.white,
          activeTrackColor: Colors.yellow,
          inactiveThumbImage: new Image.asset('assets/icons/moon.png').image,
          inactiveTrackColor: Colors.black,
         ),
        ],
      ),
      body: prueba(),
          );
        }
      
        Widget prueba() {

          if(_value1){
            return Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: new Image.asset('assets/icons/fondo.jpeg').image,
                  fit: BoxFit.cover,
                )
              ),
            );
          }
          else{
            return Container(
             decoration: BoxDecoration(
                image: DecorationImage(
                  image: new Image.asset('assets/icons/fondo2.jpg').image,
                  fit: BoxFit.cover,
                )
              ),
            );
          }
        }
}