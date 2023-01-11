// To parse this JSON data, do
//
//     final cosplayer = cosplayerFromJson(jsonString);

import 'package:coscos/api/Error.dart';
import 'dart:convert';

Cosplayer? cosplayerFromJson(String str) =>
    Cosplayer.fromJson(json.decode(str));

String cosplayerToJson(Cosplayer? data) => json.encode(data!.toJson());

class Cosplayer {
  Cosplayer({
    required this.data,
    required this.error,
  });

  List<CosplayerData>? data;
  Error? error;

  factory Cosplayer.fromJson(Map<String, dynamic> json) => Cosplayer(
        data: json["data"] == null
            ? []
            : List<CosplayerData>.from(
                json["data"]!.map((x) => CosplayerData.fromJson(x))),
        error: Error.fromJson(json["error"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "error": error!.toJson(),
      };
  factory Cosplayer.dataError(int errorCode, String message) => Cosplayer(
        data: [],
        error: Error.onError(errorCode, message),
      );
}

class CosplayerData {
  CosplayerData({
    required this.id,
    required this.name,
    required this.bio,
    required this.email,
    required this.facebook,
    required this.instagram,
  });

  String? id;
  String? name;
  String? bio;
  String? email;
  String? facebook;
  String? instagram;

  factory CosplayerData.fromJson(Map<String, dynamic> json) => CosplayerData(
        id: json["id"],
        name: json["name"],
        bio: json["bio"],
        email: json["email"],
        facebook: json["facebook"],
        instagram: json["instagram"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "bio": bio,
        "email": email,
        "facebook": facebook,
        "instagram": instagram,
      };
}
