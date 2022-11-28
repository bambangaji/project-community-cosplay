import 'dart:io';

import 'package:coscos/component/color.dart';
import 'package:coscos/component/customWidget.dart';
import 'package:coscos/page/event/controller/eventController.dart';
import 'package:coscos/page/list/model/model.dart';
import 'package:coscos/page/list/view/ListSerialPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class ListController extends GetxController
    with GetSingleTickerProviderStateMixin {
  var isLoading = false.obs;
  var filterDate = false.obs;
  var filterStatus = false.obs;
  var filterType = false.obs;
  var openAdd = false.obs;
  var selectedStatus = "";
  var selectedType = "";
  var addSelectedType = "ANIME";
  var addSelectedGender = "M";
  var addSerialName = TextEditingController().obs;
  var addCharacterlName = "";
  var selectedOrder = "";
  var fileName = "";
  var isRebuild = true.obs;
  var typeContent = 1;
  var startDateController = TextEditingController().obs;
  var addNameSerial = TextEditingController().obs;
  var endDateController = TextEditingController().obs;
  // ignore: prefer_final_fields
  ScrollController _scrollControllerDetail =
      ScrollController(initialScrollOffset: 15);
  final ImagePicker imagePicker = ImagePicker();
  List<DropdownMenuItem<Object?>> dropdownOrder = [
    DropdownMenuItem(
        value: FilterModel.OrderDocument[0], child: const Text("Stamping")),
    const DropdownMenuItem(value: "", child: Text("Signing")),
  ];
  List<DropdownMenuItem<Object?>> dropdownType = [
    DropdownMenuItem(
        value: FilterModel.TypeSerial[0], child: const Text("Anime")),
    DropdownMenuItem(
        value: FilterModel.TypeSerial[1], child: const Text("Game")),
    DropdownMenuItem(
        value: FilterModel.TypeSerial[2], child: const Text("Movie")),
    DropdownMenuItem(
        value: FilterModel.TypeSerial[3], child: const Text("Other")),
    const DropdownMenuItem(value: "", child: Text("All")),
  ];
  List<DropdownMenuItem<Object?>> dropdownAddType = [
    DropdownMenuItem(
        value: FilterModel.TypeSerial[0], child: const Text("Anime")),
    DropdownMenuItem(
        value: FilterModel.TypeSerial[1], child: const Text("Game")),
    DropdownMenuItem(
        value: FilterModel.TypeSerial[2], child: const Text("Movie")),
    DropdownMenuItem(
        value: FilterModel.TypeSerial[3], child: const Text("Other")),
  ];

  List<DropdownMenuItem<Object?>> dropdownGender = [
    const DropdownMenuItem(value: "M", child: Text("Male")),
    const DropdownMenuItem(value: "F", child: Text("Female")),
  ];

  changeAddBtn() {
    resetAddState();
    openAdd.value = !openAdd.value;
    update();
  }

  pickImage() async {
    final XFile? pickedFile = await imagePicker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 2600,
      maxHeight: 1600,
    );
    if (pickedFile != null) {
      final file = File(pickedFile.path);
      final bytes = file.readAsBytesSync().lengthInBytes;
      final kb = bytes / 1024;
      final mb = kb / 1024;
      print(mb);
      if (mb > 1) {
        CustomWidget.showDialog(
            "Alert Size Image", "Image size must under 2Mb0");
      } else {
        fileName = basename(file.path);
        update();
      }

      print(pickedFile.path);
    }
  }

  resetAddState() {
    addNameSerial.value.text = "";
    fileName = "";
    addSelectedType = "ANIME";
    update();
  }

  SubmitSerial() {
    print(addSerialName.value.text);
    print(addSelectedType);
    print(fileName);
    changeAddBtn();
  }

  Container resetFilter() {
    if (filterDate.value ||
        filterStatus.value ||
        filterType.value ||
        selectedStatus != "" ||
        selectedType != "") {
      // ignore: avoid_unnecessary_containers
      return Container(
        child: OutlinedButton(
          onPressed: () {
            resetAllFilter();
          },
          style: OutlinedButton.styleFrom(
              elevation: 5.0,
              backgroundColor: Warna.white,
              // side: const BorderSide(color: Warna.biruTua, width: 1.1),
              shape: const StadiumBorder(),
              fixedSize: const Size(20, 35)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const Icon(
                Icons.restart_alt_outlined,
                size: 24,
                color: Warna.biruTua,
              ),
            ],
          ),
        ),
      );
    } else {
      return Container();
    }
  }

  onRebuild() {
    isRebuild = false.obs;
    update();
  }

  resetAllFilter() {}
  void onChangeDropdownOrder(value) async {
    print(value.toString());
    selectedOrder = value;
    // applyFilterType = value;
    update();
    if (value.toUpperCase() == "" || value.toUpperCase() == "SIGNING") {
      // await changeToSigning();
    } else {
      // await changeToStamping();
    }
    applyFilter();
  }

  void onChangeDropdownType(value) async {
    print(value.toString());
    selectedType = value;
    // applyFilterType = value;
    update();
    if (value.toUpperCase() == "" || value.toUpperCase() == "SIGNING") {
      // await changeToSigning();
    } else {
      // await changeToStamping();
    }
    applyFilter();
  }

  void onChangeDropdownAddType(value) async {
    print(value.toString());
    addSelectedType = value;
    update();
  }

  void onChangeDropdownAddGender(value) async {
    print(value.toString());
    addSelectedGender = value;
    update();
  }

  int type() {
    return Get.find<EventController>().typeContent;
  }

  applyFilter() {}
  Widget cardListDocument() {
    typeContent = type();
    Widget value = CardListDocument(typeContent,
        scrollController: _scrollControllerDetail);
    return value;
    // }
  }
}
