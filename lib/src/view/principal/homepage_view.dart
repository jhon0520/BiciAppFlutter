import 'package:biciapp/src/provider/tabs_provider.dart';
import 'package:flutter/material.dart';
import 'package:biciapp/src/model/loginStyle/loginStyle_model.dart';
import 'package:biciapp/src/provider/switchappbarbuttom_provider.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

const List<String> imageSwiper = [
  "assets/swiper/bg0.jpeg",
  "assets/swiper/bg1.jpeg",
  "assets/swiper/bg2.jpeg",
];

class HomePagePrincipal extends StatelessWidget {
  const HomePagePrincipal({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    SwitchAppbarProvider dayModeProvider = Provider.of<SwitchAppbarProvider>(context);
    bool dayMode = dayModeProvider.dayMode;
    LoginPageStyleModel stylePage = LoginPageStyleModel();

    TabsProvider index = Provider.of<TabsProvider>(context);

    return Container(
      child: Column(  
        children: <Widget>[
          Container(
            height: size.height * 0.5,
        //     child: Image(
        //     image: AssetImage(imageSwiper[1]),
        //     fit: BoxFit.cover,
        // ),
            child: Swiper(
              itemBuilder: (BuildContext context, int index) {
                return new Image.asset(
                  imageSwiper[index],
                  fit: BoxFit.fill,
                );
              },
              
              scale: 0.8,
              curve: Curves.ease,
              autoplay: true,
              itemCount: imageSwiper.length,
              pagination: new SwiperPagination(),
              control: new SwiperControl(),
            ),
          ),
          Expanded(child: SizedBox(height: size.height*0.68,)),
          _startButtom(context, dayMode, stylePage, index),
          SizedBox(height: 5.0),
          _reedemersButtom(context, dayMode, stylePage),
          SizedBox(height: 10.0),
        ],
      ),
    );
  }

    Widget _startButtom(BuildContext context, bool dayMode, LoginPageStyleModel stylePage, TabsProvider tabIndex) {
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
        onPressed: (){
        tabIndex.pageSelectedChange = 3;
        },
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