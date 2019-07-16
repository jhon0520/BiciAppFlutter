import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool dayMode = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          'RODAPP',
          textAlign: TextAlign.center,
          style: TextStyle(),
        )),
        actions: <Widget>[
          _switchButton(),
        ],
      ),
      body: Stack(
        children: <Widget>[
          _colorFondo(),
          _imagenFondo(),
          _loginInputs(context),
        ],
      ),
    );
  }

  Widget _colorFondo() {
    if (dayMode) {
      return Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.lightBlue[50],
      );
    } else if (!dayMode) {
      return Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.black,
      );
    }
  }

  Widget _switchButton() {
    return Switch(
      value: dayMode,
      onChanged: (value) {
        setState(() {
          dayMode = value;
        });
      },
      activeThumbImage: Image.asset('assets/icons/sun.png').image,
      activeColor: Colors.white,
      activeTrackColor: Colors.yellow,
      inactiveThumbImage: Image.asset('assets/icons/moon.png').image,
      inactiveTrackColor: Colors.black,
    );
  }

  Widget _imagenFondo() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Image(
        image: AssetImage('assets/icons/fondo.png'),
        fit: BoxFit.fill,
      ),
    );
  }

  Widget _loginInputs(BuildContext context) {
    final estiloTitulo = TextStyle(
        color: Colors.black, fontWeight: FontWeight.w600, fontSize: 40.0);

    return SafeArea(
      child: Column(
        children: <Widget>[
          SizedBox(height: 50.0),
          Text(
            'Iniciar Sesión',
            style: estiloTitulo,
          ),
          SizedBox(height: 50.0),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
                icon: Icon(
                  Icons.account_circle,
                  color: Colors.black,
                  size: 50.0,
                ),
                labelText: 'Usuario',
                labelStyle: TextStyle(color: Colors.black, fontSize: 25.0),
                helperStyle: TextStyle(color: Colors.white24),
                contentPadding: EdgeInsets.symmetric(horizontal: 20.0)),
          ),
          SizedBox(
            height: 30.0,
          ),
          //Contraseña
          TextField(
            obscureText: true,
            decoration: InputDecoration(
                icon: Icon(
                  Icons.lock_outline,
                  color: Colors.black,
                  size: 50.0,
                ),
                labelText: 'Contraseña',
                labelStyle: TextStyle(color: Colors.black, fontSize: 25.0),
                helperStyle: TextStyle(color: Colors.white24),
                contentPadding: EdgeInsets.symmetric(horizontal: 20.0)),
          ),
          // Login Button.
          SizedBox(height: 30),
          Builder(
            builder: (context) => RaisedButton(
                  onPressed: () {
                    final snackBar = SnackBar(
                      content: Text('Yay! A SnackBar!'),
                      // action: SnackBarAction(
                      //   label: 'Undo',
                      //   onPressed: () {
                      //     // Some code to undo the change.
                      //   },
                      // ),
                    );

                    // Find the Scaffold in the widget tree and use
                    // it to show a SnackBar.
                    Scaffold.of(context).showSnackBar(snackBar);
                  },
                  textColor: Colors.white,
                  padding: EdgeInsets.all(0.0),
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: <Color>[
                            Color(0xFF42A5F5),
                            Color(0xFF1976D2),
                            Color(0xFF0D47A1),
                          ],
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(5.0))),
                    // Padding del boton.
                    padding:
                        EdgeInsets.symmetric(horizontal: 50.0, vertical: 15.0),
                    child: Text('Ingresar', style: TextStyle(fontSize: 20)),
                  ),
                ),
          ),
        ],
      ),
    );
  }
}
