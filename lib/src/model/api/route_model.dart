// To parse this JSON data, do
//
//     final routeModel = routeModelFromJson(jsonString);

import 'dart:convert';

RouteModel routeModelFromJson(String str) => RouteModel.fromJson(json.decode(str));

String routeModelToJson(RouteModel data) => json.encode(data.toJson());

class RouteModel {
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

    bool response;
    String message;

    set setResponse (bool newResponse){
      this.response = newResponse;
    }

    RouteModel({
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

        this.response,
        this.message
    });

    factory RouteModel.fromJson(Map<String, dynamic> json) => RouteModel(
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
