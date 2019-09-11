import 'package:biciapp/src/model/loginStyle/loginStyle_model.dart';
import 'package:biciapp/src/provider/switchappbarbuttom_provider.dart';
import 'package:flutter/material.dart';

String roadText = "Los Road's son una moneda virtual no disponible en el momento. \n\n Esta moneda existe con el fin de " +
      "estimular tu progreso y buen uso de la bicicleta ciclo carriles y ciclorutas que se encuentran en tu ciudad. " +
      "Podrás ganar un Road luego de haber recorrido como mínimo 1 Km en bicicleta" +
      "\n\n Puedes obtener descuentos en talleres de bicicletas, comida, entretenimiento y demás con tu moneda Road";

class RodInformationView extends StatelessWidget {
  const RodInformationView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    SwitchAppbarProvider dayModeProvider = Provider.of<SwitchAppbarProvider>(context);
    LoginPageStyleModel stylePage = LoginPageStyleModel();
    bool dayMode = dayModeProvider.dayMode;


    return Container(
      child: Column(
        children: <Widget>[
          SizedBox(height: 40),
          _informationText(dayMode, stylePage),
        ],
      ),
    );
  }

  Widget _informationText(bool dayMode, LoginPageStyleModel stylePage){
    return Container(
      padding: EdgeInsets.all(50),
      child: Column(
        children: <Widget>[
          Text(roadText,
          style: TextStyle(
            color: dayMode ? stylePage.colorTextDay : stylePage.colorTextNight,
            fontSize: 20, fontFamily: 'bold')),
        ],
      ),
    );
  }


}