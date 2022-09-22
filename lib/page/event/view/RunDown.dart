import 'package:coscos/component/card.dart';
import 'package:coscos/component/color.dart';
import 'package:coscos/component/customText.dart';
import 'package:coscos/component/dateFormat.dart';
import 'package:coscos/page/event/controller/eventController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class RunDownPage extends GetView<EventController> {
  const RunDownPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Warna.softWhite,
      // height: Get.heigh  t,
      width: Get.width,
      child: controller.scheduleModel!.length == 0 ? Center(child: Text("Run down not found"),):
      Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for(var i in controller.scheduleModel!)
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText().titleText(DateFormat('EEEE').format(i.dateEvent)+ " " +CustomFormatDate().formatDateID(i.dateEvent.toString()) ,fontSize: 20,textColor: Warna.navy),
                for(var j in i.runDown)
                
                customCard().cardWidget(Container(child: Row(
                  children: [ 
                    SizedBox(width: 8,),
                    CustomText().titleText(j.startTime + " - " + j.endTime,textColor: Warna.cyan ),
                    SizedBox(width: 10,),
                    Container(
                      width: Get.width/1.48,
                      child: CustomText().titleTextWithoutBold(j.content ))
                  ],
                ),),
                colorBg: Warna.white
                )
              ],
            ),
          )
        ],
      ),
    );}}