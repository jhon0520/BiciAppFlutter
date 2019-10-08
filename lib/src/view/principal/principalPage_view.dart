import 'package:biciapp/src/provider/geoLocation_provider.dart';
import 'package:biciapp/src/view/map/map_view.dart';
import 'package:biciapp/src/view/principal/routinepage_view.dart';
import 'package:biciapp/src/view/progress/progress_view.dart';
import 'package:flutter/material.dart';
import 'package:biciapp/src/model/loginStyle/loginStyle_model.dart';
import 'package:biciapp/src/provider/tabs_provider.dart';
import 'package:biciapp/src/view/principal/homepage_view.dart';

class PrincipalPageView extends StatelessWidget {

  Size size ;
  bool dayMode;
  LoginPageStyleModel stylePage;

  PrincipalPageView({Key key,
    @required this.size, @required this.dayMode, @required this.stylePage 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    TabsProvider index = Provider.of<TabsProvider>(context);
    int _selectedTab = index.position;
    int _pageSelected = index.pageSelected;

    LocationProvider locationProvider = Provider.of<LocationProvider>(context);
    

    final _pageOptions = [
      HomePagePrincipal(),
      MapView(),
      ProgressPage(),
      RoutinePage(),
    ];

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        fit: StackFit.expand,        
        children: <Widget>[
          //_pageOptions[_selectedTab],
          _pageOptions[_pageSelected],
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        backgroundColor: dayMode ? stylePage.colorBackGroundTabsDay : stylePage.colorBackGroundTabsNight,
        selectedIconTheme: dayMode ? stylePage.styleIconTabsSelectedDay : stylePage.styleIconTabsSelectedNight,
        selectedItemColor: dayMode ? stylePage.colorTabsSelectedDay : stylePage.colorTabsSelectedNight,
        unselectedItemColor: Colors.grey,
        unselectedIconTheme: IconThemeData(color: Colors.grey),
        onTap: (value){
          index.positionChange = value;

          if(value == 0 && locationProvider.getisStarted){
            index.pageSelectedChange = 3;
          }else{
            index.pageSelectedChange = value;
          }
          
        },
        items: [
          BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text('Inicio'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.room),
          title: Text('Mapa'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.directions_bike,),
          title: Text('Progreso')
        ),
        ]
      ),
    );
  }
}