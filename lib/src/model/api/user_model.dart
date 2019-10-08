// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
    String type;
    int toursNumbers;
    List<Route> routes;
    String id;
    String firstName;
    String secondName;
    String firstLastName;
    String secondLastName;
    String email;
    String password;
    String nickName;
    DateTime birthDay;
    int weight;
    int age;
    int height;
    int v;

    bool response;
    String message;

    set setResponse (bool newResponse){
      this.response = newResponse;
    }

    UserModel({
        this.type,
        this.toursNumbers,
        this.routes,
        this.id,
        this.firstName,
        this.secondName,
        this.firstLastName,
        this.secondLastName,
        this.email,
        this.password,
        this.nickName,
        this.birthDay,
        this.weight,
        this.age,
        this.height,
        this.v,

        this.response,
        this.message
    });

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        type: json["type"],
        toursNumbers: json["toursNumbers"],
        routes: List<Route>.from(json["routes"].map((x) => Route.fromJson(x))),
        id: json["_id"],
        firstName: json["firstName"],
        secondName: json["secondName"],
        firstLastName: json["firstLastName"],
        secondLastName: json["secondLastName"],
        email: json["email"],
        password: json["password"],
        nickName: json["nickName"],
        birthDay: DateTime.parse(json["birthDay"]),
        weight: json["weight"],
        age: json["age"],
        height: json["height"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "toursNumbers": toursNumbers,
        "routes": List<dynamic>.from(routes.map((x) => x.toJson())),
        "_id": id,
        "firstName": firstName,
        "secondName": secondName,
        "firstLastName": firstLastName,
        "secondLastName": secondLastName,
        "email": email,
        "password": password,
        "nickName": nickName,
        "birthDay": "${birthDay.year.toString().padLeft(4, '0')}-${birthDay.month.toString().padLeft(2, '0')}-${birthDay.day.toString().padLeft(2, '0')}",
        "weight": weight,
        "age": age,
        "height": height,
        "__v": v,
    };
}

class Route {
    List<double> velocity;
    List<double> distance;
    int rods;
    String type;
    List<double> latitude;
    List<double> longitude;
    String id;
    DateTime routeDate;
    String time;
    int v;

    Route({
        this.velocity,
        this.distance,
        this.rods,
        this.type,
        this.latitude,
        this.longitude,
        this.id,
        this.routeDate,
        this.time,
        this.v,
    });

    factory Route.fromJson(Map<String, dynamic> json) => Route(
        velocity: List<double>.from(json["velocity"].map((x) => x.toDouble())),
        distance: List<double>.from(json["distance"].map((x) => x.toDouble())),
        type: json["type"],
        latitude: List<double>.from(json["latitude"].map((x) => x.toDouble())),
        longitude: List<double>.from(json["longitude"].map((x) => x.toDouble())),
        id: json["_id"],
        routeDate: DateTime.parse(json["routeDate"]),
        time: json["time"],
         rods: json["rods"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "velocity": List<dynamic>.from(velocity.map((x) => x)),
        "distance": List<dynamic>.from(distance.map((x) => x)),
        "type": type,
        "latitude": List<dynamic>.from(latitude.map((x) => x)),
        "longitude": List<dynamic>.from(longitude.map((x) => x)),
        "_id": id,
        "routeDate": routeDate.toIso8601String(),
        "time": time,
        "rods": rods,
        "__v": v,
    };
}
