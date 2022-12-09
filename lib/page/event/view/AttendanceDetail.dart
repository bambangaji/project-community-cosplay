// ignore_for_file: file_names

import 'package:coscos/component/color.dart';
import 'package:coscos/component/customText.dart';
import 'package:coscos/component/customWidget.dart';
import 'package:coscos/page/event/controller/eventController.dart';
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
                onTap: () {
                },
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
                                  height: 65,
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
                                OutlinedButton(
                                  onPressed: () {
                                    // Get.off(PageDashboard());
                                    controller.selectDate(context, 1);
                                    // child: dialogDate(true)));
                                    // showAlertDialog(context);
                                  },
                                  style: OutlinedButton.styleFrom(
                                      // elevation: 5.0,
                                      // fixedSize: (40),
                                      // minimumSize,
                                      maximumSize: Size(Get.width, 45),
                                      minimumSize: Size(Get.width / 2, 45),
                                      backgroundColor: Warna.grey,
                                      side: BorderSide.none,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      )
                                      // fixedSize: Size(size.width! / 3.3, 20)
                                      ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Obx(() => Text(
                                            controller.selectDateAttendance
                                                        .value ==
                                                    ""
                                                ? 'Select date attendace'
                                                : controller
                                                    .selectDateAttendance.value,
                                            style: const TextStyle(
                                                color: Warna.softBlack),
                                          ))
                                    ],
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
                                                top: 15,
                                                bottom: Get.width / 20),
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
                                                            Get.width / 25,
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
