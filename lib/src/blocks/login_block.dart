import 'dart:async';

class LoginBloc{

  final _userController = StreamController<String>.broadcast();
  final _pasworddController = StreamController<String>.broadcast();

  // Insertar valores al Stream.
  Function(String) get changeUser => _userController.sink.add;
  Function(String) get changePassword => _pasworddController.sink.add;

  // Recuperar o escuchar los datos del Stream.
  Stream<String> get userStream => _userController.stream;
  Stream<String> get paswordStream => _pasworddController.stream;

  //Metodo cerrar Stream 

  dispose(){
    _userController?.close();
    _pasworddController?.close();
  }

}