// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
    bool ok;
    Usuario usuario;

    UserModel({
        this.ok,
        this.usuario,
    });

    factory UserModel.fromJson(Map<String, dynamic> json) => new UserModel(
        ok: json["ok"],
        usuario: Usuario.fromJson(json["usuario"]),
    );

    Map<String, dynamic> toJson() => {
        "ok": ok,
        "usuario": usuario.toJson(),
    };
}

class Usuario {
    String rol;
    String id;
    bool state;
    bool google;
    String primerNombre;
    String segundoNombre;
    String primerApellido;
    String segundoApellido;
    String correo;
    String nickName;
    int v;

    Usuario({
        this.rol,
        this.id,
        this.state,
        this.google,
        this.primerNombre,
        this.segundoNombre,
        this.primerApellido,
        this.segundoApellido,
        this.correo,
        this.nickName,
        this.v,
    });

    factory Usuario.fromJson(Map<String, dynamic> json) => new Usuario(
        rol: json["rol"],
        id: json["_id"],
        state: json["state"],
        google: json["google"],
        primerNombre: json["primerNombre"],
        segundoNombre: json["segundoNombre"],
        primerApellido: json["primerApellido"],
        segundoApellido: json["segundoApellido"],
        correo: json["correo"],
        nickName: json["nickName"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "rol": rol,
        "_id": id,
        "state": state,
        "google": google,
        "primerNombre": primerNombre,
        "segundoNombre": segundoNombre,
        "primerApellido": primerApellido,
        "segundoApellido": segundoApellido,
        "correo": correo,
        "nickName": nickName,
        "__v": v,
    };
}
