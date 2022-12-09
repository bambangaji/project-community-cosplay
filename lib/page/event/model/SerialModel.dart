// To parse this JSON data, do
//
//     final listSerial = listSerialFromJson(jsonString);

// ignore_for_file: file_names

import 'package:coscos/api/Error.dart';
import 'dart:convert';

ListSerial listSerialFromJson(String str) =>
    ListSerial.fromJson(json.decode(str));

String listSerialToJson(ListSerial data) => json.encode(data.toJson());

class ListSerial {
  ListSerial({
    required this.data,
    required this.error,
  });

  List<Serial> data;
  Error error;

  factory ListSerial.fromJson(Map<String, dynamic> json) => ListSerial(
        data: List<Serial>.from(json["data"].map((x) => Serial.fromJson(x))),
        error: Error.fromJson(json["error"]),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "error": error.toJson(),
      };
  factory ListSerial.dataError(int errorCode, String message) => ListSerial(
        data: [],
        error: Error.onError(errorCode, message),
      );
}

SerialData serialDataFromJson(String str) =>
    SerialData.fromJson(json.decode(str));

String serialDataToJson(ListSerial data) => json.encode(data.toJson());

class SerialData {
  SerialData({
    required this.data,
    required this.error,
  });

  Serial data;
  Error error;

  factory SerialData.fromJson(Map<String, dynamic> json) => SerialData(
        data: Serial.fromJson(json["data"]),
        error: Error.fromJson(json["error"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "error": error.toJson(),
      };
  factory SerialData.dataError(int errorCode, String message) => SerialData(
        data: Serial.onError(),
        error: Error.onError(errorCode, message),
      );
}

class Serial {
  Serial({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.type,
    required this.isFromApi,
  });

  String id;
  String name;
  String imageUrl;
  String type;
  String isFromApi;

  factory Serial.fromJson(Map<String, dynamic> json) => Serial(
        id: json["id"] ?? "",
        name: json["name"],
        imageUrl: json["image_url"],
        type: json["type"],
        isFromApi: json["isFromAPI"] ?? "",
      );
  factory Serial.onError() => Serial(
        id: "",
        name: "",
        imageUrl: "",
        type: "",
        isFromApi: "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image_url": imageUrl,
        "type": type,
        "isFromAPI": isFromApi,
      };
}
