// To parse this JSON data, do
//
//     final weatherModel = weatherModelFromJson(jsonString);

import 'dart:convert';

WeatherModel weatherModelFromJson(String str) => WeatherModel.fromJson(json.decode(str));

String weatherModelToJson(WeatherModel data) => json.encode(data.toJson());

class WeatherModel {
    Coord coord;
    List<Weather> weather;
    String base;
    Main main;
    int visibility;
    Wind wind;
    Clouds clouds;
    int dt;
    Sys sys;
    int timezone;
    int id;
    String name;
    int cod;

    WeatherModel({
        this.coord,
        this.weather,
        this.base,
        this.main,
        this.visibility,
        this.wind,
        this.clouds,
        this.dt,
        this.sys,
        this.timezone,
        this.id,
        this.name,
        this.cod,
    });

    factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
        coord: Coord.fromJson(json["coord"]),
        weather: List<Weather>.from(json["weather"].map((x) => Weather.fromJson(x))),
        base: json["base"],
        main: Main.fromJson(json["main"]),
        visibility: json["visibility"],
        wind: Wind.fromJson(json["wind"]),
        clouds: Clouds.fromJson(json["clouds"]),
        dt: json["dt"],
        sys: Sys.fromJson(json["sys"]),
        timezone: json["timezone"],
        id: json["id"],
        name: json["name"],
        cod: json["cod"],
    );

    Map<String, dynamic> toJson() => {
        "coord": coord.toJson(),
        "weather": List<dynamic>.from(weather.map((x) => x.toJson())),
        "base": base,
        "main": main.toJson(),
        "visibility": visibility,
        "wind": wind.toJson(),
        "clouds": clouds.toJson(),
        "dt": dt,
        "sys": sys.toJson(),
        "timezone": timezone,
        "id": id,
        "name": name,
        "cod": cod,
    };
}

class Clouds {
    int all;

    Clouds({
        this.all,
    });

    factory Clouds.fromJson(Map<String, dynamic> json) => Clouds(
        all: json["all"],
    );

    Map<String, dynamic> toJson() => {
        "all": all,
    };
}

class Coord {
    double lon;
    double lat;

    Coord({
        this.lon,
        this.lat,
    });

    factory Coord.fromJson(Map<String, dynamic> json) => Coord(
        lon: json["lon"].toDouble(),
        lat: json["lat"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "lon": lon,
        "lat": lat,
    };
}

class Main {
    double temp;
    int pressure;
    int humidity;
    double tempMin;
    double tempMax;

    Main({
        this.temp,
        this.pressure,
        this.humidity,
        this.tempMin,
        this.tempMax,
    });

    factory Main.fromJson(Map<String, dynamic> json) => Main(
        temp: json["temp"].toDouble(),
        pressure: json["pressure"],
        humidity: json["humidity"],
        tempMin: json["temp_min"].toDouble(),
        tempMax: json["temp_max"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "temp": temp,
        "pressure": pressure,
        "humidity": humidity,
        "temp_min": tempMin,
        "temp_max": tempMax,
    };
}

class Sys {
    int type;
    int id;
    String country;
    int sunrise;
    int sunset;

    Sys({
        this.type,
        this.id,
        this.country,
        this.sunrise,
        this.sunset,
    });

    factory Sys.fromJson(Map<String, dynamic> json) => Sys(
        type: json["type"],
        id: json["id"],
        country: json["country"],
        sunrise: json["sunrise"],
        sunset: json["sunset"],
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "id": id,
        "country": country,
        "sunrise": sunrise,
        "sunset": sunset,
    };
}

class Weather {
    int id;
    String main;
    String description;
    String icon;

    Weather({
        this.id,
        this.main,
        this.description,
        this.icon,
    });

    factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        id: json["id"],
        main: json["main"],
        description: json["description"],
        icon: json["icon"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "main": main,
        "description": description,
        "icon": icon,
    };
}

class Wind {
    double speed;
    int deg;

    Wind({
        this.speed,
        this.deg,
    });

    factory Wind.fromJson(Map<String, dynamic> json) => Wind(
        speed: json["speed"].toDouble(),
        deg: json["deg"],
    );

    Map<String, dynamic> toJson() => {
        "speed": speed,
        "deg": deg,
    };
}
