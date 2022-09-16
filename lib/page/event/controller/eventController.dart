import 'dart:developer';

import 'package:coscos/page/dashboard/model/anime.dart';
import 'package:coscos/page/dashboard/model/character.dart';
import 'package:coscos/page/dashboard/model/eventModel.dart';
import 'package:coscos/page/event/view/ListCosplayer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EventController extends GetxController {
  PageController pageController =
      PageController(viewportFraction: 1, initialPage: 1);
  int activePage = 1;
  EventModel? eventModel;
  AnimeModel? animeModel;
  changePage(int page) {
    activePage = page;
    update();
  }

  onBuildPage(EventModel data) {
    eventModel = data;
    update();
    inspect(eventModel);
  }

  expandAnime(AnimeModel data) {
    data.isExpand = !data.isExpand;
    update();
    print(data.isExpand);
  }

  expandCharacter(CharacterModel data) {
    data.isExpand = !data.isExpand;
    update();
    print(data.isExpand);
  }

  goToListCosplayer(AnimeModel data) {
    animeModel = data;
    Get.to(ListCosplayerPage());
  }
}
