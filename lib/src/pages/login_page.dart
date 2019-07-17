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
        title: Text('RODAPP'),
        centerTitle: true,
        actions: <Widget>[
          _switchButton(),
        ],
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          _fondo(),
          _loginInputs(),
        ],
      ),
    );
  }

  Widget _fondo() {
    Container containerMode = Container();

    if (dayMode) {
      containerMode = Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.lightBlue[50],
        child: Image(
          image: AssetImage('assets/img/fondo.png'),
          fit: BoxFit.fill,
        ),
      );
    } else if (!dayMode) {
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
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _crearUsuario() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          icon: Icon(
            Icons.account_circle,
            color: Colors.black,
            size: 50.0,
          ),
          hintText: 'ejemplo@correo.com',
          labelText: 'Usuario',
          counterText: 'Usuario',
          labelStyle: TextStyle(color: Colors.black),
          hintStyle: TextStyle(color: Colors.black),
        ),
      ),
    );
  }

  Widget _crearContrasena() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        obscureText: true,
        decoration: InputDecoration(
          icon: Icon(
            Icons.lock_outline,
            color: Colors.black,
            size: 50.0,
          ),
          labelText: 'Contraseña',
          counterText: 'Contraseña',
          labelStyle: TextStyle(color: Colors.black),
          hintStyle: TextStyle(color: Colors.black),
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

  Widget _crearOlvidoContrasena(){

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
        )
    );
  }

  Widget _olvidarContrasenayRegistro() {
    return Positioned(
      top: MediaQuery.of(context).size.height / 2.4,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(left: 15),
        color: Colors.transparent,
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
        ),
      ),
    );
  }

  Widget _redesSociales() {
    return Positioned(
      top: MediaQuery.of(context).size.height / 1.7,
      child: Container(
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
      ),
    );
  }
}
