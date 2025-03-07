import 'package:biciapp/src/provider/register_provider.dart';
import 'package:biciapp/src/utils/alert.dart';

import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import 'package:biciapp/src/model/loginStyle/loginStyle_model.dart';
import 'package:biciapp/src/provider/switchappbarbuttom_provider.dart';

RegisterProvider createUserRequest = new RegisterProvider();

String firstName;
String secondName;
String firstLastName;
String secondLastName;
String email;
String nickName;
String password;
String birthDay;
int weight;
int age;
int height;

class RegisterPageView extends StatelessWidget {
  const RegisterPageView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    Size size = MediaQuery.of(context).size;
    SwitchAppbarProvider dayModeProvider = Provider.of<SwitchAppbarProvider>(context);
    bool dayMode = dayModeProvider.dayMode;
    LoginPageStyleModel stylePage = LoginPageStyleModel();

    RegisterProvider registerProvider = Provider.of<RegisterProvider>(context);
    String birthDay = registerProvider.getdateNow;

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
                _nickNameTextField(dayMode, stylePage),
                SizedBox(height: 5.0),
                _passwordTextField(dayMode, stylePage),
                SizedBox(height: 20.0),
                _showDatePicker(context, dayMode, stylePage, registerProvider, birthDay),
                SizedBox(height: 10.0),
                _weightText(dayMode, stylePage),
                SizedBox(height: 10.0),
                _ageText(dayMode, stylePage),
                SizedBox(height: 10.0),
                _height(dayMode, stylePage),
                SizedBox(height: 20.0),
                _registerButton(context, dayMode, stylePage, registerProvider),
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

  Widget _nickNameTextField(bool dayMode, LoginPageStyleModel stylePage) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        keyboardType: TextInputType.text,
        onChanged: (value) => nickName = value,
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
        onChanged: (value) => password = value,
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

  Widget _showDatePicker(BuildContext context, bool dayMode, LoginPageStyleModel stylePage, RegisterProvider registerProvider, String dateNow){

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Fecha de nacimiento.',style: TextStyle(
              color: (dayMode
                  ? stylePage.colorTextDay
                  : stylePage.colorTextNight)),
          ),
          FlatButton(
              color: Colors.transparent,
              textColor: dayMode ? stylePage.colorTextDay : stylePage.colorTextNight,
              child: Text('$dateNow'),
              onPressed: () async {
                DateTime dateSelected = await registerProvider.selecDate(context);
                registerProvider.setDatePicked = DateFormat('yyyy-MM-dd').format(dateSelected);
                birthDay = DateFormat('yyyy-MM-dd').format(dateSelected);
              },
            ),
        ],
      ),
    );
  }

  Widget _weightText(bool dayMode, LoginPageStyleModel stylePage){

      return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        keyboardType: TextInputType.number,
        onChanged: (value) => weight = int.parse(value),
        cursorColor:
            (dayMode ? stylePage.colorTextDay : stylePage.colorTextNight),
        style: TextStyle(
            color:
                (dayMode ? stylePage.colorIconsDay : stylePage.colorIconNight)),
        decoration: InputDecoration(
          hintText: 'Peso en Kg',
          labelText: 'Peso',
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

  Widget _ageText(bool dayMode, LoginPageStyleModel stylePage){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        keyboardType: TextInputType.number,
        onChanged: (value) => age = int.parse(value),
        cursorColor:
            (dayMode ? stylePage.colorTextDay : stylePage.colorTextNight),
        style: TextStyle(
            color:
                (dayMode ? stylePage.colorIconsDay : stylePage.colorIconNight)),
        decoration: InputDecoration(
          hintText: 'Edad',
          labelText: 'Edad',
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

  Widget _height(bool dayMode, LoginPageStyleModel stylePage){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        keyboardType: TextInputType.number,
        onChanged: (value) => height = int.parse(value),
        cursorColor:
            (dayMode ? stylePage.colorTextDay : stylePage.colorTextNight),
        style: TextStyle(
            color:
                (dayMode ? stylePage.colorIconsDay : stylePage.colorIconNight)),
        decoration: InputDecoration(
          hintText: 'Altura en centimetros.',
          labelText: 'Altura',
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

  Widget _registerButton(BuildContext context, bool dayMode, LoginPageStyleModel stylePage, RegisterProvider registerProvider) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: (dayMode ? stylePage.buttomGradientColorsDay : stylePage.buttomGradientColorsNight),
          ),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: MaterialButton(
        padding: EdgeInsets.symmetric(horizontal: 50.0,),
        onPressed: () async {
        
        UserModel response = await createUserRequest.apiRequest(
          firstName,
          secondName,
          firstLastName,
          secondLastName,
          email,
          nickName,
          password,
          birthDay,
          weight,
          age,
          height
        );

           if(response.response){
             Navigator.of(context, rootNavigator: true).pop('login');
           }else{
             showAlert(context, 'Login', 'Credenciales ingresadas incorrectas');
           }
        // Navigator.pushReplacementNamed(context, 'login');
        // Navigator.of(context, rootNavigator: true).pop('login');
 
        },
        child: Text('Registrar',
              style: TextStyle(color: (dayMode ? stylePage.colorTextButtom : stylePage.colorTextNight),
              fontSize: 20)
        ),
      ),
    );
  }


}