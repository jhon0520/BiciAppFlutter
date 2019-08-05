import 'package:flutter/material.dart';
import 'package:prueba/src/blocks/provider.dart';
import 'package:prueba/src/utils/colors_utils.dart';
import 'package:prueba/src/widgets/fondoPantalla_widget.dart';


class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool dayMode = true;
  ColorsUtils color = new ColorsUtils();

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

    final bloc = Provider.of(context);

    TextStyle tituloColor;

    if (dayMode) {
      tituloColor = color.estiloTituloDia;
    } else {
      tituloColor = color.estiloTituloNoche;
    }

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
                  style: tituloColor,
                ),
                SizedBox(height: 20.0),
                _crearUsuario(bloc),
                SizedBox(height: 20.0),
                _crearContrasena(bloc),
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

  Widget _crearUsuario(LoginBloc bloc) {
    Color colorIcono;
    Color colorTexto;
    if (dayMode) {
      colorIcono = color.colorIconDia;
      colorTexto = color.colorIconDia;
    } else {
      colorIcono = color.colorIconNight;
      colorTexto = color.colorTextoNight;
    }

    return StreamBuilder(
      stream: bloc.userStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            cursorColor: colorTexto,
            style: TextStyle(color: colorIcono),
            decoration: InputDecoration(
              icon: Icon(Icons.account_circle, color: colorIcono, size: 50.0),
              hintText: 'ejemplo@correo.com',
              labelText: 'Usuario',
              counterText: snapshot.data,
              counterStyle: TextStyle(color: colorTexto),
              labelStyle: TextStyle(color: colorTexto),
              hintStyle: TextStyle(color: colorTexto),

              //Cambio de color cuando la barra inferior del TextField no esta seleccionada
              enabledBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: colorIcono, style: BorderStyle.solid)),
              //Cambio de color cuando la barra inferior del TextField esta seleccionada
              focusedBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: colorIcono, style: BorderStyle.solid)),
            ),
            onChanged: (value){
              bloc.changeUser(value);
            },
          ),
        );
      },
    );
  }

  Widget _crearContrasena(LoginBloc bloc) {
    Color colorIcono;
    Color colorTexto;
    if (dayMode) {
      colorIcono = color.colorIconDia;
      colorTexto = color.colorIconDia;
    } else {
      colorIcono = color.colorIconNight;
      colorTexto = color.colorTextoNight;
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

          //Cambio de color cuando la barra inferior del TextField no esta seleccionada
          enabledBorder: UnderlineInputBorder(
              borderSide:
                  BorderSide(color: colorIcono, style: BorderStyle.solid)),
          //Cambio de color cuando la barra inferior del TextField esta seleccionada
          focusedBorder: UnderlineInputBorder(
              borderSide:
                  BorderSide(color: colorIcono, style: BorderStyle.solid)),
        ),
      ),
    );
  }

  Widget _crearBotonLogin() {
    Color colorTexto;
    if (dayMode) {
      colorTexto = color.colorIconDia;
    } else {
      colorTexto = color.colorTextoNight;
    }

    return Builder(
      builder: (context) => RaisedButton(
        onPressed: () {
          final snackBar = SnackBar(
            content: Text('Yay! A SnackBar!'),
          );
          Scaffold.of(context).showSnackBar(snackBar);
        },
        textColor: colorTexto,
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
              borderRadius: BorderRadius.all(Radius.circular(0.0))),
          // Padding del boton.
          padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 15.0),
          child: Text('Ingresar',
              style: TextStyle(color: colorTexto, fontSize: 20)),
        ),
      ),
    );
  }

  Widget _crearOlvidoContrasena() {
    Color colorTexto;
    if (dayMode) {
      colorTexto = color.colorIconDia;
    } else {
      colorTexto = color.colorTextoNight;
    }

    return Container(
        child: Column(
      children: <Widget>[
        FlatButton(
          color: Colors.transparent,
          textColor: colorTexto,
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
                  color: colorTexto,
                )),
            FlatButton(
              color: Colors.transparent,
              textColor: colorTexto,
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
              Expanded(
                  child: Divider(
                color: colorTexto,
              )),
              Text(
                " O ",
                style: TextStyle(color: colorTexto),
              ),
              Expanded(
                  child: Divider(
                color: colorTexto,
              )),
            ],
          ),
        ),
      ],
    ));
  }

  Widget _redesSociales() {
    Color colorTexto;
    if (dayMode) {
      colorTexto = color.colorIconDia;
    } else {
      colorTexto = color.colorTextoNight;
    }

    return Container(
      color: Colors.transparent,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Text(
            'Registrate con Redes Sociales',
            style: TextStyle(color: colorTexto),
          ),
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
