// To parse this JSON data, do
//
//     final ListCharacter = ListCharacterFromJson(jsonString);

import 'package:coscos/api/Error.dart';
import 'dart:convert';

ListCharacter listCharacterFromJson(String str) =>
    ListCharacter.fromJson(json.decode(str));

String listCharacterToJson(ListCharacter data) => json.encode(data.toJson());

class ListCharacter {
  ListCharacter({
    required this.data,
    required this.error,
  });

  List<Character> data;
  Error error;

  factory ListCharacter.fromJson(Map<String, dynamic> json) => ListCharacter(
        data: json["data"] == null
            ? []
            : List<Character>.from(
                json["data"].map((x) => Character.fromJson(x))),
        error: Error.fromJson(json["error"]),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "error": error.toJson(),
      };
  factory ListCharacter.dataError(int errorCode, String message) =>
      ListCharacter(
        data: [],
        error: Error.onError(errorCode, message),
      );
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
  factory CharacterData.dataError(int errorCode, String message) =>
      CharacterData(
        data: Character.onError(),
        error: Error.onError(errorCode, message),
      );
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

  factory Character.onError() => Character(
        id: "",
        idSerial: "",
        name: "",
        imageUrl: "",
        gender: "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_serial": idSerial,
        "name": name,
        "image_url": imageUrl,
        "gender": gender,
      };
}
