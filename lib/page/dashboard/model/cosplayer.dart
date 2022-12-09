
// ignore_for_file: non_constant_identifier_names

class CosplayerModel {
  String id;
  String name;
  String gender;
  String link_socmed;
  String socmed_type;
  String socmed;
  DateTime createdAt;

  CosplayerModel({
    required this.id,
    required this.name,
    required this.link_socmed,
    required this.socmed_type,
    required this.socmed,
    required this.gender,
    required this.createdAt,
  });
  factory CosplayerModel.onError() => CosplayerModel(
      gender: "M",
      id: "",
      name: "",
      socmed: "",
      socmed_type: "",
      link_socmed: "",
      createdAt: DateTime.now());
}
