// ignore_for_file: avoid_print, file_names, camel_case_types, duplicate_ignore

import 'package:coscos/api/Auth.dart';
import 'package:coscos/component/color.dart';
import 'package:coscos/component/customText.dart';
import 'package:coscos/component/customWidget.dart';
import 'package:coscos/component/fontSize.dart';
import 'package:coscos/page/profile/controller/profileController.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
                          height: 120,
                          color: Warna.biru.withOpacity(0.7),
                          // child: Column(
                          //   mainAxisAlignment: MainAxisAlignment.center,
                          //   children: [
                          //     Container(
                          //       width: 80,
                          //       height: 80,
                          //       decoration: BoxDecoration(
                          //           border: Border.all(
                          //               color: Warna.white, width: 2.5),
                          //           borderRadius: BorderRadius.circular(100),
                          //           image: const DecorationImage(
                          //               fit: BoxFit.cover,
                          //               image: AssetImage(
                          //                   "lib/assets/tanjiro.jpg"))),
                          //     ),
                          //     Padding(
                          //       padding: const EdgeInsets.only(top: 8.0),
                          //       child: CustomText().titleText(
                          //           controller.profileData!.name!,
                          //           fontSize: 18,
                          //           textColor: Warna.softWhite),
                          //     )
                          //   ],
                          // ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 110.0, top: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText().titleText(
                                  controller.profileData!.name!,
                                  fontSize: FontSize.title),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: const [
                                  FaIcon(FontAwesomeIcons.instagram, size: 20),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  FaIcon(FontAwesomeIcons.facebook, size: 20),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  FaIcon(FontAwesomeIcons.tiktok, size: 20),
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Center(
                          child: Container(
                            width: Get.width - 110,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    CustomText().titleText("100",
                                        fontWeight: FontWeight.bold,
                                        fontSize: FontSize.big),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    CustomText().titleText("Project",
                                        fontWeight: FontWeight.w400,
                                        fontSize: FontSize.title),
                                  ],
                                ),
                                Column(
                                  children: [
                                    CustomText().titleText("100",
                                        fontWeight: FontWeight.bold,
                                        fontSize: FontSize.big),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    CustomText().titleText("Event",
                                        fontWeight: FontWeight.w400,
                                        fontSize: FontSize.title),
                                  ],
                                ),
                                Column(
                                  children: [
                                    CustomText().titleText("100",
                                        fontWeight: FontWeight.bold,
                                        fontSize: FontSize.big),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    CustomText().titleText("Cosplay",
                                        fontWeight: FontWeight.w400,
                                        fontSize: FontSize.title),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 10, 8, 0),
                          child: SizedBox(
                            // color: Colors.red,
                            height: (Get.height - 260),
                            width: Get.width,
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                        logOut();
                                      }),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    top: 80,
                    left: 20,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: Warna.white, width: 2.5),
                              borderRadius: BorderRadius.circular(100),
                              image: const DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage("lib/assets/tanjiro.jpg"))),
                        ),
                      ],
                    ),
                  )
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
