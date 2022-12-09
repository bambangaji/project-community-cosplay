// ignore_for_file: file_names

import 'package:coscos/component/color.dart';
import 'package:coscos/component/customText.dart';
import 'package:coscos/component/header.dart';
import 'package:coscos/page/list/controller/ListController.dart';
import 'package:coscos/page/list/view/Add.dart';
import 'package:dropdown_below/dropdown_below.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageList extends GetView<ListController> {
  const PageList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.onRebuild();
    return GetBuilder<ListController>(
        init: ListController(), // INIT IT ONLY THE FIRST TIME
        builder: (_) => LoadingOverlay(
            isLoading: controller.isLoading.value,
            child: Stack(
              children: [
                Scaffold(
                  backgroundColor: Warna.abuMudaBG,
                  appBar: CustomAppBar(context, back: true, callback: () {
                    controller.getEventController().getBack();
                  }),
                  body: SizedBox(
                    height: Get.height,
                    width: Get.width,
                    child: Stack(children: [
                      Positioned(
                          top: 0,
                          left: 0,
                          child: Container(
                            width: Get.width,
                            color: Warna.abuMudaBG,
                            height: 50,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 7.0, left: 7),
                              child: Center(
                                child: ListView(
                                  padding: const EdgeInsets.all(5),
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    // Padding(
                                    //   padding: const EdgeInsets.only(right: 9.0),
                                    //   child: controller.resetFilter(),
                                    // ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 12.0),
                                      child: DropdownBelow(
                                        itemWidth: 100,
                                        itemTextstyle: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black),
                                        boxTextstyle: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Warna.biruTua),
                                        boxPadding: const EdgeInsets.fromLTRB(
                                            12, 0, 0, 0),
                                        boxWidth: 100,
                                        boxHeight: 35,
                                        boxDecoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(0.2),
                                                spreadRadius: 1.1,
                                                blurRadius: 5,
                                                offset: const Offset(1, 1),
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Warna.white),
                                        hint: Padding(
                                            padding:
                                                const EdgeInsets.only(left: 8),
                                            child: CustomText().titleText(
                                              "All",
                                              textColor: Warna.biruTua,
                                            )),
                                        value: controller.selectedType,
                                        items: controller.dropdownType,
                                        onChanged:
                                            controller.onChangeDropdownType,
                                      ),
                                    ),],
                                ),
                              ),
                            ),
                          )),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 50.0, 0, 0),
                        child: Obx(() => controller.isRebuild.value
                            ? const Center(
                                child: SizedBox(
                                    height: 50,
                                    width: 50,
                                    child: CircularProgressIndicator()),
                              )
                            : Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: controller.cardListDocument(),
                              )),
                      ),
                    ]),
                  ),
                  floatingActionButton: Obx(() => controller.openAdd.value
                      ? Container()
                      : GestureDetector(
                          onTap: () {
                            controller.changeAddBtn();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [
                                    Color(0xff00bcd4),
                                    Color(0xff8fcaf9)
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                borderRadius: BorderRadius.circular(100)),
                            child: const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Icon(Icons.add,
                                  color: Colors.white, size: 40),
                            ),
                          ),
                        )),
                ),
                Obx(() => controller.openAdd.value
                    ? Positioned(
                        child: GestureDetector(
                        onTap: () {
                          controller.changeAddBtn();
                        },
                        child: Container(
                          height: Get.height,
                          width: Get.width,
                          color: Warna.silver.withOpacity(0.8),
                          child: SizedBox(
                              width: Get.width,
                              height: Get.height / 2,
                              child: const AddDetail()),
                        ),
                      ))
                    : Container())
              ],
            )));
    // ));
  }
}
