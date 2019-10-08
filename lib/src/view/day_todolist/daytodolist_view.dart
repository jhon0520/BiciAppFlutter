import 'package:biciapp/src/model/loginStyle/loginStyle_model.dart';
import 'package:biciapp/src/model/nightTodoList/nighttodolist_model.dart';
import 'package:biciapp/src/provider/nighthtodolist_provider.dart';
import 'package:biciapp/src/provider/switchappbarbuttom_provider.dart';
import 'package:biciapp/src/provider/tabs_provider.dart';
import 'package:biciapp/src/provider/weatherConsulting_provider.dart';
import 'package:biciapp/src/utils/alert.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

bool checked1 = false, checked2 = false, checked3 = false, checked4 = false;
bool checked5= false, checked6= false, checked7= false;

class DayTodoListView extends StatelessWidget {
  const DayTodoListView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    WeatherConsulting wheatherProvider = Provider.of<WeatherConsulting>(context);

    bool isRain = false;
    double minTemp = 0;

    WeatherModel weatherInfo = wheatherProvider.getWeatherModel;
    minTemp = weatherInfo.main.tempMin - 273.15;

    if(weatherInfo.weather[0].main == "Rain" && ( minTemp < 20.0 || minTemp < 22) ){
     isRain = true;
    }

    SwitchAppbarProvider dayModeProvider = Provider.of<SwitchAppbarProvider>(context);
    bool dayMode = dayModeProvider.dayMode;
    LoginPageStyleModel stylePage = LoginPageStyleModel();

    TabsProvider tabIndexProvider = Provider.of<TabsProvider>(context);

    NightTodolistProvider todolistProvider = Provider.of<NightTodolistProvider>(context);
    List<NightTodoListModel> todoListinformation = NightTodoListModel.getTodoList();
    
