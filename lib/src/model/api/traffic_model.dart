// To parse this JSON data, do
//
//  final trafficModel = trafficModelFromJson(jsonString);

import 'dart:convert';

TrafficModel trafficModelFromJson(String str) => TrafficModel.fromJson(json.decode(str));

TrafficModel trafficModelErrorFromJson(String str) => TrafficModel.fromErrorJson(json.decode(str));

String trafficModelToJson(TrafficModel data) => json.encode(data.toJson());

class TrafficModel {
    FlowSegmentData flowSegmentData;

    String error;
    int httpStatusCode;
    DetailedError detailedError;

    TrafficModel({
        this.flowSegmentData,

        this.error,
        this.httpStatusCode,
        this.detailedError,
    });

    factory TrafficModel.fromJson(Map<String, dynamic> json) => TrafficModel(
        flowSegmentData: FlowSegmentData.fromJson(json["flowSegmentData"]),
    );

    factory TrafficModel.fromErrorJson(Map<String, dynamic> json) => TrafficModel(
        error: json["error"],
        httpStatusCode: json["httpStatusCode"],
        detailedError: DetailedError.fromJson(json["detailedError"]),
    );

    Map<String, dynamic> toJson() => {
        "flowSegmentData": flowSegmentData.toJson(),
    };
}

class FlowSegmentData {
    String frc;
    int currentSpeed;
    int freeFlowSpeed;
    int currentTravelTime;
    int freeFlowTravelTime;
    double confidence;
    Coordinates coordinates;
    String version;

    FlowSegmentData({
        this.frc,
        this.currentSpeed,
        this.freeFlowSpeed,
        this.currentTravelTime,
        this.freeFlowTravelTime,
        this.confidence,
        this.coordinates,
        this.version,
    });

    factory FlowSegmentData.fromJson(Map<String, dynamic> json) => FlowSegmentData(
        frc: json["frc"],
        currentSpeed: json["currentSpeed"],
        freeFlowSpeed: json["freeFlowSpeed"],
        currentTravelTime: json["currentTravelTime"],
        freeFlowTravelTime: json["freeFlowTravelTime"],
        confidence: json["confidence"].toDouble(),
        coordinates: Coordinates.fromJson(json["coordinates"]),
        version: json["@version"],
    );

    Map<String, dynamic> toJson() => {
        "frc": frc,
        "currentSpeed": currentSpeed,
        "freeFlowSpeed": freeFlowSpeed,
        "currentTravelTime": currentTravelTime,
        "freeFlowTravelTime": freeFlowTravelTime,
        "confidence": confidence,
        "coordinates": coordinates.toJson(),
        "@version": version,
    };
}

class Coordinates {
    List<Coordinate> coordinate;

    Coordinates({
        this.coordinate,
    });

    factory Coordinates.fromJson(Map<String, dynamic> json) => Coordinates(
        coordinate: List<Coordinate>.from(json["coordinate"].map((x) => Coordinate.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "coordinate": List<dynamic>.from(coordinate.map((x) => x.toJson())),
    };
}

class Coordinate {
    double latitude;
    double longitude;

    Coordinate({
        this.latitude,
        this.longitude,
    });

    factory Coordinate.fromJson(Map<String, dynamic> json) => Coordinate(
        latitude: json["latitude"].toDouble(),
        longitude: json["longitude"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
    };
}

class DetailedError {
    String code;
    String message;

    DetailedError({
        this.code,
        this.message,
    });

    factory DetailedError.fromJson(Map<String, dynamic> json) => DetailedError(
        code: json["code"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
    };
}