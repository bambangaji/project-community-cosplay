import 'package:coscos/component/color.dart';
import 'package:coscos/component/customText.dart';
import 'package:coscos/component/customWidget.dart';
import 'package:coscos/page/event/controller/eventController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AttendanceDetail extends GetView<EventController> {
  Widget step(String title) {
    return Padding(
      padding: EdgeInsets.only(
          right: Get.width / 20, left: Get.width / 20, top: Get.width / 40),
      child: Row(
        // mainAxisAlignment: ,
        children: [
          Icon(
            Icons.circle,
            color: Warna.biruTua,
            size: Get.width / 35,
          ),
          Padding(
            padding: EdgeInsets.only(left: Get.width / 60),
            child: Container(
              child: Text(
                "${title}",
                maxLines: 4,
              ),
              width: Get.width - (Get.width / 4.5),
            ),
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
            initialChildSize: 0.85,
            maxChildSize: 0.85,
            builder: (BuildContext context, ScrollController scrollController) {
              return GestureDetector(
                onTap: () {
                  print("object");
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
                                SizedBox(
                                  height: 65,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10.0),
                                  child: CustomText().titleText(
                                      "Select Movie / Anime / Game Name"),
                                ),
                                CustomWidget.customTextField(
                                    bgColor: Warna.grey),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 10.0, top: 10),
                                  child: CustomText()
                                      .titleText("Select Character"),
                                ),
                                CustomWidget.customTextField(
                                    bgColor: Warna.grey),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 10.0, top: 10),
                                  child: CustomText()
                                      .titleText("Select Type Costume"),
                                ),
                                CustomWidget.customTextField(
                                    bgColor: Warna.grey),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 10.0, top: 10),
                                  child: CustomText()
                                      .titleText("Select Date Attendance"),
                                ),
                                CustomWidget.customTextField(
                                    bgColor: Warna.grey),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 10.0, top: 10),
                                  child: CustomText()
                                      .titleText("Instagram ( Optional )"),
                                ),
                                CustomWidget.customTextField(
                                    bgColor: Warna.grey),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
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
                              child: Container(
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
