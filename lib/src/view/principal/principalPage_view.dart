import 'package:flutter/material.dart';
import 'package:prueba/src/model/loginStyle/loginStyle_model.dart';
import 'package:prueba/src/provider/tabs_provider.dart';
import 'package:prueba/src/view/principal/homepage_view.dart';

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
    

    final _pageOptions = [
      HomePagePrincipal(),
      Text('2'),
      Text('3')
    ];

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        fit: StackFit.expand,        
        children: <Widget>[
          _pageOptions[_selectedTab],
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
        },
        items: [
          BottomNavigationBarItem(
          icon: Icon(Icons.image),
          title: Text('Incio'),
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