// ignore_for_file: file_names

import 'package:coscos/component/color.dart';
import 'package:coscos/component/customText.dart';
import 'package:coscos/component/customWidget.dart';
import 'package:coscos/component/fontSize.dart';
import 'package:coscos/page/event/controller/eventController.dart';
import 'package:dropdown_below/dropdown_below.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AttendanceDetail extends GetView<EventController> {
  const AttendanceDetail({super.key});
  Widget contentDialog(BuildContext context) {
    return SizedBox(
      // color: Warna.abuDisable,
      height: 60,
      // width: 200,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 100,
                // height: 20,
                child: TextFormField(
                  controller: controller.selectDateController.value,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Start Date',
                  ),
                  readOnly: true,
                  onTap: () {
                    controller.selectDate(context, 1);
                  },
                  // initialValue: "test",
                ),
              ),
              SizedBox(
                width: 100,
                // height: 20,
                child: TextFormField(
                  controller: controller.selectDateController.value,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'End Date',
                  ),
                  readOnly: true,
                  onTap: () {
                    controller.selectDate(context, 2);
                  },
                  // initialValue: "test",
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
        child: DraggableScrollableSheet(
            minChildSize: 0.2,
            initialChildSize: 500 / Get.height,
            maxChildSize: 500 / Get.height,
            builder: (BuildContext context, ScrollController scrollController) {
              return GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                      color: Warna.white,
                      borderRadius: BorderRadius.circular(10)),
                  height: Get.height - (Get.width / 4),
                  child: ListView.builder(
                    controller: scrollController,
                    itemCount: 1,
                    itemBuilder: (BuildContext context, int index) {
                      return Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 45,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10.0),
                                  child: CustomText().titleText(
                                      "Select Movie / Anime / Game Name"),
                                ),
                                CustomWidget.customTextField(
                                    callBack: () {
                                      controller.goToSerialPage(1);
                                    },
                                    hintText: "Naruto",
                                    bgColor: Warna.grey,
                                    controller:
                                        controller.selectSerialController,
                                    isDisable: true),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 10.0, top: 10),
                                  child: CustomText()
                                      .titleText("Select Character"),
                                ),
                                CustomWidget.customTextField(
                                    isDisable: true,
                                    callBack: () {
                                      controller.goToSerialPage(2);
                                    },
                                    controller:
                                        controller.selectCharacterController,
                                    bgColor: Warna.grey),
                                // Padding(
                                //   padding: const EdgeInsets.only(
                                //       bottom: 10.0, top: 10),
                                //   child: CustomText()
                                //       .titleText("Select Type Costume"),
                                // ),
                                // CustomWidget.customTextField(
                                //     bgColor: Warna.grey),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 10.0, top: 10),
                                  child: CustomText()
                                      .titleText("Select Date Attendance"),
                                ),
                                SizedBox(
                                  width: Get.width,
                                  child: Obx(
                                    () => DropdownBelow(
                                      boxHeight: 46,
                                      itemWidth: Get.width - 29,
                                      itemTextstyle: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black),
                                      boxTextstyle: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Warna.softBlack),
                                      boxPadding: const EdgeInsets.fromLTRB(
                                          12, 0, 0, 0),
                                      boxWidth: Get.width,
                                      // boxHeight: 45,
                                      boxDecoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: Warna.grey),
                                      hint: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8),
                                          child: CustomText().titleText(
                                            "Select Date",
                                            textColor: Warna.softBlack,
                                          )),
                                      value: controller.addSelectedDate.value,
                                      items: controller.dropdownDate,
                                      onChanged:
                                          controller.onChangeDropdownAddDate,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 10.0, top: 10),
                                  child: CustomText()
                                      .titleText("Instagram ( Optional )"),
                                ),
                                CustomWidget.customTextField(
                                    bgColor: Warna.grey),
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  width: Get.width,
                                  child: OutlinedButton(
                                      style: TextButton.styleFrom(
                                          backgroundColor: Warna.biruTua),
                                      onPressed: null,
                                      child: CustomText().titleText("Submit",
                                          textColor: Warna.softWhite)),
                                )
                              ],
                            ),
                          ),
                          Positioned(
                              top: -10,
                              child: SizedBox(
                                width: Get.width,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Center(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: Warna.abuDisable,
                                          ),
                                          width: Get.width / 10,
                                          height: Get.width / 60,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                        padding: const EdgeInsets.all(0.0),
                                        child: Padding(
                                            padding: EdgeInsets.only(
                                                top: 8, bottom: 0),
                                            child: Column(children: [
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    right: Get.width / 20,
                                                    left: Get.width / 20),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      "Cosplayer Form",
                                                      textAlign: TextAlign.left,
                                                      style: TextStyle(
                                                        color: Warna.abuAbu,
                                                        fontSize:
                                                            FontSize.title,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    // Image.asset(
                                                    //   "lib/assets/payment/BCA.png",
                                                    //   width: Get.width / 5,
                                                    // )
                                                  ],
                                                ),
                                              ),
                                              Divider(
                                                color: Colors.grey[300],
                                                thickness: 1,
                                              ),
                                            ]))),
                                  ],
                                ),
                              ))
                        ],
                      );
                    },
                  ),
                ),
              );
            }));
  }
}
