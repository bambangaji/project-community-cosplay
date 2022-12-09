// To parse this JSON data, do
//
//     final uploadImage = uploadImageFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

import 'package:coscos/api/Error.dart';

UploadImage uploadImageFromJson(String str) =>
    UploadImage.fromJson(json.decode(str));

String uploadImageToJson(UploadImage data) => json.encode(data.toJson());

class UploadImage {
  UploadImage({
    required this.data,
    required this.error,
  });

  Data data;
  Error error;

  factory UploadImage.fromJson(Map<String, dynamic> json) => UploadImage(
        data: Data.fromJson(json["data"]),
        error: Error.fromJson(json["error"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "error": error.toJson(),
      };
  factory UploadImage.dataError(int errorCode, String message) => UploadImage(
        data: Data(imageUrl: "", filename: ""),
        error: Error.onError(errorCode, message),
      );
}

class Data {
  Data({
    required this.imageUrl,
    required this.filename,
  });

  String imageUrl;
  String filename;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        imageUrl: json["image_url"],
        filename: json["filename"],
      );

  Map<String, dynamic> toJson() => {
        "image_url": imageUrl,
        "filename": filename,
      };
}
