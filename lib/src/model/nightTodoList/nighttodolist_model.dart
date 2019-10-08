

class NightTodoListModel {
  String title;
  String text;
  int id;

  NightTodoListModel({this.id, this.title, this.text});

  static List<NightTodoListModel> getTodoList() {
    return <NightTodoListModel>[
      //NightTodoListModel(title: "", text: ""),
      NightTodoListModel(id: 0, title: "Luces", text: "Recuerda tener siempre revisar tus baterías para evitar accidentes y que los demás vehículos te puedan ver en la noche."),
      NightTodoListModel(id: 1,title: "Casco", text: "Recuerda que el uso del casco es algo obligatorio y que puede salvar tu vida en caso de un accidente."),
      NightTodoListModel(id: 2,title: "Chaleco reflectivo", text: "Recuerda que al igual que las luces, el chaleco reflectivo ayuda para que los demas vehiculos tambien te puedan ver en la noche."),
      NightTodoListModel(id: 3,title: "Presión de las llantas", text: "Recuerda siempre revisar tus llantas antes de cualquier salida que realices en tu bicicleta."),
      NightTodoListModel(id: 4,title: "Frenos", text: "Recuerda revisar los fresnos de tu bicicleta para que evitemos accidentes ya sea con peatones en la vía o algun otro vehiculo."),
      NightTodoListModel(id: 5,title: "hidratación", text: "Recuerda siempre llevar contigo una bebida hidratante."),
      NightTodoListModel(id: 6,title: "Clima", text: "Alista el protector contra la lluvia, es posible que llueva."),
    ];
  }
}