import 'dart:convert';

import 'package:coscos/api/Error.dart';

TopEvent topEventFromJson(String str) => TopEvent.fromJson(json.decode(str));

String topEventToJson(TopEvent data) => json.encode(data.toJson());

class TopEvent {
  TopEvent({
    required this.data,
    required this.error,
  });

  List<TopEventModel> data;
  Error error;

  factory TopEvent.fromJson(Map<String, dynamic> json) => TopEvent(
        data: List<TopEventModel>.from(
            json["data"].map((x) => TopEventModel.fromJson(x))),
        error: Error.fromJson(json["error"]),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "error": error.toJson(),
      };
  factory TopEvent.dataError(int errorCode, String message) => TopEvent(
        data: [],
        error: Error.onError(errorCode, message),
      );
}

class TopEventModel {
  TopEventModel({
    required this.id,
    required this.idCountry,
    required this.idProvinces,
    required this.idCity,
    required this.name,
    required this.address,
    required this.city,
    required this.provinces,
    required this.country,
    required this.description,
    required this.lat,
    required this.long,
    required this.price,
    required this.imageUrl,
    required this.visitor,
    required this.date,
  });

  String id;
  String idCountry;
  String idProvinces;
  String idCity;
  String name;
  String address;
  String city;
  String provinces;
  String country;
  String description;
  String lat;
  String long;
  String price;
  String imageUrl;
  String visitor;
  DateTime date;

  factory TopEventModel.fromJson(Map<String, dynamic> json) => TopEventModel(
        id: json["id"],
        idCountry: json["id_country"],
        idProvinces: json["id_provinces"],
        idCity: json["id_city"],
        name: json["name"],
        address: json["address"],
        city: json["city"],
        provinces: json["provinces"],
        country: json["country"],
        description: json["description"],
        lat: json["lat"],
        long: json["long"],
        price: json["price"],
        imageUrl: json["image_url"],
        visitor: json["visitor"],
        date: DateTime.parse(json["date"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_country": idCountry,
        "id_provinces": idProvinces,
        "id_city": idCity,
        "name": name,
        "address": address,
        "city": city,
        "provinces": provinces,
        "country": country,
        "description": description,
        "lat": lat,
        "long": long,
        "price": price,
        "image_url": imageUrl,
        "visitor": visitor,
        "date": date.toIso8601String(),
      };
}