    return Container(
      child: SingleChildScrollView(
              child: Container(
          child: Column(
            children: <Widget>[
              SizedBox(height: 10.0),
              _radioButton1(todoListinformation[0].id, todolistProvider.getGrupValue1, todoListinformation[0].title, todoListinformation[0].text,todolistProvider, dayMode, stylePage),
              SizedBox(height: 10.0),
              _radioButton2(todoListinformation[1].id, todolistProvider.getGrupValue2, todoListinformation[1].title, todoListinformation[1].text,todolistProvider, dayMode, stylePage),
              SizedBox(height: 10.0),
              _radioButton3(todoListinformation[2].id, todolistProvider.getGrupValue3, todoListinformation[2].title, todoListinformation[2].text,todolistProvider, dayMode, stylePage),
              SizedBox(height: 10.0),
              _radioButton4(todoListinformation[3].id, todolistProvider.getGrupValue4, todoListinformation[3].title, todoListinformation[3].text,todolistProvider, dayMode, stylePage),
              SizedBox(height: 10.0),
              _radioButton5(todoListinformation[4].id, todolistProvider.getGrupValue5, todoListinformation[4].title, todoListinformation[4].text,todolistProvider, dayMode, stylePage),
              SizedBox(height: 10.0),
              isRain ? _radioButtonLluvia(todoListinformation[6].id, todolistProvider.getGrupValue5, todoListinformation[6].title, todoListinformation[6].text,todolistProvider, dayMode, stylePage) : null,
              SizedBox(height: 20.0),
              _startButtom(context, dayMode, stylePage, todolistProvider, tabIndexProvider)
            ],
            
          ),
        ),
      ),
    );
  }

  Widget _radioButton1 ( int todoListValue, int grupValue, String todoListTitle, String todoListSubtitle, NightTodolistProvider todolistProvider, bool dayMode, LoginPageStyleModel stylePage){
    return Container(
      child: RadioListTile(
          value: todoListValue,
          groupValue: grupValue,
          title: Text(todoListTitle, style: TextStyle(color: (dayMode ? stylePage.colorTextDay : stylePage.colorTextNight) )),
          subtitle: Text(todoListSubtitle ,style: TextStyle(color: (dayMode ? stylePage.colorTextDay : stylePage.colorTextNight))),
          onChanged: (value) {
            checked1 = true;
            todolistProvider.setGrupValue1 = value;
          },
          activeColor: (dayMode ? Colors.green[400] : Colors.blue[700]),
        ),
    );
  }

  Widget _radioButton2 ( int todoListValue, int grupValue, String todoListTitle, String todoListSubtitle, NightTodolistProvider todolistProvider, bool dayMode, LoginPageStyleModel stylePage){
    return Container(
      child: RadioListTile(
          value: todoListValue,
          groupValue: grupValue,
          title: Text(todoListTitle, style: TextStyle(color: (dayMode ? stylePage.colorTextDay : stylePage.colorTextNight) )),
          subtitle: Text(todoListSubtitle ,style: TextStyle(color: (dayMode ? stylePage.colorTextDay : stylePage.colorTextNight))),
          onChanged: (value) {
            print(value);
            checked2 = true;
            todolistProvider.setGrupValue2 = value;
          },
          activeColor: (dayMode ? Colors.green[400] : Colors.blue[700]),
        ),
    );
  }

  Widget _radioButton3 ( int todoListValue, int grupValue, String todoListTitle, String todoListSubtitle, NightTodolistProvider todolistProvider, bool dayMode, LoginPageStyleModel stylePage){
    return Container(
      child: RadioListTile(
          value: todoListValue,
          groupValue: grupValue,
          title: Text(todoListTitle, style: TextStyle(color: (dayMode ? stylePage.colorTextDay : stylePage.colorTextNight) )),
          subtitle: Text(todoListSubtitle ,style: TextStyle(color: (dayMode ? stylePage.colorTextDay : stylePage.colorTextNight))),
          onChanged: (value) {
            checked3 = true;
            todolistProvider.setGrupValue3 = value;
          },
          activeColor: (dayMode ? Colors.green[400] : Colors.blue[700]),
        ),
    );
  }

  Widget _radioButton4 ( int todoListValue, int grupValue, String todoListTitle, String todoListSubtitle, NightTodolistProvider todolistProvider, bool dayMode, LoginPageStyleModel stylePage){
    return Container(
      child: RadioListTile(
          value: todoListValue,
          groupValue: grupValue,
          title: Text(todoListTitle, style: TextStyle(color: (dayMode ? stylePage.colorTextDay : stylePage.colorTextNight) )),
          subtitle: Text(todoListSubtitle ,style: TextStyle(color: (dayMode ? stylePage.colorTextDay : stylePage.colorTextNight))),
          onChanged: (value) {
            checked4 = true;
            todolistProvider.setGrupValue4 = value;
          },
          activeColor: (dayMode ? Colors.green[400] : Colors.blue[700]),
        ),
    );
  }

  Widget _radioButton5 ( int todoListValue, int grupValue, String todoListTitle, String todoListSubtitle, NightTodolistProvider todolistProvider, bool dayMode, LoginPageStyleModel stylePage){
    return Container(
      child: RadioListTile(
          value: todoListValue,
          groupValue: grupValue,
          title: Text(todoListTitle, style: TextStyle(color: (dayMode ? stylePage.colorTextDay : stylePage.colorTextNight) )),
          subtitle: Text(todoListSubtitle ,style: TextStyle(color: (dayMode ? stylePage.colorTextDay : stylePage.colorTextNight))),
          onChanged: (value) {
            checked5 = true;
            todolistProvider.setGrupValue5 = value;
          },
          activeColor: (dayMode ? Colors.green[400] : Colors.blue[700]),
        ),
    );
  }

  Widget _radioButton6 ( int todoListValue, int grupValue, String todoListTitle, String todoListSubtitle, NightTodolistProvider todolistProvider, bool dayMode, LoginPageStyleModel stylePage){
    return Container(
      child: RadioListTile(
          value: todoListValue,
          groupValue: grupValue,
          title: Text(todoListTitle, style: TextStyle(color: (dayMode ? stylePage.colorTextDay : stylePage.colorTextNight) )),
          subtitle: Text(todoListSubtitle ,style: TextStyle(color: (dayMode ? stylePage.colorTextDay : stylePage.colorTextNight))),
          onChanged: (value) {
            checked6 = true;
            todolistProvider.setGrupValue6 = value;
          },
          activeColor: (dayMode ? Colors.green[400] : Colors.blue[700]),
        ),
    );
  }

  Widget _radioButton7 ( int todoListValue, int grupValue, String todoListTitle, String todoListSubtitle, NightTodolistProvider todolistProvider, bool dayMode, LoginPageStyleModel stylePage){
    return Container(
      child: RadioListTile(
          value: todoListValue,
          groupValue: grupValue,
          title: Text(todoListTitle, style: TextStyle(color: (dayMode ? stylePage.colorTextDay : stylePage.colorTextNight) )),
          subtitle: Text(todoListSubtitle ,style: TextStyle(color: (dayMode ? stylePage.colorTextDay : stylePage.colorTextNight))),
          onChanged: (value) {
            checked7 = true;
            todolistProvider.setGrupValue7 = value;
          },
          activeColor: (dayMode ? Colors.green[400] : Colors.blue[700]),
          
        ),
    );
  }

  Widget _radioButtonLluvia (int todoListValue, int grupValue, String todoListTitle, String todoListSubtitle, NightTodolistProvider todolistProvider, bool dayMode, LoginPageStyleModel stylePage){
    return Container(
      child: RadioListTile(
          value: todoListValue,
          groupValue: grupValue,
          title: Text(todoListTitle, style: TextStyle(color: (dayMode ? stylePage.colorTextDay : stylePage.colorTextNight) )),
          subtitle: Text(todoListSubtitle ,style: TextStyle(color: (dayMode ? stylePage.colorTextDay : stylePage.colorTextNight))),
          onChanged: (value) {
            checked7 = true;
            todolistProvider.setGrupValue7 = value;
          },
          activeColor: (dayMode ? Colors.green[400] : Colors.blue[700]),
          
        ),
    );
  }

  Widget _startButtom(BuildContext context, bool dayMode, LoginPageStyleModel stylePage, NightTodolistProvider todolistProvider, TabsProvider tabIndexProvider) {
    //TabsProvider tabIndex
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: (dayMode ? stylePage.buttomGradientColorsDay : stylePage.buttomGradientColorsNight),
          ),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: MaterialButton(
        padding: EdgeInsets.symmetric(horizontal: 75.0,),
        onPressed: (){

          if(checked1 && checked2 && checked3 && checked4 && checked5){
            todolistProvider.setGrupValue1 = 10;
            todolistProvider.setGrupValue2 = 11;
            todolistProvider.setGrupValue3 = 12;
            todolistProvider.setGrupValue4 = 13;
            todolistProvider.setGrupValue5 = 14;
            //todolistProvider.setGrupValue6 = 15;
            //todolistProvider.setGrupValue7 = 16;
            checked1 = false; checked2 = false; checked3 = false; checked4 = false;
            checked5 = false; checked6 = false; checked7 = false;
            tabIndexProvider.pageSelectedChange = 3;
            Navigator.pushNamed(context, 'principal');
          }else{
            showAlert(context, 'Mensaje', 'Hay casillas sin verificar');
          }
        
        },
        child: Text('Iniciar Recorrido',
              style: TextStyle(color: (dayMode ? stylePage.colorTextButtom : stylePage.colorTextNight),
              fontSize: 20)
        ),
      ),
    );
  }

}