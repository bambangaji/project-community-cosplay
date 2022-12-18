// To parse this JSON data, do
//
//     final register = registerFromJson(jsonString);

// ignore_for_file: file_names

import 'package:coscos/api/Error.dart';
import 'dart:convert';

Register registerFromJson(String str) => Register.fromJson(json.decode(str));

String registerToJson(Register data) => json.encode(data.toJson());

class Register {
  Register({
    required this.data,
    required this.error,
  });

  RegisterData data;
  Error error;

  factory Register.fromJson(Map<String, dynamic> json) => Register(
        data: RegisterData.fromJson(json["data"]),
        error: Error.fromJson(json["error"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "error": error.toJson(),
      };
  factory Register.dataError(int errorCode, String message) => Register(
        data: RegisterData(email: "", id: "", name: ""),
        error: Error.onError(errorCode, message),
      );
}

class RegisterData {
  RegisterData({
    required this.id,
    required this.name,
    required this.email,
  });

  String id;
  String name;
  String email;

  factory RegisterData.fromJson(Map<String, dynamic> json) => RegisterData(
        id: json["id"],
        name: json["name"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
      };
}

Login loginFromJson(String str) => Login.fromJson(json.decode(str));

String loginToJson(Login data) => json.encode(data.toJson());

class Login {
  Login({
    required this.data,
    required this.error,
  });

  LoginData data;
  Error error;

  factory Login.fromJson(Map<String, dynamic> json) => Login(
        data: LoginData.fromJson(json["data"]),
        error: Error.fromJson(json["error"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "error": error.toJson(),
      };

  factory Login.dataError(int errorCode, String message) => Login(
        data: LoginData(email: "", id: "", name: "", isActive: 0),
        error: Error.onError(errorCode, message),
      );
}

class LoginData {
  LoginData({
    required this.id,
    required this.name,
    required this.email,
    required this.isActive,
  });

  String id;
  String name;
  String email;
  int isActive;

  factory LoginData.fromJson(Map<String, dynamic> json) => LoginData(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        isActive: json["is_active"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "is_active": isActive,
      };
}
