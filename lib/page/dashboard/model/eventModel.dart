import 'package:coscos/page/dashboard/model/anime.dart';
import 'package:coscos/page/dashboard/model/guestStarModel.dart';
import 'package:coscos/page/dashboard/model/ticketModel.dart';
import 'package:flutter/material.dart';

class EventModel {
  String id_event;
  String name_event;
  DateTime date_start_event;
  DateTime date_end_event;
  String? time_start_event;
  String? time_end_event;
  bool isExpired;
  String country;
  String city;
  String address;
  String description;
  List<TicketModel> tiket;
  List<GuestStarModel> guest_star;
  List<AnimeModel> anime;
  DateTime createdAt;

  EventModel(
      {required this.id_event,
      required this.name_event,
      required this.date_start_event,
      required this.date_end_event,
      required this.isExpired,
      required this.address,
      required this.city,
      required this.country,
      required this.tiket,
      required this.description,
      required this.createdAt,
      required this.guest_star,
      required this.anime,
      this.time_end_event,
      this.time_start_event});
  factory EventModel.onError() => EventModel(
        id_event: "",
        address: "",
        city: "",
        country: "",
        description: "",
        tiket: [TicketModel.onError()],
        anime: [],
        guest_star: [],
        date_start_event: DateTime.now(),
        date_end_event: DateTime.now(),
        isExpired: false,
        name_event: "Test Event",
        createdAt: DateTime.now(),
      );
}
