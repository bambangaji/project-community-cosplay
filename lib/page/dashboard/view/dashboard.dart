// ignore_for_file: prefer_const_constructors

import 'package:coscos/component/baseScaffold.dart';
import 'package:coscos/component/card.dart';
import 'package:coscos/component/color.dart';
import 'package:coscos/component/customText.dart';
import 'package:coscos/component/customWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../component/sizeConfig.dart';
import '../controller/dashboard_controller.dart';

class DashboardPage extends GetView<DashboardController> {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    controller.onBuildPage();
    return GetBuilder<DashboardController>(
      init: DashboardController(), // INIT IT ONLY THE FIRST TIME
      builder: (_) => CustomScaffold().baseScaffold(
        isTabBar: true,
        context,
        children: [
          Container(
            color: Warna.flowerBlue4,
            height: 40,
            child: Padding(
              padding: EdgeInsets.only(
                  left: Get.height / 50, right: Get.height / 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText().titleTextWithIcon(
                      "Jakarta", Icons.location_on_outlined,
                      isBack: true),
                  const Icon(
                    Icons.arrow_drop_down_outlined,
                    color: Warna.softWhite,
                    size: 30,
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 4, 10, 10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText().titleText("Event"),
                            Row(
                              children: [
                                CustomText().titleTextWithIcon(
                                    "See More", Icons.arrow_right_outlined,
                                    iconColor: Warna.softBlack,
                                    textColor: Warna.softBlack)
                              ],
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: SizedBox(
                            height: 220,
                            child: controller.listEvent.isEmpty
                                ? const Center(
                                    child: Text("Tidak Ada Event di bulan ini"),
                                  )
                                : Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: 3,
                                      itemBuilder: (context, index) {
                                        var data = controller.listEvent[index];
                                        return customCard().cardEvent(data);
                                      },
                                    ),
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 8, 10, 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText().titleText("Menu"),
                          Padding(
                            padding: const EdgeInsets.only(top: 2.0),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomWidget.IconMenu(
                                          Icons.event_rounded, "Event",
                                          IconColor: Warna.softIjoMuda,
                                          callBack: () {}),
                                      CustomWidget.IconMenu(
                                          Icons.theater_comedy_rounded,
                                          "Cosplayer",
                                          IconColor: Warna.softPeach,
                                          callBack: () {}),
                                      CustomWidget.IconMenu(
                                          Icons.shopify, "Rental",
                                          IconColor: Warna.softMerahMuda,
                                          callBack: () {}),
                                      CustomWidget.IconMenu(
                                          Icons.camera_indoor_rounded, "Studio",
                                          text2nd: "Photoshoot",
                                          IconColor: Warna.softBlueCyan,
                                          callBack: () {}),
                                      CustomWidget.IconMenu(
                                          Icons.campaign_outlined,
                                          "Information",
                                          IconColor: Warna.kuning,
                                          callBack: () {}),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomWidget.IconMenu(
                                          Icons.art_track, "Art",
                                          // text2nd: "Photoshoot",
                                          IconColor: Warna.softBlueCyan,
                                          callBack: () {}),
                                      CustomWidget.IconMenu(
                                          Icons.coronavirus_outlined,
                                          "Covid-19",
                                          IconColor: Warna.softIjoMuda,
                                          callBack: () {}),
                                      CustomWidget.IconMenu(
                                          Icons.edit, "Commission",
                                          IconColor: Warna.softPurple,
                                          callBack: () {}),
                                      CustomWidget.IconMenu(
                                          Icons.camera, "Photographer",
                                          IconColor: Warna.softPeach,
                                          callBack: () {}),
                                      CustomWidget.IconMenu(
                                          Icons.apps_rounded, "All",
                                          IconColor: Warna.softIjoMedium,
                                          callBack: () {}),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
