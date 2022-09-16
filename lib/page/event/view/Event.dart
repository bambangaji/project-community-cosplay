import 'package:coscos/component/baseScaffold.dart';
import 'package:coscos/component/card.dart';
import 'package:coscos/component/color.dart';
import 'package:coscos/component/customText.dart';
import 'package:coscos/component/customWidget.dart';
import 'package:coscos/component/header.dart';
import 'package:coscos/page/dashboard/model/eventModel.dart';
import 'package:coscos/page/event/controller/eventController.dart';
import 'package:flag/flag.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../component/dateFormat.dart';

class EventPage extends GetView<EventController> {
  const EventPage({Key? key}) : super(key: key);

  List<Widget> indicators(imagesLength, currentIndex) {
    return List<Widget>.generate(imagesLength, (index) {
      return Container(
        margin: EdgeInsets.all(3),
        width: 10,
        height: 10,
        decoration: BoxDecoration(
            color: currentIndex == index ? Colors.white : Colors.white30,
            shape: BoxShape.circle),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EventController>(
        init: EventController(), // INIT IT ONLY THE FIRST TIME
        builder: (_) => CustomScaffold.baseScaffold(context,
                isBack: true,
                appBar: false,
                children: [
                  SingleChildScrollView(
                    child: Container(
                      height: Get.height,
                      child: Stack(
                        children: [
                          Stack(
                            children: [
                              SizedBox(
                                height: Get.height / 2.5,
                                width: Get.width,
                                child: PageView.builder(
                                    itemCount: 3,
                                    pageSnapping: true,
                                    controller: controller.pageController,
                                    onPageChanged: (page) {
                                      controller.changePage(page);
                                    },
                                    itemBuilder: (context, pagePosition) {
                                      return AnimatedContainer(
                                        duration: Duration(milliseconds: 500),
                                        curve: Curves.easeInOutCubic,
                                        height: Get.height / 4.5,
                                        width: Get.width,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  "lib/assets/comifuro.jpg"),
                                              fit: BoxFit.cover),
                                        ),
                                      );
                                    }),
                              ),
                              Positioned(
                                  bottom: Get.height / 30,
                                  child: Container(
                                    width: Get.width,
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: indicators(
                                            3, controller.activePage)),
                                  )),
                            ],
                          ),
                          Positioned(
                              bottom: 0,
                              child: Column(
                                children: [
                                  Container(
                                    height: Get.height - Get.height / 2.7,
                                    width: Get.width,
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20)),
                                      color: Warna.softWhite,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: Get.height / 70),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          CustomText().titleText(
                                                              controller
                                                                  .eventModel!
                                                                  .name_event,
                                                              fontSize: 17),
                                                          customCard().cardBlue(CustomFormatDate()
                                                                  .formatDateID(controller
                                                                      .eventModel!
                                                                      .date_start_event
                                                                      .toString()) +
                                                              " - " +
                                                              CustomFormatDate()
                                                                  .formatDateID(controller
                                                                      .eventModel!
                                                                      .date_end_event
                                                                      .toString()))
                                                        ],
                                                      ),
                                                      Column(
                                                        children: [
                                                          customCard()
                                                              .cardPurpleRowBetween(
                                                                  "200",
                                                                  text2nd:
                                                                      "Cosplayer"),
                                                          SizedBox(
                                                            height: 8,
                                                          ),
                                                          customCard()
                                                              .cardYellow("200",
                                                                  text2nd:
                                                                      "Visitor")
                                                        ],
                                                      )
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
                                                      itemCount: controller
                                                          .eventModel!
                                                          .tiket
                                                          .length,
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      itemBuilder:
                                                          (context, i) {
                                                        var data = controller
                                                            .eventModel!
                                                            .tiket[i];
                                                        return Padding(
                                                          padding: EdgeInsets
                                                              .fromLTRB(
                                                                  0,
                                                                  0,
                                                                  Get.width /
                                                                      40,
                                                                  0),
                                                          child: CustomWidget
                                                              .TicketCard(data),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                  CustomText().titleText(
                                                    "Location : ",
                                                    fontSize: 17,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 8.0,
                                                            bottom: 8),
                                                    child: Container(
                                                      // width: Get.width - Get.width / 16,
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Row(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Icon(
                                                                  Icons
                                                                      .location_on_outlined,
                                                                  color: Warna
                                                                      .abuMuda),
                                                              Container(
                                                                width:
                                                                    Get.width /
                                                                        1.5,
                                                                child:
                                                                    CustomText()
                                                                        .longText(
                                                                  controller
                                                                          .eventModel!
                                                                          .city +
                                                                      ", " +
                                                                      controller
                                                                          .eventModel!
                                                                          .address,
                                                                  textColor: Warna
                                                                      .abuMuda,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Image.asset(
                                                            "lib/assets/googleMaps.png",
                                                            height:
                                                                Get.height / 15,
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  CustomText().titleText(
                                                    "Detail Event : ",
                                                    fontSize: 17,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 5.0,
                                                            bottom: 5),
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                          width: Get.width -
                                                              Get.width / 10,
                                                          child: RichText(
                                                            text: TextSpan(
                                                                style: TextStyle(
                                                                    color: Warna
                                                                        .softBlack,
                                                                    fontSize:
                                                                        12),
                                                                text: controller
                                                                    .eventModel!
                                                                    .description,
                                                                children: <
                                                                    TextSpan>[
                                                                  controller.eventModel!.description
                                                                              .length >
                                                                          150
                                                                      ? TextSpan(
                                                                          text:
                                                                              " See More",
                                                                          recognizer:
                                                                              TapGestureRecognizer()
                                                                                ..onTap =
                                                                                    () {
                                                                                  print("tappp");
                                                                                },
                                                                          style: TextStyle(
                                                                              fontWeight: FontWeight
                                                                                  .bold,
                                                                              color: Warna
                                                                                  .softBlueCyan))
                                                                      : TextSpan(
                                                                          text:
                                                                              "")
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
                                                    padding: const EdgeInsets
                                                        .fromLTRB(0, 4, 0, 10),
                                                    child: Container(
                                                      width: Get.width,
                                                      height: 180,
                                                      child: ListView.builder(
                                                        itemCount: controller
                                                            .eventModel!
                                                            .guest_star
                                                            .length,
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        itemBuilder:
                                                            (context, i) {
                                                          var data = controller
                                                              .eventModel!
                                                              .guest_star[i];
                                                          return customCard()
                                                              .cardGuestStar(
                                                                  data);
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                  CustomText().titleText(
                                                    "Cosplayer :",
                                                    fontSize: 17,
                                                  ),
                                                  ConstrainedBox(
                                                    constraints: BoxConstraints(
                                                        minHeight: 0,
                                                        maxHeight: Get.width),
                                                    child: ListView.builder(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              0, 8, 0, 0),
                                                      shrinkWrap: true,
                                                      itemCount: controller
                                                          .eventModel!
                                                          .anime
                                                          .length,
                                                      itemBuilder:
                                                          (context, i) {
                                                        var data = controller
                                                            .eventModel!
                                                            .anime[i];
                                                        return GestureDetector(
                                                          onTap: (() {
                                                            controller
                                                                .goToListCosplayer(
                                                                    data);
                                                          }),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    bottom:
                                                                        10.0,
                                                                    right: 5),
                                                            child: Column(
                                                              children: [
                                                                Container(
                                                                  width:
                                                                      Get.width,
                                                                  decoration:
                                                                      const BoxDecoration(
                                                                          color: Warna
                                                                              .softWhite,
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
                                                                          border:
                                                                              Border(
                                                                            left:
                                                                                BorderSide(color: Warna.biruMuda, width: 2),
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
                                                                                padding: const EdgeInsets.fromLTRB(10, 12, 10, 12),
                                                                                child: Container(
                                                                                  height: 60,
                                                                                  width: 60,
                                                                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), image: DecorationImage(fit: BoxFit.cover, image: AssetImage("lib/assets/kimetsu.jpg"))),
                                                                                ),
                                                                              ),
                                                                              CustomText().titleText(data.name)
                                                                            ],
                                                                          ),
                                                                          Padding(
                                                                            padding:
                                                                                EdgeInsets.only(right: 8.0),
                                                                            child:
                                                                                customCard().cardPurpleRowBetween("100", text2nd: "Cosplayer"),
                                                                          )
                                                                        ],
                                                                      ),

                                                                      // Padding(
                                                                      //   padding:
                                                                      //       EdgeInsets.only(bottom: 5.0),
                                                                      //   child:
                                                                      //       Center(
                                                                      //     child: Container(
                                                                      //       decoration: BoxDecoration(color: Warna.white, borderRadius: BorderRadius.circular(100)),
                                                                      //       child: Icon(Icons.arrow_drop_down_outlined, color: Warna.biruMuda),
                                                                      //     ),
                                                                      //   ),
                                                                      // )
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ))
                        ],
                      ),
                    ),
                  ),
                ]));
  }
}
