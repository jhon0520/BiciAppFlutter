import 'package:flutter/material.dart';
import 'package:latlong/latlong.dart';
import 'package:biciapp/src/model/api/user_model.dart';
import 'package:flutter/foundation.dart';
export 'package:provider/provider.dart';

class HistoryLapsProvider extends ChangeNotifier {

  String _optionSelected = '0.0 Tus rutas';
  int _count = 0;
  int _dropDownPosition = 0;

  List<String> _dropDownListOptios = [];
  List<List<LatLng>> _polilyneList = <List<LatLng>>[];
  List<LatLng> _coordenades = <LatLng>[];

  get getOptionSelected => _optionSelected;
  get getCount => _count;
  get getDropDownPosition => _dropDownPosition;
  get getDropDownListOptios => _dropDownListOptios;

  List<List<LatLng>> get getPolilyneList => _polilyneList;
  get getCoordenades => _coordenades;

  set setOptionSelected (String newOptionSelected){
    _optionSelected = newOptionSelected;
    notifyListeners();
  }
  set setCount (int newcount){
    _count = newcount;
  }

  set setDropDownPositon (int newPosition){
    _dropDownPosition = newPosition;
  }

  set setDropDownListOptios(String newDropDownListOptios){
    _dropDownListOptios.add(newDropDownListOptios);
  }

  set setPolilyneList (List<LatLng> newPolilyneList){
    _polilyneList.add(newPolilyneList);
    //notifyListeners();
  }  
  set setCoordenades(LatLng newCoodernades){
    _coordenades.add(newCoodernades);
    //notifyListeners();
  }

  void initState(UserModel userData ){

    if(getCount == 0){
      setDropDownListOptios = '0.0 Tus rutas';
      setCount = 1;

      int index1 = 0, index2 = 0;

      for (index1 = 0 ; index1< userData.routes.length; index1++){

        getCoordenades.clear();
        
        if(index1 >= 9){
          setDropDownListOptios = "${index1+1}. " + userData.routes[index1].routeDate.toString().substring(0,10);
        }else{
          setDropDownListOptios = "0${index1+1}. " + userData.routes[index1].routeDate.toString().substring(0,10);
        }

        //final latitudeindex = userData.routes[index1].latitude.length;
        for(index2= 0; index2 < userData.routes[index1].latitude.length; index2++){
          final latitude = userData.routes[index1].latitude[index2];
          final longitude = userData.routes[index1].longitude[index2];
          setCoordenades = LatLng(latitude,longitude);
        }

        setPolilyneList = getCoordenades;
        //print(getPolilyneList);
      }
    }

  }

  void searchDataRoute(int arrayPosition, UserModel userData){

    
      //setDropDownListOptios = '0.0 Tus rutas';
      setCount = 1;
      getPolilyneList.clear();

      int index2 = 0;

        getCoordenades.clear();
        
        for(index2= 0; index2 < userData.routes[arrayPosition-1].latitude.length; index2++){
          final latitude = userData.routes[arrayPosition-1].latitude[index2];
          final longitude = userData.routes[arrayPosition-1].longitude[index2];
          setCoordenades = LatLng(latitude,longitude);
        }

        setPolilyneList = getCoordenades;
        //print(getPolilyneList);

  }

  void restarted (){
    getDropDownListOptios.clear();
    getPolilyneList.clear();
    setOptionSelected = '0.0 Tus rutas';
    setCount = 0;
    setDropDownPositon = 0;
  }

}