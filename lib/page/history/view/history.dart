// ignore_for_file: implementation_imports

import 'package:coscos/component/color.dart';
import 'package:coscos/component/customLabel.dart';
import 'package:coscos/component/customText.dart';
import 'package:coscos/component/dateFormat.dart';
import 'package:coscos/component/fontSize.dart';
import 'package:coscos/page/history/controller/historyController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class HistoryPage extends GetView<HistoryController> {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          width: Get.width,
          height: Get.height - 140,
          child: ListView.builder(
            itemCount: 10,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 7),
                child: Container(
                  width: Get.width - 20,
                  height: 100,
                  decoration: BoxDecoration(
                      color: Warna.white,
                      borderRadius: BorderRadius.circular(5)),
                  child: Row(children: [
                    Container(
                        width: 0.4 * (Get.width - 20),
                        height: 104,
                        child: ClipRRect(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5),
                                bottomLeft: Radius.circular(5)),
                            child: Image.asset(
                              "lib/assets/comifuro.jpg",
                              fit: BoxFit.cover,
                            ))),
                    Container(
                      width: 0.59 * (Get.width - 20),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: Stack(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText().titleText("Comicfrontier 15",
                                    fontSize: FontSize.title),
                                CustomText().titleTextWithoutBold(
                                    CustomFormatDate()
                                        .formatDateID("2022-10-10"),
                                    fontSize: FontSize.subtitle)
                              ],
                            ),
                            Positioned(
                                right: 0,
                                top: 0,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 5.0),
                                  child: index / 2 != 1
                                      ? customLabel.labelBlue("cosplayer")
                                      : customLabel.labelGreen("visitor"),
                                ))
                          ],
                        ),
                      ),
                    )
                  ]),
                ),
              );
            },
          )),
    );
  }
}
