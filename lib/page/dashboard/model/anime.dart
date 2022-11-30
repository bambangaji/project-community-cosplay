import 'package:coscos/page/dashboard/model/cosplayer.dart';
import 'package:coscos/page/event/model/CharacterModel.dart';

import 'character.dart';

class AnimeModel {
  String id;
  String name;
  // String gender;
  List<Character> character;
  DateTime createdAt;
  bool isExpand;
  String imageURL;
  String type;
  AnimeModel(
      {required this.id,
      required this.name,
      required this.character,
      required this.createdAt,
      required this.imageURL,
      required this.type,
      this.isExpand = false});
  factory AnimeModel.onError() => AnimeModel(
      id: "",
      name: "",
      character: [],
      createdAt: DateTime.now(),
      imageURL: "",
      type: "NULL");
}
