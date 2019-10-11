import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:biciapp/src/model/loginStyle/loginStyle_model.dart';
import 'package:biciapp/src/provider/switchappbarbuttom_provider.dart';
import 'package:biciapp/src/provider/userdataapi_provider.dart';
import 'package:biciapp/src/utils/alert.dart';

// UserDataAPI api = new UserDataAPI();
String userName;
String passWord;

class LoginPageView extends StatelessWidget {
  const LoginPageView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    UserDataAPI user = Provider.of<UserDataAPI>(context);

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
                  'Iniciar Sesión',
                  style: dayMode
                      ? stylePage.titleDayModeStyle
                      : stylePage.titleNightModeStyle,
                ),
                SizedBox(height: 20.0),
                _userTextField(dayMode, stylePage),
                SizedBox(height: 20.0),
                _passwordTextField(dayMode, stylePage),
                SizedBox(height: 20.0),
                _loginButton(context, user, dayMode, stylePage),
                SizedBox(height: 20.0),
                _forgetPasswordText(context, dayMode, stylePage, size),
                SizedBox(height: 20.0),
                _socialNetworkLogin(dayMode, stylePage, size),
              ],
            ),
          ),
        ],
      ),
    );
  }

  ///  Section to create User Name TextField
  Widget _userTextField(bool dayMode, LoginPageStyleModel stylePage) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        onChanged: (value) => userName=value,
        cursorColor:
            (dayMode ? stylePage.colorTextDay : stylePage.colorTextNight),
        style: TextStyle(
            color:
                (dayMode ? stylePage.colorIconsDay : stylePage.colorIconNight)),
        decoration: InputDecoration(
          icon: Icon(Icons.account_circle,
              color: (dayMode
                  ? stylePage.colorIconsDay
                  : stylePage.colorIconNight),
              size: 50.0),
          hintText: 'ejemplo@correo.com',
          labelText: 'Usuario',
          counterText: 'Usuario',
          counterStyle: TextStyle(
              color: (dayMode
                  ? stylePage.colorTextDay
                  : stylePage.colorTextNight)),
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

  /// Section to create PassWord TextField
  Widget _passwordTextField(bool dayMode, LoginPageStyleModel stylePage) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        obscureText: true,
        onChanged: (value) => passWord=value,
        style: TextStyle(
            color:
                (dayMode ? stylePage.colorTextDay : stylePage.colorTextNight)),
        decoration: InputDecoration(
          icon: Icon(Icons.lock_outline,
              color: (dayMode
                  ? stylePage.colorIconsDay
                  : stylePage.colorIconNight),
              size: 50.0),
          labelText: 'Contraseña',
          counterText: 'Contraseña',
          counterStyle: TextStyle(
              color: (dayMode
                  ? stylePage.colorTextDay
                  : stylePage.colorTextNight)),
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

  /// Section to create Buttom to Login
  Widget _loginButton(BuildContext context, UserDataAPI user,bool dayMode, LoginPageStyleModel stylePage) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: (dayMode ? stylePage.buttomGradientColorsDay : stylePage.buttomGradientColorsNight),
          ),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: MaterialButton(
        padding: EdgeInsets.symmetric(horizontal: 50.0,),
        onPressed: ()async {

          try {
            UserModel response = await user.apiRequest(userName, passWord);

            user.setUserModel = response;

              if(response.response){
               Navigator.pushReplacementNamed(context, 'principal');
              }else{
                 showAlert(context, 'Login', 'Credenciales ingresadas incorrectas');
              }

          } catch (e) {
            showAlert(context, 'Login', 'En estos momentos presentamos problemas con la red.');
          }
        },
        child: Text('Ingresar',
              //style: TextStyle(color: (dayMode ? stylePage.colorTextDay : stylePage.colorTextNight),
              style: TextStyle(color: stylePage.colorTextButtom,
              fontSize: 20)
        ),
      ),
    );
  }

  /// Section to create Forget your password
  Widget _forgetPasswordText(BuildContext context,bool dayMode, LoginPageStyleModel stylePage, Size size){
    return Container(
      child: Column(
      children: <Widget>[
        FlatButton(
          color: Colors.transparent,
          textColor: dayMode ? stylePage.colorTextDay : stylePage.colorTextNight,
          child: Text('Olvidaste tu contraseña?'),
          onPressed: () {
            //print('holasssssssssss');
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('No tienes cuenta?',
                style: TextStyle(
                  color: dayMode ? stylePage.colorTextDay : stylePage.colorTextNight,
                )),
            FlatButton(
              color: Colors.transparent,
              textColor: dayMode ? stylePage.colorTextDay : stylePage.colorTextNight,
              child: Text('Registrate'),
              onPressed: () {
              Navigator.pushNamed(context, 'register');
              },
            ),
          ],
        ),
        Container(
          color: Colors.transparent,
          width: size.width / 1.5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                  child: Divider(
                color: dayMode ? stylePage.colorTextDay : stylePage.colorTextNight,
              )),
              Text(
                " O ",
                style: TextStyle(color: (dayMode ? stylePage.colorTextDay : stylePage.colorTextNight)),
              ),
              Expanded(
                  child: Divider(
                color: dayMode ? stylePage.colorTextDay : stylePage.colorTextNight,
              )),
            ],
          ),
        ),
      ],
      )
    );
  }

  ///  Section to create Social Network Login (doesn't work)
  Widget _socialNetworkLogin(bool dayMode, LoginPageStyleModel stylePage, Size size){
    return Container(
      color: Colors.transparent,
      width: size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Text(
            'Registrate con Redes Sociales',
            style: TextStyle(color: (dayMode ? stylePage.colorTextDay : stylePage.colorTextNight)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                icon: Image.asset('assets/icons/google.png'),
                iconSize: 50.0,
                onPressed: () {
                  //print('object Google');
                },
              ),
              SizedBox(
                width: size.width / 6,
              ),
              IconButton(
                icon: Image.asset('assets/icons/facebook.png'),
                iconSize: 50.0,
                onPressed: () {
                  //print('object facebook.');
                },
              ),
            ],
          ),
        ],
      ),
    );
  }


}
