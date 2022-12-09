// ignore_for_file: file_names

import 'package:coscos/component/card.dart';
import 'package:coscos/component/color.dart';
import 'package:coscos/component/customText.dart';
import 'package:coscos/page/event/controller/eventController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CosplayerPage extends GetView<EventController> {
  const CosplayerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // ignore: prefer_const_constructors
      padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
      shrinkWrap: true,
      itemCount: controller.eventModel!.anime!.length,
      itemBuilder: (context, i) {
        var data = controller.eventModel!.anime![i];
        return GestureDetector(
          onTap: (() {
            controller.goToListCosplayer(data);
          }),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10.0, right: 5),
            child: Column(
              children: [
                Container(
                  width: Get.width,
                  decoration: const BoxDecoration(
                      color: Warna.softWhite,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 5,
                            spreadRadius: 1,
                            offset: Offset(4, 4)),
                        BoxShadow(
                            color: Colors.white,
                            offset: Offset(-5, -5),
                            blurRadius: 15,
                            spreadRadius: 1),
                      ],
                      border: Border(
                        left: BorderSide(color: Warna.biruMuda, width: 2),
                      )),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 12, 10, 12),
                                child: Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: const DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                              "lib/assets/kimetsu.jpg"))),
                                ),
                              ),
                              CustomText().titleText(data.name)
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: customCard().cardPurpleRowBetween("100",
                                text2nd: "Cosplayer"),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
