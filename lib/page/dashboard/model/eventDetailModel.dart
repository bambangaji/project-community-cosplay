// To parse this JSON data, do
//
//     final eventDetail = eventDetailFromJson(jsonString);

import 'package:coscos/api/Error.dart';
import 'package:coscos/page/dashboard/model/anime.dart';
import 'package:coscos/page/dashboard/model/guestStarModel.dart';
import 'package:coscos/page/event/model/SerialCosplayerModel.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

EventDetail eventDetailFromJson(String str) =>
    EventDetail.fromJson(json.decode(str));

String eventDetailToJson(EventDetail data) => json.encode(data.toJson());

class EventDetail {
  EventDetail({
    required this.data,
    required this.error,
  });

  EventDetailData data;
  Error error;

  factory EventDetail.fromJson(Map<String, dynamic> json) => EventDetail(
        data: EventDetailData.fromJson(json["data"]),
        error: Error.fromJson(json["error"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "error": error.toJson(),
      };

  factory EventDetail.dataError(int errorCode, String message) => EventDetail(
        data: EventDetailData.onError(),
        error: Error.onError(errorCode, message),
      );
}

class EventDetailData {
  EventDetailData(
      {required this.id,
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
      required this.instagram,
      required this.whatsapp,
      required this.facebook,
      required this.email,
      required this.imageEventData,
      required this.capacity,
      required this.visitor,
      required this.schedule,
      required this.rules,
      required this.guest_star});

  String id;
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
  String instagram;
  String whatsapp;
  String facebook;
  String email;
  List<Guest> guest_star = [];
  List<SerialCosplayerData> anime = [];
  List<ImageEventData> imageEventData = [];
  int capacity;
  int visitor;
  List<Schedule> schedule = [];
  List<Rule> rules = [];

  factory EventDetailData.fromJson(Map<String, dynamic> json) =>
      EventDetailData(
        id: json["id"],
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
        instagram: json["instagram"],
        whatsapp: json["whatsapp"],
        facebook: json["facebook"],
        email: json["email"],
        imageEventData: List<ImageEventData>.from(
            json["image"].map((x) => ImageEventData.fromJson(x))),
        guest_star:
            List<Guest>.from(json["guest"].map((x) => Guest.fromJson(x))),
        capacity: json["capacity"],
        visitor: json["visitor"],
        schedule: List<Schedule>.from(
            json["schedule"].map((x) => Schedule.fromJson(x))),
        rules: List<Rule>.from(json["rules"].map((x) => Rule.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
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
        "instagram": instagram,
        "whatsapp": whatsapp,
        "facebook": facebook,
        "email": email,
        "image": List<dynamic>.from(imageEventData.map((x) => x.toJson())),
        "guest": List<dynamic>.from(guest_star.map((x) => x.toJson())),
        "capacity": capacity,
        "visitor": visitor,
        "schedule": List<dynamic>.from(schedule.map((x) => x.toJson())),
        "rules": List<dynamic>.from(rules.map((x) => x.toJson())),
      };
  factory EventDetailData.onError() => EventDetailData(
      id: '',
      idProvinces: '',
      idCity: '',
      name: '',
      address: '',
      city: '',
      provinces: '',
      country: '',
      description: '',
      lat: '',
      long: '',
      instagram: '',
      whatsapp: '',
      facebook: '',
      email: '',
      imageEventData: [],
      guest_star: [],
      capacity: 0,
      visitor: 0,
      schedule: [],
      rules: []);
}

class ImageEventData {
  ImageEventData({
    required this.id,
    required this.idEvent,
    required this.ImageEventDataUrl,
  });

  String id;
  String idEvent;
  String ImageEventDataUrl;

  factory ImageEventData.fromJson(Map<String, dynamic> json) => ImageEventData(
        id: json["id"],
        idEvent: json["id_event"],
        ImageEventDataUrl: json["image_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_event": idEvent,
        "image_url": ImageEventDataUrl,
      };
}

class Guest {
  Guest({
    required this.id,
    required this.idCountry,
    required this.name,
    required this.imageUrl,
    required this.bio,
    required this.email,
    required this.facebook,
    required this.instagram,
  });

  String id;
  String idCountry;
  String name;
  String imageUrl;
  String bio;
  String email;
  String facebook;
  String instagram;

  factory Guest.fromJson(Map<String, dynamic> json) => Guest(
        id: json["id"],
        idCountry: json["id_country"],
        name: json["name"],
        imageUrl: json["ImageURL"],
        bio: json["bio"],
        email: json["email"],
        facebook: json["facebook"],
        instagram: json["instagram"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_country": idCountry,
        "name": name,
        "ImageURL": imageUrl,
        "bio": bio,
        "email": email,
        "facebook": facebook,
        "instagram": instagram,
      };
}

class Rule {
  Rule({
    required this.id,
    required this.rules,
  });

  String id;
  String rules;

  factory Rule.fromJson(Map<String, dynamic> json) => Rule(
        id: json["id"],
        rules: json["rules"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "rules": rules,
      };
}

class Schedule {
  Schedule({
    required this.id,
    required this.date,
    required this.topic,
    required this.rundown,
    required this.ticket,
  });

  String id;
  DateTime date;
  String topic;
  List<Rundown> rundown;
  List<Ticket> ticket;

  factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
        id: json["id"],
        date: DateTime.parse(json["date"]),
        topic: json["topic"],
        rundown: json["rundown"] == null
            ? []
            : List<Rundown>.from(
                json["rundown"].map((x) => Rundown.fromJson(x))),
        ticket: json["ticket"] == null
            ? []
            : List<Ticket>.from(json["ticket"].map((x) => Ticket.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "date": date.toIso8601String(),
        "topic": topic,
        "rundown": rundown == null
            ? null
            : List<dynamic>.from(rundown.map((x) => x.toJson())),
        "ticket": ticket == null
            ? null
            : List<dynamic>.from(ticket.map((x) => x.toJson())),
      };
}

class Rundown {
  Rundown({
    required this.id,
    required this.startTime,
    required this.endTime,
    required this.topic,
  });

  String id;
  String startTime;
  String endTime;
  String topic;

  factory Rundown.fromJson(Map<String, dynamic> json) => Rundown(
        id: json["id"],
        startTime: json["start_time"],
        endTime: json["end_time"],
        topic: json["topic"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "start_time": startTime,
        "end_time": endTime,
        "topic": topic,
      };
}

class Ticket {
  Ticket({
    required this.id,
    required this.name,
    required this.description,
    required this.terms,
    required this.price,
    required this.stock,
    required this.type,
    required this.availStock,
    required this.min,
    required this.max,
  });

  String id;
  String name;
  String description;
  String terms;
  String price;
  String stock;
  String type;
  String availStock;
  String min;
  String max;

  factory Ticket.fromJson(Map<String, dynamic> json) => Ticket(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        terms: json["terms"],
        price: json["price"],
        stock: json["stock"],
        type: json["type"],
        availStock: json["avail_stock"],
        min: json["min"],
        max: json["max"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "terms": terms,
        "price": price,
        "stock": stock,
        "type": type,
        "avail_stock": availStock,
        "min": min,
        "max": max,
      };
}
