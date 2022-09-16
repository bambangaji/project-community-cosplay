import 'package:coscos/page/dashboard/model/cosplayer.dart';

import 'character.dart';

class AnimeModel {
  String id;
  String name;
  // String gender;
  List<CharacterModel> character;
  DateTime createdAt;
  bool isExpand;
  AnimeModel(
      {required this.id,
      required this.name,
      required this.character,
      required this.createdAt,
      this.isExpand = false});
  factory AnimeModel.onError() =>
      AnimeModel(id: "", name: "", character: [], createdAt: DateTime.now());
}
