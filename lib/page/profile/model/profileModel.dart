// To parse this JSON data, do
//
//     final profile = profileFromJson(jsonString);

import 'package:coscos/api/Error.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

ProfileModel? profileFromJson(String str) =>
    ProfileModel.fromJson(json.decode(str));

String profileToJson(ProfileModel? data) => json.encode(data!.toJson());

class ProfileModel {
  ProfileModel({
    required this.data,
    required this.error,
  });

  ProfileData data;
  Error? error;

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        data: ProfileData.fromJson(json["data"]),
        error: Error.fromJson(json["error"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "error": error!.toJson(),
      };
  factory ProfileModel.dataError(int errorCode, String message) => ProfileModel(
        data: ProfileData(
            name: "",
            email: "",
            facebook: "",
            instagram: "",
            tiktok: "",
            imageUrl: ""),
        error: Error.onError(errorCode, message),
      );
}

class ProfileData {
  ProfileData({
    required this.name,
    required this.email,
    required this.facebook,
    required this.instagram,
    required this.tiktok,
    required this.imageUrl,
  });

  String? name;
  String? email;
  String? facebook;
  String? instagram;
  String? tiktok;
  String? imageUrl;

  factory ProfileData.fromJson(Map<String, dynamic> json) => ProfileData(
        name: json["name"],
        email: json["email"],
        facebook: json["facebook"],
        instagram: json["instagram"],
        tiktok: json["tiktok"],
        imageUrl: json["imageURL"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "facebook": facebook,
        "instagram": instagram,
        "tiktok": tiktok,
        "imageURL": imageUrl,
      };
}
