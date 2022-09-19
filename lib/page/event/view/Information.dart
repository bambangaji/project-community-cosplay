import 'package:coscos/component/customWidget.dart';
import 'package:coscos/component/dateFormat.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:photo_view/photo_view.dart';

import '../../../component/card.dart';
import '../../../component/color.dart';
import '../../../component/customText.dart';
import '../controller/eventController.dart';

class InformationPage extends GetView<EventController> {
  const InformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: Get.width,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            color: Warna.softWhite,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText().titleText(
                                controller.eventModel!.name_event,
                                fontSize: 19),
                            customCard().cardBlue(CustomFormatDate()
                                    .formatDateID(controller.eventModel!.date_start_event
                                        .toString())
                                    .substring(0, 1) +
                                " - " +
                                CustomFormatDate().formatDateID(controller
                                    .eventModel!.date_end_event
                                    .toString()) +
                                " at " +
                                DateFormat.Hm().format(DateFormat("HH:mm").parse(
                                    controller.eventModel!.time_start_event!)) +
                                " - " +
                                DateFormat.Hm().format(DateFormat("HH:mm")
                                    .parse(controller.eventModel!.time_end_event!)))
                          ],
                        ),
                        // Column(
                        //   children: [
                        //     customCard()
                        //         .cardPurpleRowBetween(
                        //             "200",
                        //             text2nd:
                        //                 "Cosplayer"),
                        //     SizedBox(
                        //       height: 8,
                        //     ),
                        //     customCard()
                        //         .cardYellow("200",
                        //             text2nd:
                        //                 "Visitor")
                        //   ],
                        // )
                      ],
                    ),
                    CustomText().titleText(
                      "Ticket : ",
                      fontSize: 17,
                    ),
                    Container(
                      height: 80,
                      width: Get.width,
                      child: ListView.builder(
                        itemCount: controller.eventModel!.tiket.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, i) {
                          var data = controller.eventModel!.tiket[i];
                          return Padding(
                            padding:
                                EdgeInsets.fromLTRB(0, 0, Get.width / 40, 0),
                            child: CustomWidget.TicketCard(data),
                          );
                        },
                      ),
                    ),
                    CustomText().titleText(
                      "Location : ",
                      fontSize: 17,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                      child: Container(
                        // width: Get.width - Get.width / 16,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(Icons.location_on_outlined,
                                    color: Warna.abuMuda),
                                Container(
                                  width: Get.width / 1.5,
                                  child: CustomText().longText(
                                    controller.eventModel!.city +
                                        ", " +
                                        controller.eventModel!.address,
                                    textColor: Warna.abuMuda,
                                  ),
                                ),
                              ],
                            ),
                            Image.asset(
                              "lib/assets/googleMaps.png",
                              height: Get.height / 15,
                            )
                          ],
                        ),
                      ),
                    ),
                    CustomText().titleText(
                      "Description : ",
                      fontSize: 17,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0, bottom: 5),
                      child: Row(
                        children: [
                          Container(
                            width: Get.width - Get.width / 10,
                            child: RichText(
                              text: TextSpan(
                                  style: TextStyle(
                                      color: Warna.softBlack, fontSize: 12),
                                  text: controller.eventModel!.description,
                                  children: <TextSpan>[
                                    controller.eventModel!.description.length >
                                            500
                                        ? TextSpan(
                                            text: " See More",
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {
                                                print("tappp");
                                              },
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Warna.softBlueCyan))
                                        : TextSpan(text: "")
                                  ]),
                            ),
                          ),
                        ],
                      ),
                    ),
                    CustomText().titleText(
                      "Guest Star :",
                      fontSize: 17,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(5, 0, 0, 5),
                child: Container(
                  width: Get.width,
                  height: 180,
                  child: ListView.builder(
                    itemCount: controller.eventModel!.guest_star.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, i) {
                      var data = controller.eventModel!.guest_star[i];
                      return customCard().cardGuestStar(data);
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText().titleText(
                      "Map Event:",
                      fontSize: 17,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                      child: GestureDetector(
                        onTap: () {
                          controller.viewPhoto();
                        },
                        child: Container(
                          height: Get.height / 3,
                          width: Get.width,
                          // child: ,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image:
                                      AssetImage("lib/assets/mapEvent.jpg"))),
                        ),
                      ),
                    ),
                    CustomText().titleText(
                      "Contact:",
                      fontSize: 17,
                    ),
                    customCard().cardWidget(
                      colorBg: Warna.biru,
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Column(
                          children: [
                            CustomText().titleTextWithWidgetIcon(
                              "08XX - XXXX - XXXX ",
                              Icon(Icons.whatsapp, color: Warna.softWhite),
                              isBack: true,
                              isMaxWidth: true,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 12.0),
                              child: CustomText().titleTextWithWidgetIcon(
                                "test@gmail.com ",
                                Icon(Icons.mail, color: Warna.white),
                                isBack: true,
                                isMaxWidth: true,
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
