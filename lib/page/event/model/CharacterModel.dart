// To parse this JSON data, do
//
//     final ListCharacter = ListCharacterFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ListCharacter ListCharacterFromJson(String str) =>
    ListCharacter.fromJson(json.decode(str));

String ListCharacterToJson(ListCharacter data) => json.encode(data.toJson());

class ListCharacter {
  ListCharacter({
    required this.data,
    required this.error,
  });

  List<Character> data;
  Error error;

  factory ListCharacter.fromJson(Map<String, dynamic> json) => ListCharacter(
        data: List<Character>.from(
            json["data"].map((x) => Character.fromJson(x))),
        error: Error.fromJson(json["error"]),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "error": error.toJson(),
      };
}

CharacterData characterDataFromJson(String str) =>
    CharacterData.fromJson(json.decode(str));

String characterDataToJson(CharacterData data) => json.encode(data.toJson());

class CharacterData {
  CharacterData({
    required this.data,
    required this.error,
  });

  Character data;
  Error error;

  factory CharacterData.fromJson(Map<String, dynamic> json) => CharacterData(
        data: Character.fromJson(json["data"]),
        error: Error.fromJson(json["error"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "error": error.toJson(),
      };
}

class Character {
  Character({
    required this.id,
    required this.idSerial,
    required this.name,
    required this.imageUrl,
    required this.gender,
  });

  String id;
  String idSerial;
  String name;
  String imageUrl;
  String gender;

  factory Character.fromJson(Map<String, dynamic> json) => Character(
        id: json["id"] ?? "",
        idSerial: json["id_serial"] ?? "",
        name: json["name"],
        imageUrl: json["image_url"],
        gender: json["gender"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_serial": idSerial,
        "name": name,
        "image_url": imageUrl,
        "gender": gender,
      };
}

class Error {
  Error({
    required this.errorCode,
    required this.message,
  });

  String errorCode;
  String message;

  factory Error.fromJson(Map<String, dynamic> json) => Error(
        errorCode: json["errorCode"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "errorCode": errorCode,
        "message": message,
      };
}
