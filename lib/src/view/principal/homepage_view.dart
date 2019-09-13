import 'package:biciapp/src/provider/tabs_provider.dart';
import 'package:flutter/material.dart';
import 'package:biciapp/src/model/loginStyle/loginStyle_model.dart';
import 'package:biciapp/src/provider/switchappbarbuttom_provider.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

const List<String> imageSwiper_night = [
  "assets/swiper/Slider00.png",
  "assets/swiper/Slider01.png",
  "assets/swiper/Slider02.png",
  "assets/swiper/Slider03.png",
  "assets/swiper/Slider04.png",
  "assets/swiper/Slider05.png",
];
const List<String> imageSwiper_day = [
  "assets/swiper/Slider0.png",
  "assets/swiper/Slider1.png",
  "assets/swiper/Slider2.png",
  "assets/swiper/Slider3.png",
  "assets/swiper/Slider4.png",
  "assets/swiper/Slider5.png",
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
      padding: EdgeInsets.all(15),
      child: Column(  
        children: <Widget>[
          _swiperContent(size, dayMode),
          Expanded(child: SizedBox(height: size.height*0.68,)),
          _startButtom(context, dayMode, stylePage, index),
          SizedBox(height: 5.0),
          _reedemersButtom(context, dayMode, stylePage),
          SizedBox(height: 10.0),
        ],
      ),
    );
  }

  Widget _swiperContent (Size size, bool dayMode){
    return Container(
            height: size.height * 0.5,
            child: Swiper(
              itemBuilder: (BuildContext context, int index) {
                return new Image.asset(
                  (dayMode ? imageSwiper_day[index] : imageSwiper_night[index]),
                  fit: BoxFit.fill,
                );
              },
              
              scale: 0.8,
              autoplayDelay: 5000,
              curve: Curves.ease,
              autoplay: true,
              itemCount: (dayMode ? imageSwiper_day.length : imageSwiper_night.length),
              pagination: SwiperPagination(),
              control: SwiperControl(
                color: Colors.white
              ),
            ),
          );
  }

    Widget _startButtom(BuildContext context, bool dayMode, LoginPageStyleModel stylePage, TabsProvider tabIndex) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: (dayMode ? stylePage.buttomGradientColorsDay : stylePage.buttomGradientColorsNight),
          ),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: MaterialButton(
        padding: EdgeInsets.symmetric(horizontal: 75.0,),
        onPressed: (){
        tabIndex.pageSelectedChange = 3;
        },
        child: Text('Iniciar Recorrido',
              style: TextStyle(color: (dayMode ? stylePage.colorTextButtom : stylePage.colorTextNight),
              fontSize: 20)
        ),
      ),
    );
  }

    Widget _reedemersButtom (BuildContext context, bool dayMode, LoginPageStyleModel stylePage) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: (dayMode ? stylePage.buttomGradientColorsDay : stylePage.buttomGradientColorsNight),
          ),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: MaterialButton(
        padding: EdgeInsets.symmetric(horizontal: 70.0,),
        onPressed: (){
          // Navigator.pushNamed(context, 'rodinformation');
          Navigator.pushNamed(context, 'rodreedem');
        },
        child: Text('Redime tus Roads',
              style: TextStyle(color: (dayMode ? stylePage.colorTextButtom : stylePage.colorTextNight),
              fontSize: 20)
        ),
      ),
    );
  }


}