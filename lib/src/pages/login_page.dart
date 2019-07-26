import 'package:flutter/material.dart';
import 'package:prueba/src/wisgets/fondoPantalla_widget.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool dayMode = true;

  final estiloTituloDia = TextStyle(
      color: Colors.black, fontWeight: FontWeight.w600, fontSize: 30.0);

  final estiloTituloNoche = TextStyle(
      color: Colors.white, fontWeight: FontWeight.w600, fontSize: 30.0);

  final estiloIcosDia = TextStyle(
      color: Colors.white, fontWeight: FontWeight.w600, fontSize: 30.0);

  Color colorIconDia = Colors.black;
  Color colorIconNight = Colors.white;

  Color colorTextoDia = Colors.black;
  Color colorTextoNight = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RODAPP'),
        centerTitle: true,
        actions: <Widget>[
          _switchButton(),
        ],
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          //_fondo(),
          FondoPantallaWidget(
            dayModeActivate: dayMode,
          ),
          _loginInputs(),
        ],
      ),
    );
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

  Widget _loginInputs() {
    final size = MediaQuery.of(context).size;

    final estiloTitulo = TextStyle(
        color: Colors.black, fontWeight: FontWeight.w600, fontSize: 30.0);

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SafeArea(
            child: Container(),
          ),
          Container(
            width: size.width * 0.90,
            margin: EdgeInsets.symmetric(vertical: 30.0),
            padding: EdgeInsets.symmetric(vertical: 50.0),
            color: Colors.transparent,
            child: Column(
              children: <Widget>[
                Text(
                  'Iniciar Sesión',
                  style: estiloTitulo,
                ),
                SizedBox(height: 20.0),
                _crearUsuario(),
                SizedBox(height: 20.0),
                _crearContrasena(),
                SizedBox(height: 20.0),
                _crearBotonLogin(),
                SizedBox(height: 20.0),
                _crearOlvidoContrasena(),
                SizedBox(height: 20.0),
                _redesSociales(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _crearUsuario() {
    Color colorIcono;
    Color colorTexto;
    if (dayMode) {
      colorIcono = colorIconDia;
      colorTexto = colorIconDia;
    } else {
      colorIcono = colorIconNight;
      colorTexto = colorTextoNight;
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        cursorColor: colorTexto,
        
        decoration: InputDecoration(
          icon: Icon(Icons.account_circle, color: colorIcono, size: 50.0),
          hintText: 'ejemplo@correo.com',
          labelText: 'Usuario',
          counterText: 'Usuario',
          counterStyle: TextStyle(color: colorTexto),
          labelStyle: TextStyle(color: colorTexto),
          hintStyle: TextStyle(color: colorTexto),
        ),
      ),
    );
  }

  Widget _crearContrasena() {
    Color colorIcono;
    Color colorTexto;
    if (dayMode) {
      colorIcono = colorIconDia;
      colorTexto = colorIconDia;
    } else {
      colorIcono = colorIconNight;
      colorTexto = colorTextoNight;
    }
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        obscureText: true,
        style: TextStyle(color: colorTexto),
        decoration: InputDecoration(
          icon: Icon(Icons.lock_outline, color: colorIcono, size: 50.0),
          labelText: 'Contraseña',
          counterText: 'Contraseña',
          counterStyle: TextStyle(color: colorTexto),
          labelStyle: TextStyle(color: colorTexto),
          hintStyle: TextStyle(color: colorTexto),
        ),
      ),
    );
  }

  Widget _crearBotonLogin() {
    return Builder(
      builder: (context) => RaisedButton(
        onPressed: () {
          final snackBar = SnackBar(
            content: Text('Yay! A SnackBar!'),
          );
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
                  Color.fromRGBO(34, 139, 134, 100.0),
                  //Color(0xFF0D47A1),
                ],
              ),
              borderRadius: BorderRadius.all(Radius.circular(5.0))),
          // Padding del boton.
          padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 15.0),
          child: Text('Ingresar', style: TextStyle(fontSize: 20)),
        ),
      ),
    );
  }

  Widget _crearOlvidoContrasena() {
    return Container(
        child: Column(
      children: <Widget>[
        FlatButton(
          color: Colors.transparent,
          textColor: Colors.black,
          child: Text('Olvidaste tu contraseña?'),
          onPressed: () {
            print('holasssssssssss');
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('No tienes cuenta?',
                style: TextStyle(
                  color: Colors.black,
                )),
            FlatButton(
              color: Colors.transparent,
              textColor: Colors.black,
              child: Text('Registrate'),
              onPressed: () {
                print('holasssssssssss');
                Navigator.pushNamed(context, 'registro');
              },
            ),
          ],
        ),
        Container(
          color: Colors.transparent,
          width: MediaQuery.of(context).size.width / 1.5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(child: Divider()),
              Text(" O "),
              Expanded(child: Divider()),
            ],
          ),
        ),
      ],
    ));
  }

  Widget _redesSociales() {
    return Container(
      color: Colors.transparent,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Text('Registrate con Redes Sociales'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                icon: Image.asset('assets/icons/google.png'),
                iconSize: 50.0,
                onPressed: () {
                  print('object Google');
                },
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 6,
              ),
              IconButton(
                icon: Image.asset('assets/icons/facebook.png'),
                iconSize: 50.0,
                onPressed: () {
                  print('object facebook.');
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
