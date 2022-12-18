// ignore_for_file: prefer_const_constructors, avoid_print, file_names

import 'package:coscos/component/customWidget.dart';
import 'package:coscos/component/dateFormat.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../component/card.dart';
import '../../../component/color.dart';
import '../../../component/customText.dart';
import '../controller/eventController.dart';

class GuestEventPage extends GetView<EventController> {
  const GuestEventPage({super.key});

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
          child: Padding(
            padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: Get.height / 70),
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
                                  controller.eventModel!.name,
                                  fontSize: 17),
                              customCard().cardBlue(
                                  "${CustomFormatDate().formatDateID(controller.startDate.toString())} - ${CustomFormatDate().formatDateID(controller.endDate.toString())}")
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
                      SizedBox(
                        height: 80,
                        width: Get.width,
                        child: ListView.builder(
                          itemCount: controller.listTicketModel.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, i) {
                            var data = controller.listTicketModel[i];
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(Icons.location_on_outlined,
                                    color: Warna.abuMuda),
                                SizedBox(
                                  width: Get.width / 1.5,
                                  child: CustomText().longText(
                                    "${controller.eventModel!.city}, ${controller.eventModel!.address}",
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
                      CustomText().titleText(
                        "Detail Event : ",
                        fontSize: 17,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0, bottom: 5),
                        child: Row(
                          children: [
                            SizedBox(
                              width: Get.width - Get.width / 10,
                              child: RichText(
                                text: TextSpan(
                                    style: TextStyle(
                                        color: Warna.softBlack, fontSize: 12),
                                    text: controller.eventModel!.description,
                                    children: <TextSpan>[
                                      controller.eventModel!.description
                                                  .length >
                                              150
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
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 4, 0, 10),
                        child: SizedBox(
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
                      CustomText().titleText(
                        "Cosplayer :",
                        fontSize: 17,
                      ),
                      ListView.builder(
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
                              padding:
                                  const EdgeInsets.only(bottom: 10.0, right: 5),
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
                                          left: BorderSide(
                                              color: Warna.biruMuda, width: 2),
                                        )),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          10, 12, 10, 12),
                                                  child: Container(
                                                    height: 60,
                                                    width: 60,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        image: DecorationImage(
                                                            fit: BoxFit.cover,
                                                            image: AssetImage(
                                                                "lib/assets/kimetsu.jpg"))),
                                                  ),
                                                ),
                                                CustomText()
                                                    .titleText(data.name)
                                              ],
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(right: 8.0),
                                              child: customCard()
                                                  .cardPurpleRowBetween("100",
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
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
