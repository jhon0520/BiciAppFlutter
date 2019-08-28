import 'package:flutter/material.dart';
import 'package:prueba/src/model/loginStyle/loginStyle_model.dart';
import 'package:prueba/src/provider/switchappbarbuttom_provider.dart';

class HomePagePrincipal extends StatelessWidget {
  const HomePagePrincipal({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    SwitchAppbarProvider dayModeProvider = Provider.of<SwitchAppbarProvider>(context);
    bool dayMode = dayModeProvider.dayMode;
    LoginPageStyleModel stylePage = LoginPageStyleModel();

    return Container(
      // child: Column(
      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //   children: <Widget>[
      //     Text('1',style: TextStyle(color: (dayMode ? stylePage.colorTextDay : stylePage.colorTextNight))),
      //     Text('2',style: TextStyle(color: (dayMode ? stylePage.colorTextDay : stylePage.colorTextNight))),
      //     Text('3',style: TextStyle(color: (dayMode ? stylePage.colorTextDay : stylePage.colorTextNight))),
      //     Container(
      //       child: null,
      //     ),
      //   ],
      // ),

    child: Column(
        
        children: <Widget>[
          Text('1',style: TextStyle(color: (dayMode ? stylePage.colorTextDay : stylePage.colorTextNight))),
          Text('2',style: TextStyle(color: (dayMode ? stylePage.colorTextDay : stylePage.colorTextNight))),
          Text('3',style: TextStyle(color: (dayMode ? stylePage.colorTextDay : stylePage.colorTextNight))),
          Expanded(child: SizedBox(height: size.height*0.68,)),
          _startButtom(context, dayMode, stylePage),
          SizedBox(height: 5.0),
          _reedemersButtom(context, dayMode, stylePage),
          SizedBox(height: 10.0),
        ],
      ),
    );
  }

    Widget _startButtom(BuildContext context, bool dayMode, LoginPageStyleModel stylePage) {
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
        padding: EdgeInsets.symmetric(horizontal: 75.0,),
        onPressed: (){},
        child: Text('Iniciar Recorrido',
              style: TextStyle(color: (dayMode ? stylePage.colorTextDay : stylePage.colorTextNight),
              fontSize: 20)
        ),
      ),
    );
  }

    Widget _reedemersButtom (BuildContext context, bool dayMode, LoginPageStyleModel stylePage) {
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
        padding: EdgeInsets.symmetric(horizontal: 70.0,),
        onPressed: (){},
        child: Text('Redime tus Roads',
              style: TextStyle(color: (dayMode ? stylePage.colorTextDay : stylePage.colorTextNight),
              fontSize: 20)
        ),
      ),
    );
  }


}