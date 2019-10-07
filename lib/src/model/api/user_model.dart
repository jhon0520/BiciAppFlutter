// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonStr

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
    String birthDay;
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
        birthDay: json["birthDay"],
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
        "birthDay": birthDay,
        "weight": weight,
        "age": age,
        "height": height,
        "__v": v,
    };
    
}

class Route {
    List<double> velocity;
    List<double> distance;
    String type;
    List<List<int>> coordinates;
    String id;
    DateTime routeDate;
    String time;
    int v;

    Route({
        this.velocity,
        this.distance,
        this.type,
        this.coordinates,
        this.id,
        this.routeDate,
        this.time,
        this.v,
    });

    factory Route.fromJson(Map<String, dynamic> json) => Route(
        velocity: List<double>.from(json["velocity"].map((x) => x.toDouble())),
        distance: List<double>.from(json["distance"].map((x) => x.toDouble())),
        type: json["type"],
        coordinates: List<List<int>>.from(json["coordinates"].map((x) => List<int>.from(x.map((x) => x)))),
        id: json["_id"],
        routeDate: DateTime.parse(json["routeDate"]),
        time: json["time"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "velocity": List<dynamic>.from(velocity.map((x) => x)),
        "distance": List<dynamic>.from(distance.map((x) => x)),
        "type": type,
        "coordinates": List<dynamic>.from(coordinates.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "_id": id,
        "routeDate": routeDate.toIso8601String(),
        "time": time,
        "__v": v,
    };
}