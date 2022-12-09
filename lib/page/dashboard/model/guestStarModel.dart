// ignore_for_file: file_names, non_constant_identifier_names

class GuestStarModel {
  String id;
  String name;
  String country;
  String social_media;
  String description;
  String gender;
  DateTime createdAt;

  GuestStarModel(
      {required this.id,
      required this.name,
      required this.social_media,
      required this.country,
      required this.description,
      required this.createdAt,
      required this.gender});
  factory GuestStarModel.onError() => GuestStarModel(
        gender: "M",
        id: "",
        name: "",
        social_media: "",
        country: "",
        description: "",
        createdAt: DateTime.now(),
      );
}
