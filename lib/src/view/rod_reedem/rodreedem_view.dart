import 'package:biciapp/src/model/loginStyle/loginStyle_model.dart';
import 'package:biciapp/src/provider/switchappbarbuttom_provider.dart';
import 'package:flutter/material.dart';

class RodReedemView extends StatelessWidget {
  const RodReedemView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    SwitchAppbarProvider dayModeProvider = Provider.of<SwitchAppbarProvider>(context);
    bool dayMode = dayModeProvider.dayMode;
    LoginPageStyleModel stylePage = LoginPageStyleModel();

    return Container(
      padding: EdgeInsets.all(30),
      child: 
      Column(
        children: <Widget>[
          Text('Redime tus Rods', style: TextStyle(
            color: (dayMode ? stylePage.colorTextDay : stylePage.colorTextNight),
            fontSize: 30,
          ),
          ),
          SizedBox(height: 30,),
          Row(
            children: <Widget>[
              _createCuadricule((dayMode ? 0 : 1),dayMode, stylePage),
              SizedBox(width: 20,),
              _createCuadricule((dayMode ? 2 : 3),dayMode, stylePage),
            ],
          ),

          SizedBox(height: 30,),

          Row(
            children: <Widget>[
              _createCuadricule((dayMode ? 4 : 5),dayMode, stylePage),
              SizedBox(width: 20,),
              _createCuadricule((dayMode ? 6 : 7),dayMode, stylePage),
            ],
          ),

          SizedBox(height: 30,),

          Text('Esto es una función que estará disponible a futuro.',
          style: TextStyle(color: (dayMode ? stylePage.colorTextDay : stylePage.colorTextNight)),)
          
        ],
      ),
    );
  }

  Widget _createCuadricule(int imagePosition, bool dayMode, LoginPageStyleModel stylePage){
    List<String> img = <String>['assets/img/comida_day.png',
                                'assets/img/comida_night.png',
                                'assets/img/entretenimiento_day.png',
                                'assets/img/entretenimiento_night.png',
                                'assets/img/deporte_day.png',
                                'assets/img/deporte_night.png',
                                'assets/img/ropa_day.png',
                                'assets/img/ropa_night.png'
                                ];
    
    
    return Container(
      width: 150,
      height: 150,
      child: Stack(
        children: <Widget>[
          Image.asset(img[imagePosition],
          fit: BoxFit.contain),
          
        ],
      ),
    );
  }

}