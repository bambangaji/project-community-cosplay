// ignore_for_file: avoid_print, file_names, camel_case_types, duplicate_ignore

import 'package:coscos/component/color.dart';
import 'package:coscos/component/customText.dart';
import 'package:coscos/component/customWidget.dart';
import 'package:coscos/page/profile/controller/profileController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class profilePage extends GetView<profileController> {
  const profilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<profileController>(
        init: profileController(),
        builder: (_) => Container(
              color: Colors.white,
              height: Get.height - 0,
              width: Get.width,
              child: Stack(
                children: [
                  Center(
                    child: Column(
                      children: [
                        Container(
                          width: Get.width,
                          height: 160,
                          color: Warna.biru.withOpacity(0.7),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Warna.white, width: 2.5),
                                    borderRadius: BorderRadius.circular(100),
                                    image: const DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                            "lib/assets/tanjiro.jpg"))),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: CustomText().titleText("Jhon Doe",
                                    fontSize: 18, textColor: Warna.softWhite),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                          child: SizedBox(
                            // color: Colors.red,
                            height: (Get.height - 160) - 130,
                            width: Get.width,
                            child: SingleChildScrollView(
                              child: Column(
                                // padding: const EdgeInsets.only(top: 10),
                                children: [
                                  // CustomText().titleText("Account",
                                  //     fontSize: 18, textColor: Warna.abuAbu),
                                  CustomWidget.ListTileTopUpProfile(
                                      title: "EDIT PROFILE", callBack: () {}),
                                  CustomWidget.ListTileTopUpProfile(
                                      title: "CHANGE PASSWORD",
                                      callBack: () {
                                        // ignore: avoid_print
                                        print("object");
                                      }),
                                  CustomWidget.ListTileTopUpProfile(
                                      title: "URGENT CONTACT",
                                      callBack: () {
                                        print("object");
                                      }),
                                  CustomWidget.ListTileTopUpProfile(
                                      title: "HISTORY TRANSACTION",
                                      callBack: () {
                                        print("object");
                                      }),
                                  CustomText().titleText("Support",
                                      fontSize: 18, textColor: Warna.abuAbu),
                                  CustomWidget.ListTileTopUpProfile(
                                      title: "ABOUT US", callBack: () {}),
                                  CustomWidget.ListTileTopUpProfile(
                                      title: "TERMS & CONDITION",
                                      callBack: () {
                                        print("object");
                                      }),
                                  CustomWidget.ListTileTopUpProfile(
                                      title: "LOG OUT",
                                      callBack: () {
                                        // controller.logOut();
                                      }),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  // Positioned(
                  //     top: 35,
                  //     left: 6,
                  //     child: GestureDetector(
                  //       onTap: () {
                  //         Get.back();
                  //       },
                  //       child: const SizedBox(
                  //           width: 20,
                  //           height: 20,
                  //           // color: Colors.red,
                  //           child: Icon(Icons.keyboard_arrow_left_sharp,
                  //               size: 30, color: Colors.white)),
                  //     ))
                ],
              ),
            ));
  }
}
