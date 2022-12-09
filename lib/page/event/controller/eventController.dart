// ignore_for_file: file_names

import 'dart:developer';

import 'package:coscos/api/Methode.dart';
import 'package:coscos/component/card.dart';
import 'package:coscos/component/color.dart';
import 'package:coscos/component/customText.dart';
import 'package:coscos/page/dashboard/controller/dashboard_controller.dart';
import 'package:coscos/page/dashboard/model/anime.dart';
import 'package:coscos/page/dashboard/model/character.dart';
import 'package:coscos/page/dashboard/model/eventModel.dart';
import 'package:coscos/page/dashboard/model/runDown.dart';
import 'package:coscos/page/dashboard/model/schedule.dart';
import 'package:coscos/page/event/model/CharacterModel.dart';
import 'package:coscos/page/event/model/SerialModel.dart';
import 'package:coscos/page/event/view/Cosplayer.dart';
import 'package:coscos/page/event/view/Information.dart';
import 'package:coscos/page/event/view/ListCosplayer.dart';
import 'package:coscos/page/event/view/Rules.dart';
import 'package:coscos/page/event/view/RunDown.dart';
import 'package:coscos/page/list/controller/ListController.dart';
import 'package:coscos/page/list/view/List.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class EventController extends GetxController {
  PageController pageController =
      PageController(viewportFraction: 1, initialPage: 1);
  int activePage = 1;
  int selectTab = 1;
  int typeContent = 1;
  EventModel? eventModel;
  AnimeModel animeModel = AnimeModel(
      id: "",
      name: "",
      character: [],
      createdAt: DateTime.now(),
      imageURL: "",
      type: "");
  ListSerial? listSerialModel;
  ListCharacter? listCharacterModel;
  String selectSerialValue = "";
  var selectSerialController = TextEditingController().obs;
  var selectCharacterController = TextEditingController().obs;
  var selectDateController = TextEditingController().obs;
  var selectDateAttendance = "".obs;
  List<ScheduleModel>? scheduleModel;
  var openAttendanceCosplayer = false.obs;
  changePage(int page) {
    activePage = page;
    update();
  }

  getBack() {
    update();
    Get.back();
  }

  Future<bool> getDataListSerial() async {
    getDashboardController().changeLoading();
    var data = {"id_event": "", "type": "", "start": 0, "end": 50};
    var retval = await getListSerial(data);
    getDashboardController().changeLoading();
    inspect(retval);
    if (retval.error.errorCode == 200 || retval.error.errorCode == 0) {
      listSerialModel = retval;
      return true;
    } else {
      return false;
    }
  }

  DashboardController getDashboardController() {
    return Get.find<DashboardController>();
  }

  List<String>? rulesEvent;
  changeTab(int page) {
    selectTab = page;
    update();
  }

  changeAttendanceCosplayer() async {
    openAttendanceCosplayer.value = !openAttendanceCosplayer.value;
    update();
  }

  selectDate(BuildContext context, int type) async {
    DateTime startDate = eventModel!.date_start_event;
    DateTime endDate = eventModel!.date_end_event;
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: endDate, // Refer step 1
      firstDate: startDate,
      lastDate: endDate,
    );
    if (picked != null) {
      selectDateAttendance.value =
          DateFormat('yyyy/MM/dd').format(DateTime.parse(picked.toString()));
    }
    update();
  }

  Widget contentTab() {
    Widget? output;
    switch (selectTab) {
      case 1:
        // do something
        output = const InformationPage();
        break;
      case 2:
        // do something else
        output = const RulesEventPage();
        break;
      case 3:
        // do something else
        output = const CosplayerPage();
        break;
      case 4:
        // do something else
        output = const RunDownPage();
        getDataRunDown();
        break;
    }
    return output!;
  }

  getDataRunDown() {
    scheduleModel = [
      ScheduleModel(id: "1", dateEvent: DateTime.parse("2022-10-01"), runDown: [
        RunDownModel(
            id: "1",
            startTime: "08:00",
            endTime: "10:00",
            content:
                "Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit"),
        RunDownModel(
            id: "1",
            startTime: "10:00",
            endTime: "11:00",
            content:
                "Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, cipisci velit"),
        RunDownModel(
            id: "1",
            startTime: "11:00",
            endTime: "12:00",
            content:
                "Neque porro quisquam est qui dolorem ipsum t, consectetur, adipisci velit"),
        RunDownModel(
            id: "1",
            startTime: "12:00",
            endTime: "15:00",
            content:
                "Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit"),
        RunDownModel(
            id: "1",
            startTime: "15:05",
            endTime: "17:00",
            content:
                "Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, adipisci velit"),
        RunDownModel(
            id: "1",
            startTime: "17:05",
            endTime: "20:00",
            content:
                "Neque porro quisquam est qui dolorem ipsit amet, consectetur, adipisci velit")
      ]),
      ScheduleModel(id: "1", dateEvent: DateTime.parse("2022-10-02"), runDown: [
        RunDownModel(
            id: "1",
            startTime: "08:00",
            endTime: "10:00",
            content:
                "Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit"),
        RunDownModel(
            id: "1",
            startTime: "10:00",
            endTime: "11:00",
            content:
                "Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, cipisci velit"),
        RunDownModel(
            id: "1",
            startTime: "11:00",
            endTime: "12:00",
            content:
                "Neque porro quisquam est qui dolorem ipsum t, consectetur, adipisci velit"),
        RunDownModel(
            id: "1",
            startTime: "12:00",
            endTime: "15:00",
            content:
                "Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit"),
        RunDownModel(
            id: "1",
            startTime: "15:05",
            endTime: "17:00",
            content:
                "Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, adipisci velit"),
        RunDownModel(
            id: "1",
            startTime: "17:05",
            endTime: "20:00",
            content:
                "Neque porro quisquam est qui dolorem ipsit amet, consectetur, adipisci velit")
      ])
    ];
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
  }

  expandCharacter(CharacterModel data) {
    data.isExpand = !data.isExpand;
    update();
  }

  goToListCosplayer(AnimeModel data) {
    animeModel = data;
    Get.to(const ListCosplayerPage());
  }

  selectSerial(Serial data, {bool isBack = false}) {
    // selectSerialValue = data.name;
    if (!isBack) {
      selectSerialController.value.text = data.name;
      selectCharacterController.value.text = "";
      animeModel.id = data.id;
      animeModel.name = data.name;
    }

    update();
    Get.back();
  }

  selectCharacter(Character data) {
    // selectSerialValue = data.name;
    selectCharacterController.value.text = data.name;
    update();
    Get.back();
  }

  List<Widget> indicators(imagesLength, currentIndex) {
    return List<Widget>.generate(imagesLength, (index) {
      return Container(
        margin: const EdgeInsets.all(3),
        width: 10,
        height: 10,
        decoration: BoxDecoration(
            color: currentIndex == index ? Colors.white : Colors.white30,
            shape: BoxShape.circle),
      );
    });
  }

  showAttendance() {
    Get.defaultDialog(
      title: "Select Type Attendance",
      content: Padding(
        padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Get.close(1);
              },
              child: customCard().cardWidget(
                  colorBg: Warna.biru,
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8),
                    child: CustomText().titleTextWithIcon(
                      "Attend as visitor",
                      Icons.snowshoeing_outlined,
                      isBack: true,
                    ),
                  )),
            ),
            GestureDetector(
              onTap: () {
                Get.close(1);
                changeAttendanceCosplayer();
              },
              child: customCard().cardWidget(
                  colorBg: Warna.biru,
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8),
                    child: CustomText().titleTextWithIcon(
                      "Attend as cosplayer",
                      Icons.masks_rounded,
                      isBack: true,
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }

  getDataListCharacter() async {
    getDashboardController().changeLoading();
    var data = {
      "id_event": "",
      "gender": "",
      "start": 0,
      "end": 50,
      "id_serial": animeModel.id
    };
    var retval = await getListCharacter(data);
    listCharacterModel = retval;
    getDashboardController().changeLoading();
  }

  goToSerialPage(int type) async {
    typeContent = type;
    update();
    Get.put<ListController>(ListController(), permanent: true);
    if (typeContent == 2) {
      if (animeModel.name == "") {
        Get.showSnackbar(const GetSnackBar(
          duration: Duration(seconds: 2),
          message: "Select serial first",
          backgroundColor: Warna.abuMuda,
        ));
      } else {
        await getDataListCharacter();
        Get.to(const PageList());
      }
    } else {
      getDataListSerial().then((value) {
        if (value) {
          Get.to(() => const PageList());
        }
      });
    }
  }
}
