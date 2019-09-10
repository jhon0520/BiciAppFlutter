import 'package:biciapp/src/utils/alert.dart';
import 'package:biciapp/src/view/login/loginPage_view.dart';
import 'package:flutter/material.dart';

import 'package:biciapp/src/model/loginStyle/loginStyle_model.dart';
import 'package:biciapp/src/provider/switchappbarbuttom_provider.dart';

String firstName;
String secondName;
String firstLastName;
String secondLastName;
String email;
String nickName;
String password;

class RegisterPageView extends StatelessWidget {
  const RegisterPageView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    Size size = MediaQuery.of(context).size;
    SwitchAppbarProvider dayModeProvider = Provider.of<SwitchAppbarProvider>(context);
    bool dayMode = dayModeProvider.dayMode;
    LoginPageStyleModel stylePage = LoginPageStyleModel();

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
                  'Registro de usuario',
                  style: dayMode
                      ? stylePage.titleDayModeStyle
                      : stylePage.titleNightModeStyle,
                ),
                SizedBox(height: 20.0),
                _firstNameTextField(dayMode, stylePage),
                SizedBox(height: 5.0),
                _secondNameTextField(dayMode, stylePage),
                SizedBox(height: 5.0),
                _firstLastNameTextField(dayMode, stylePage),
                SizedBox(height: 5.0),
                _secondLastNameTextField(dayMode, stylePage),
                SizedBox(height: 5.0),
                _emailTextField(dayMode, stylePage),
                SizedBox(height: 5.0),
                _userNameTextField(dayMode, stylePage),
                SizedBox(height: 5.0),
                _passwordTextField(dayMode, stylePage),
                SizedBox(height: 20.0),
                _registerButton(context, dayMode, stylePage),
              ],
            ),
          )
        ],
      ),
    );
  }

  ///  Section to create User Name TextField
  Widget _firstNameTextField(bool dayMode, LoginPageStyleModel stylePage) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        keyboardType: TextInputType.text,
        onChanged: (value) => firstName=value,
        cursorColor:
            (dayMode ? stylePage.colorTextDay : stylePage.colorTextNight),
        style: TextStyle(
            color:
                (dayMode ? stylePage.colorIconsDay : stylePage.colorIconNight)),
        decoration: InputDecoration(
          hintText: 'Primer Nombre',
          labelText: 'Primer Nombre',
          labelStyle: TextStyle(
              color: (dayMode
                  ? stylePage.colorTextDay
                  : stylePage.colorTextNight)),
          hintStyle: TextStyle(
              color: (dayMode
                  ? stylePage.colorTextDay
                  : stylePage.colorTextNight)),

          //Cambio de color cuando la barra inferior del TextField no esta seleccionada
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: (dayMode
                      ? stylePage.colorIconsDay
                      : stylePage.colorIconNight),
                  style: BorderStyle.solid)),
          //Cambio de color cuando la barra inferior del TextField esta seleccionada
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: (dayMode
                      ? stylePage.colorIconsDay
                      : stylePage.colorIconNight),
                  style: BorderStyle.solid)),
        ),
      ),
    );
  }

  Widget _secondNameTextField(bool dayMode, LoginPageStyleModel stylePage) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        keyboardType: TextInputType.text,
        onChanged: (value) => secondName=value,
        cursorColor:
            (dayMode ? stylePage.colorTextDay : stylePage.colorTextNight),
        style: TextStyle(
            color:
                (dayMode ? stylePage.colorIconsDay : stylePage.colorIconNight)),
        decoration: InputDecoration(
          hintText: 'Segundo Nombre',
          labelText: 'Segundo Nombre',
          labelStyle: TextStyle(
              color: (dayMode
                  ? stylePage.colorTextDay
                  : stylePage.colorTextNight)),
          hintStyle: TextStyle(
              color: (dayMode
                  ? stylePage.colorTextDay
                  : stylePage.colorTextNight)),

          //Cambio de color cuando la barra inferior del TextField no esta seleccionada
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: (dayMode
                      ? stylePage.colorIconsDay
                      : stylePage.colorIconNight),
                  style: BorderStyle.solid)),
          //Cambio de color cuando la barra inferior del TextField esta seleccionada
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: (dayMode
                      ? stylePage.colorIconsDay
                      : stylePage.colorIconNight),
                  style: BorderStyle.solid)),
        ),
      ),
    );
  }

  Widget _firstLastNameTextField(bool dayMode, LoginPageStyleModel stylePage) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        keyboardType: TextInputType.text,
        onChanged: (value) => firstLastName=value,
        cursorColor:
            (dayMode ? stylePage.colorTextDay : stylePage.colorTextNight),
        style: TextStyle(
            color:
                (dayMode ? stylePage.colorIconsDay : stylePage.colorIconNight)),
        decoration: InputDecoration(
          hintText: 'Primer Apellido',
          labelText: 'Primer Apellido',
          labelStyle: TextStyle(
              color: (dayMode
                  ? stylePage.colorTextDay
                  : stylePage.colorTextNight)),
          hintStyle: TextStyle(
              color: (dayMode
                  ? stylePage.colorTextDay
                  : stylePage.colorTextNight)),

          //Cambio de color cuando la barra inferior del TextField no esta seleccionada
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: (dayMode
                      ? stylePage.colorIconsDay
                      : stylePage.colorIconNight),
                  style: BorderStyle.solid)),
          //Cambio de color cuando la barra inferior del TextField esta seleccionada
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: (dayMode
                      ? stylePage.colorIconsDay
                      : stylePage.colorIconNight),
                  style: BorderStyle.solid)),
        ),
      ),
    );
  }

  Widget _secondLastNameTextField(bool dayMode, LoginPageStyleModel stylePage) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        keyboardType: TextInputType.text,
        onChanged: (value) => secondLastName=value,
        cursorColor:
            (dayMode ? stylePage.colorTextDay : stylePage.colorTextNight),
        style: TextStyle(
            color:
                (dayMode ? stylePage.colorIconsDay : stylePage.colorIconNight)),
        decoration: InputDecoration(
          hintText: 'Segundo Apellido',
          labelText: 'Segundo Apellido',
          labelStyle: TextStyle(
              color: (dayMode
                  ? stylePage.colorTextDay
                  : stylePage.colorTextNight)),
          hintStyle: TextStyle(
              color: (dayMode
                  ? stylePage.colorTextDay
                  : stylePage.colorTextNight)),

          //Cambio de color cuando la barra inferior del TextField no esta seleccionada
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: (dayMode
                      ? stylePage.colorIconsDay
                      : stylePage.colorIconNight),
                  style: BorderStyle.solid)),
          //Cambio de color cuando la barra inferior del TextField esta seleccionada
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: (dayMode
                      ? stylePage.colorIconsDay
                      : stylePage.colorIconNight),
                  style: BorderStyle.solid)),
        ),
      ),
    );
  }

  Widget _emailTextField(bool dayMode, LoginPageStyleModel stylePage) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        onChanged: (value) => email=value,
        cursorColor:
            (dayMode ? stylePage.colorTextDay : stylePage.colorTextNight),
        style: TextStyle(
            color:
                (dayMode ? stylePage.colorIconsDay : stylePage.colorIconNight)),
        decoration: InputDecoration(
          hintText: 'Correo Electronico',
          labelText: 'Correo Electronico',
          labelStyle: TextStyle(
              color: (dayMode
                  ? stylePage.colorTextDay
                  : stylePage.colorTextNight)),
          hintStyle: TextStyle(
              color: (dayMode
                  ? stylePage.colorTextDay
                  : stylePage.colorTextNight)),

          //Cambio de color cuando la barra inferior del TextField no esta seleccionada
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: (dayMode
                      ? stylePage.colorIconsDay
                      : stylePage.colorIconNight),
                  style: BorderStyle.solid)),
          //Cambio de color cuando la barra inferior del TextField esta seleccionada
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: (dayMode
                      ? stylePage.colorIconsDay
                      : stylePage.colorIconNight),
                  style: BorderStyle.solid)),
        ),
      ),
    );
  }

  Widget _userNameTextField(bool dayMode, LoginPageStyleModel stylePage) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        keyboardType: TextInputType.text,
        onChanged: (value) => userName=value,
        cursorColor:
            (dayMode ? stylePage.colorTextDay : stylePage.colorTextNight),
        style: TextStyle(
            color:
                (dayMode ? stylePage.colorIconsDay : stylePage.colorIconNight)),
        decoration: InputDecoration(
          hintText: 'Nombre de Usuario',
          labelText: 'Nombre de Usuario',
          labelStyle: TextStyle(
              color: (dayMode
                  ? stylePage.colorTextDay
                  : stylePage.colorTextNight)),
          hintStyle: TextStyle(
              color: (dayMode
                  ? stylePage.colorTextDay
                  : stylePage.colorTextNight)),

          //Cambio de color cuando la barra inferior del TextField no esta seleccionada
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: (dayMode
                      ? stylePage.colorIconsDay
                      : stylePage.colorIconNight),
                  style: BorderStyle.solid)),
          //Cambio de color cuando la barra inferior del TextField esta seleccionada
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: (dayMode
                      ? stylePage.colorIconsDay
                      : stylePage.colorIconNight),
                  style: BorderStyle.solid)),
        ),
      ),
    );
  }

  Widget _passwordTextField(bool dayMode, LoginPageStyleModel stylePage) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        keyboardType: TextInputType.text,
        onChanged: (value) => password=value,
        cursorColor:
            (dayMode ? stylePage.colorTextDay : stylePage.colorTextNight),
        style: TextStyle(
            color:
                (dayMode ? stylePage.colorIconsDay : stylePage.colorIconNight)),
        decoration: InputDecoration(
          hintText: '******',
          labelText: 'Contraseña',
          labelStyle: TextStyle(
              color: (dayMode
                  ? stylePage.colorTextDay
                  : stylePage.colorTextNight)),
          hintStyle: TextStyle(
              color: (dayMode
                  ? stylePage.colorTextDay
                  : stylePage.colorTextNight)),

          //Cambio de color cuando la barra inferior del TextField no esta seleccionada
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: (dayMode
                      ? stylePage.colorIconsDay
                      : stylePage.colorIconNight),
                  style: BorderStyle.solid)),
          //Cambio de color cuando la barra inferior del TextField esta seleccionada
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: (dayMode
                      ? stylePage.colorIconsDay
                      : stylePage.colorIconNight),
                  style: BorderStyle.solid)),
        ),
      ),
    );
  }

  Widget _registerButton(BuildContext context, bool dayMode, LoginPageStyleModel stylePage) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: <Color>[
              Color(0xFF42A5F5),
              Color(0xFF1976D2),
              Color.fromRGBO(34, 139, 134, 100.0),
              //Color(0xFF0D47A1),
            ],
          ),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: MaterialButton(
        padding: EdgeInsets.symmetric(horizontal: 50.0,),
        onPressed: ()async {

        Navigator.pushReplacementNamed(context, 'login');
 
        },
        child: Text('Ingresar',
              style: TextStyle(color: (dayMode ? stylePage.colorTextDay : stylePage.colorTextNight),
              fontSize: 20)
        ),
      ),
    );
  }


}