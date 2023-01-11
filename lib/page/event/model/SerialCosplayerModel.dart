// To parse this JSON data, do
//
//     final SerialCosplayer = SerialCosplayerFromJson(jsonString);

import 'package:coscos/api/Error.dart';
import 'dart:convert';

SerialCosplayer? SerialCosplayerFromJson(String str) =>
    SerialCosplayer.fromJson(json.decode(str));

String SerialCosplayerToJson(SerialCosplayer? data) =>
    json.encode(data!.toJson());

class SerialCosplayer {
  SerialCosplayer({
    required this.data,
    required this.error,
  });

  List<SerialCosplayerData>? data;
  Error? error;

  factory SerialCosplayer.fromJson(Map<String, dynamic> json) =>
      SerialCosplayer(
        data: json["data"] == null
            ? []
            : List<SerialCosplayerData>.from(
                json["data"]!.map((x) => SerialCosplayerData.fromJson(x))),
        error: Error.fromJson(json["error"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "error": error!.toJson(),
      };
  factory SerialCosplayer.dataError(int errorCode, String message) =>
      SerialCosplayer(
        data: [],
        error: Error.onError(errorCode, message),
      );
}

class SerialCosplayerData {
  SerialCosplayerData({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.type,
    required this.count,
  });

  String? id;
  String? name;
  String? imageUrl;
  String? type;
  int? count;

  factory SerialCosplayerData.fromJson(Map<String, dynamic> json) =>
      SerialCosplayerData(
        id: json["id"],
        name: json["name"],
        imageUrl: json["image_url"],
        type: json["type"],
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image_url": imageUrl,
        "type": type,
        "count": count,
      };
}
