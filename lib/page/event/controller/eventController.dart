// ignore_for_file: file_names

import 'dart:developer';
import 'package:coscos/api/Methode.dart';
import 'package:coscos/component/card.dart';
import 'package:coscos/component/color.dart';
import 'package:coscos/component/customText.dart';
import 'package:coscos/page/dashboard/controller/dashboard_controller.dart';
import 'package:coscos/page/dashboard/model/anime.dart';
import 'package:coscos/page/dashboard/model/character.dart';
import 'package:coscos/page/dashboard/model/eventDetailModel.dart';
import 'package:coscos/page/event/model/CharacterCosplayerModel.dart';
import 'package:coscos/page/event/model/CharacterModel.dart';
import 'package:coscos/page/event/model/CosplayerModel.dart';
import 'package:coscos/page/event/model/SerialCosplayerModel.dart';
import 'package:coscos/page/event/model/SerialModel.dart';
import 'package:coscos/page/event/view/Cosplayer.dart';
import 'package:coscos/page/event/view/Information.dart';
import 'package:coscos/page/event/view/ListCosplayer.dart';
import 'package:coscos/page/event/view/Rules.dart';
import 'package:coscos/page/event/view/RunDown.dart';
import 'package:coscos/page/list/controller/ListController.dart';
import 'package:coscos/page/list/model/model.dart';
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
  EventDetailData? eventModel;
  SerialCosplayerData animeModel =
      SerialCosplayerData(id: "", name: "", imageUrl: "", count: 0, type: "");
  CharacterCosplayerData characterCosplayer = CharacterCosplayerData(
      id: "", name: "", imageUrl: "", count: 0, gender: "");
  List<CharacterCosplayerData> listCharacterCosplayer = [];
  List<SerialCosplayerData> listSerialCosplayer = [];
  List<CosplayerData> listCosplayer = [];
  DateTime? startDate;
  DateTime? endDate;
  String? startTime;
  String? endTime;
  int start = 0;
  int end = 5;
  String type = "COSPLAYER";
  String gender = "";
  var loadData = false.obs;
  ListSerial? listSerialModel;
  ListCharacter? listCharacterModel;
  List<Ticket> listTicketModel = [];
  String selectSerialValue = "";
  var selectSerialController = TextEditingController().obs;
  var selectCharacterController = TextEditingController().obs;
  var selectDateController = TextEditingController().obs;
  var selectDateAttendance = "".obs;
  List<Schedule>? scheduleModel;
  var openAttendanceCosplayer = false.obs;
  changePage(int page) {
    activePage = page;
    update();
  }

  List<DropdownMenuItem<Object?>> dropdownDate = [];
  var addSelectedDate = "".obs;
  void onChangeDropdownAddDate(value) async {
    addSelectedDate.value = value;
    update();
    print(value);
    // DateTime startDate = eventModel!.schedule[0].date;
    // DateTime endDate = eventModel!.schedule[eventModel!.schedule.length].date;
    inspect(eventModel);
  }

  getBack() {
    update();
    Get.back();
  }

  resetFilter() {
    start = 0;
    end = 5;
    type = "COSPLAYER";
    gender = "";
    update();
  }

  parsingDataTicket(List<Schedule> schedule) {
    dropdownDate = [];
    listTicketModel = [];
    update();
    for (var i in schedule) {
      dropdownDate.add(DropdownMenuItem(
          value: i.date.toString(),
          child: Text(i.date.toString().substring(0, 10))));
      if (i.ticket.isNotEmpty) {
        for (var t in i.ticket) {
          listTicketModel.add(t);
        }
      }
    }
    dropdownDate.add(const DropdownMenuItem(value: "", child: Text("ALL")));
    inspect(dropdownDate);
    update();
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
    loadDataCosplayer();
  }

  changeAttendanceCosplayer() async {
    openAttendanceCosplayer.value = !openAttendanceCosplayer.value;
    update();
  }

  selectDate(BuildContext context, int type) async {
    DateTime startDate = eventModel!.schedule[0].date;
    DateTime endDate = eventModel!.schedule[eventModel!.schedule.length].date;
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

  showLoading() {
    loadData.value = true;
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
      case 4:
        // do something else
        output = RunDownPage();
        getDataRunDown();
        break;
    }
    return output!;
  }

  loadDataCosplayer() async {
    showLoading();
    var payload = {
      "id_event": eventModel!.id,
      "start": start,
      "end": end,
      "type": type
    };
    var data = await getSerialCosplayer(payload);
    eventModel!.anime = data.data!;
    loadData.value = false;
    update();
    inspect(eventModel);
  }

  getDataRunDown() {
    scheduleModel = eventModel!.schedule;
  }

  var isExpand = false.obs;
  viewPhoto() {
    isExpand.value = !isExpand.value;
    update();
  }

  onBuildPage(EventDetail data) async {
    await parsingDataTicket(data.data.schedule);
    eventModel = data.data;
    update();
    parsingDateTime();
  }

  parsingDataSchedule() {}
  parsingDateTime() {
    var minus = 1;
    for (var i in eventModel!.schedule) {
      if (i.rundown.isEmpty) {
        minus++;
      }
    }
    startDate = eventModel!.schedule[0].date;
    endDate = eventModel!.schedule[eventModel!.schedule.length - 1].date;
    startTime = eventModel!.schedule[0].rundown[0].startTime;
    endTime = eventModel!
        .schedule[eventModel!.schedule.length - minus]
        .rundown[eventModel!
                .schedule[eventModel!.schedule.length - minus].rundown.length -
            1]
        .endTime;
    update();
  }

  parsingRunDown() {
    update();
  }

  expandAnime(AnimeModel data) {
    data.isExpand = !data.isExpand;
    update();
  }

  expandCharacter(CharacterCosplayerData data) async {
    data.isExpand = !data.isExpand;
    var payload = {"id_event": eventModel!.id, "id_character": data.id};
    var retVal = await getCosplayer(payload);
    data.cosplayer = retVal.data!;
    update();
  }

  goToListCosplayer(SerialCosplayerData data) async {
    animeModel = data;
    var payload = {
      "id_event": eventModel!.id,
      "id_serial": animeModel.id,
      "start": start,
      "end": end,
      "gender": ""
    };
    var retVal = await getCharacterCosplayer(payload);
    listCharacterCosplayer = retVal.data!;
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
