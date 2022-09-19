import 'package:coscos/component/color.dart';
import 'package:coscos/component/customText.dart';
import 'package:coscos/page/event/controller/eventController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RulesEventPage extends GetView<EventController> {
  const RulesEventPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          // height: Get.height,
          width: Get.width,
          color: Warna.softWhite,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText().titleText("Event Rules", fontSize: 17),
                for (var i in controller.rulesEvent!)
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: CustomText()
                        .bulletList(i, fontWeight: FontWeight.normal),
                  )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
