import 'dart:developer';

import 'package:coscos/page/dashboard/model/anime.dart';
import 'package:coscos/page/dashboard/model/character.dart';
import 'package:coscos/page/dashboard/model/eventModel.dart';
import 'package:coscos/page/event/view/Cosplayer.dart';
import 'package:coscos/page/event/view/Information.dart';
import 'package:coscos/page/event/view/ListCosplayer.dart';
import 'package:coscos/page/event/view/Performance.dart';
import 'package:coscos/page/event/view/Rules.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EventController extends GetxController {
  PageController pageController =
      PageController(viewportFraction: 1, initialPage: 1);
  int activePage = 1;
  int selectTab = 1;
  EventModel? eventModel;
  AnimeModel? animeModel;
  changePage(int page) {
    activePage = page;
    update();
  }

  List<String>? rulesEvent;
  changeTab(int page) {
    selectTab = page;
    update();
  }

  Widget contentTab() {
    Widget? output;
    switch (selectTab) {
      case 1:
        // do something
        output = InformationPage();
        break;
      case 2:
        // do something else
        output = RulesEventPage();
        break;
      case 3:
        // do something else
        output = CosplayerPage();
        break;
    }
    return output!;
  }

  var isExpand = false.obs;
  viewPhoto() {
    isExpand.value = !isExpand.value;
    update();
  }

  onBuildPage(EventModel data) {
    eventModel = data;
    rulesEvent = [
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
      "Fusce venenatis lectus vel magna convallis pulvinar.",
      "Nulla lacinia elit ut ipsum finibus, eu elementum ex rhoncus.",
      "Mauris feugiat sem sit amet risus tempor, eget aliquet dui placerat,Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...",
      "Proin vitae ipsum vel arcu imperdiet hendrerit sit amet vel augue.",
      "Pellentesque congue purus quis mi pharetra, id cursus nisi molestie., Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...",
      "Curabitur eu felis nec ante faucibus posuere. Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...",
      "Nunc ullamcorper nunc non gravida tincidunt.Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...",
      "Nam at erat elementum sapien eleifend imperdiet ornare id neque. Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...",
      "Ut vulputate neque ac nulla pharetra dictum quis et augue. Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit..., Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...",
      "Donec finibus massa eget ante viverra, ac maximus orci gravida.",
      "Aenean ut turpis ac massa rhoncus efficitur pretium sed velit.",
      "Proin eget nunc tristique urna ultrices varius.",
      "Curabitur venenatis lacus id porttitor pulvinar.",
      "Etiam accumsan ligula vel dolor sollicitudin, placerat ullamcorper purus placerat.",
      "Etiam molestie quam id erat semper, dictum suscipit ante aliquet.",
    ];
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

  List<Widget> indicators(imagesLength, currentIndex) {
    return List<Widget>.generate(imagesLength, (index) {
      return Container(
        margin: EdgeInsets.all(3),
        width: 10,
        height: 10,
        decoration: BoxDecoration(
            color: currentIndex == index ? Colors.white : Colors.white30,
            shape: BoxShape.circle),
      );
    });
  }
}
