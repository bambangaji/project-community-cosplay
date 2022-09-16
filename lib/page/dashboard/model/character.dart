import 'package:coscos/page/dashboard/model/cosplayer.dart';

class CharacterModel {
  String id;
  String name;
  String gender;
  List<CosplayerModel> cosplayer;
  DateTime createdAt;
  bool isExpand;
  CharacterModel(
      {required this.id,
      required this.name,
      required this.cosplayer,
      required this.gender,
      required this.createdAt,
      this.isExpand = false});
  factory CharacterModel.onError() => CharacterModel(
      gender: "M", id: "", name: "", cosplayer: [], createdAt: DateTime.now());
}
