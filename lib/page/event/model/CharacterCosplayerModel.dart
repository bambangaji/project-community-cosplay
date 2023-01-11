// To parse this JSON data, do
//
//     final characterCosplayer = characterCosplayerFromJson(jsonString);

import 'package:coscos/api/Error.dart';
import 'dart:convert';

import 'package:coscos/page/event/model/CosplayerModel.dart';

CharacterCosplayer? characterCosplayerFromJson(String str) =>
    CharacterCosplayer.fromJson(json.decode(str));

String characterCosplayerToJson(CharacterCosplayer? data) =>
    json.encode(data!.toJson());

class CharacterCosplayer {
  CharacterCosplayer({
    required this.data,
    required this.error,
  });

  List<CharacterCosplayerData>? data;
  Error? error;

  factory CharacterCosplayer.fromJson(Map<String, dynamic> json) =>
      CharacterCosplayer(
        data: json["data"] == null
            ? []
            : List<CharacterCosplayerData>.from(
                json["data"]!.map((x) => CharacterCosplayerData.fromJson(x))),
        error: Error.fromJson(json["error"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "error": error!.toJson(),
      };
  factory CharacterCosplayer.dataError(int errorCode, String message) =>
      CharacterCosplayer(
        data: [],
        error: Error.onError(errorCode, message),
      );
}

class CharacterCosplayerData {
  CharacterCosplayerData({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.gender,
    required this.count,
  });

  String? id;
  String? name;
  String? imageUrl;
  String? gender;
  int? count;
  bool isExpand = false;
  List<CosplayerData> cosplayer = [];

  factory CharacterCosplayerData.fromJson(Map<String, dynamic> json) =>
      CharacterCosplayerData(
        id: json["id"],
        name: json["name"],
        imageUrl: json["image_url"],
        gender: json["gender"],
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image_url": imageUrl,
        "gender": gender,
        "count": count,
      };
}
