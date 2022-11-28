import 'package:animate_gradient/animate_gradient.dart';
import 'package:coscos/page/dashboard/controller/dashboard_controller.dart';
import 'package:coscos/page/dashboard/model/eventModel.dart';
import 'package:coscos/page/dashboard/model/guestStarModel.dart';
import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'color.dart';
import 'customText.dart';
import 'dateFormat.dart';

class customCard {
  Widget cardEvent(EventModel data) {
    return Padding(
      padding: EdgeInsets.only(right: 30),
      child: GestureDetector(
        onTap: () {
          print("object");
          Get.find<DashboardController>().goToEventDetail(data);
        },
        child: Container(
          width: 300,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Warna.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: const [
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
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 126,
                      // width: Get.height / 1.4,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8)),
                        image: DecorationImage(
                            image: AssetImage("lib/assets/comifuro.jpg"),
                            fit: BoxFit.cover),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(Get.height / 80),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText()
                                    .titleText(data.name_event, fontSize: 13),
                                CustomText().titleTextWithoutBold(
                                    CustomFormatDate().formatDateID(
                                        data.date_start_event.toString()),
                                    fontSize: 12,
                                    textColor: Warna.softMerahMuda)
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(
                                Get.height / 80, 0, Get.height / 80, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    CustomText().titleTextWithIcon(
                                        data.city, Icons.location_on_outlined,
                                        isBack: true,
                                        iconColor: Warna.softBlueCyan,
                                        textColor: Warna.softBlack,
                                        fontSize: 13),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    CustomText().titleTextWithoutBold("8.65 Km",
                                        fontSize: 12,
                                        textColor: Warna.softSilver)
                                  ],
                                ),
                                CustomText().titleText(
                                    NumberFormat.currency(locale: "id")
                                        .format(data.tiket[0].tiketFee)
                                        .replaceAll("IDR", "IDR ")
                                        .toString(),
                                    fontSize: 13,
                                    textColor: Warna.softBiruMuda)
                              ],
                            ),
                          )
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
    );
  }

  Widget cardGuestStar(GuestStarModel data) {
    return Padding(
      padding: EdgeInsets.only(right: 10.0, top: 10),
      child: Container(
        width: 120,
        decoration: BoxDecoration(
            border: Border.all(
                color: data.gender == "F" ? Warna.softMerahMuda : Warna.biru),
            borderRadius: BorderRadius.circular(30),
            color: data.gender == "F" ? Warna.pink : Warna.softBlueCyan),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                child: Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("lib/assets/aliga.jpg")),
                      borderRadius: BorderRadius.circular(100)),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              CustomText().titleText(data.name, textColor: Warna.softWhite),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Flag.fromString(
                    data.country,
                    borderRadius: 5,
                    height: Get.height / 40,
                    width: Get.width / 20,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  CustomText()
                      .titleText(data.description, textColor: Warna.softWhite),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 4.0),
                child: CustomText().titleTextWithWidgetIcon(
                  data.social_media,
                  fontSize: 13,
                  FaIcon(FontAwesomeIcons.instagram,
                      size: 13, color: Warna.softWhite),
                  isBack: true,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget cardBlue(String content) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: Container(
        // width: Get.width / 2.5,
        decoration: BoxDecoration(
            border: Border.all(color: Warna.biruTua),
            borderRadius: BorderRadius.circular(10),
            color: Warna.biru),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              CustomText().titleTextWithoutBold(content,
                  fontSize: 14, textColor: Warna.softWhite),
            ],
          ),
        ),
      ),
    );
  }

  Widget cardBlueWidget(
    Widget content,
  ) {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
      child: Container(
        // width: Get.width / 2.5,
        decoration: BoxDecoration(
            border: Border.all(color: Warna.softBiruMuda),
            borderRadius: BorderRadius.circular(10),
            color: Warna.biruMuda),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
          child: content,
        ),
      ),
    );
  }

  Widget cardGreenWidget(
    Widget content,
  ) {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
      child: Container(
        // width: Get.width / 2.5,
        decoration: BoxDecoration(
            border: Border.all(color: Warna.softIjoMuda),
            borderRadius: BorderRadius.circular(10),
            color: Warna.softIjoMedium),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
          child: content,
        ),
      ),
    );
  }

  Widget cardWidget(Widget content,
      {Color colorBorder = Warna.softIjoMuda,
      Color colorBg = Warna.softIjoMedium}) {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
      child: Container(
        // width: Get.width / 2.5,
        decoration: BoxDecoration(
            border: Border.all(color: colorBorder),
            borderRadius: BorderRadius.circular(10),
            color: colorBg),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
          child: content,
        ),
      ),
    );
  }

  Widget cardWidgetAnime(Widget content,
      {Color colorBorder = Warna.softIjoMuda,
      Color colorBg = Warna.softIjoMedium,
      required void Function() callBack,
      bool isPopular = false}) {
    return GestureDetector(
      onTap: callBack,
      child: Padding(
        padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
        child: Container(
          // width: Get.width / 2.5,
          decoration: BoxDecoration(
              border: Border.all(color: colorBorder),
              borderRadius: BorderRadius.circular(10),
              color: colorBg),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                child: content,
              ),
              Positioned(
                  top: 0,
                  child: isPopular
                      ? Container(
                          // width: 100,
                          // height: 15,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              gradient: LinearGradient(colors: [
                                Color(0xff2196f3),
                                Color(0xff8bc34a)
                              ])),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 4, horizontal: 10),
                            child: CustomText().titleText("Most Popular",
                                textColor: Warna.white, fontSize: 10),
                          ),
                        )
                      : Container())
            ],
          ),
        ),
      ),
    );
  }

  Widget cardPinkWidget(
    Widget content,
  ) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: Container(
        // width: Get.width / 2.5,
        decoration: BoxDecoration(
            border: Border.all(color: Warna.softMerahMuda),
            borderRadius: BorderRadius.circular(10),
            color: Warna.pink),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
          child: content,
        ),
      ),
    );
  }

  Widget cardPurpleRowBetween(String content, {String text2nd = ""}) {
    return Container(
      // width: Get.width / 2.5,
      width: Get.width / 3.6,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.purple[800]!),
          borderRadius: BorderRadius.circular(10),
          color: Warna.softPurple),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText()
                .titleText(content, fontSize: 14, textColor: Warna.softWhite),
            CustomText()
                .titleText(text2nd, fontSize: 14, textColor: Warna.softWhite)
          ],
        ),
      ),
    );
  }

  Widget cardYellow(String content, {String text2nd = ""}) {
    return Container(
      // width: Get.width / 2.5,
      width: Get.width / 3.6,
      decoration: BoxDecoration(
          border: Border.all(color: const Color.fromARGB(255, 204, 136, 27)),
          borderRadius: BorderRadius.circular(10),
          color: Warna.kuning),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText()
                .titleText(content, fontSize: 14, textColor: Warna.softWhite),
            CustomText()
                .titleText(text2nd, fontSize: 14, textColor: Warna.softWhite)
          ],
        ),
      ),
    );
  }
}
