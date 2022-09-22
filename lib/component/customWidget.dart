import 'package:coscos/page/dashboard/model/anime.dart';
import 'package:coscos/page/dashboard/model/character.dart';
import 'package:coscos/page/dashboard/model/ticketModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'card.dart';
import 'color.dart';
import 'customText.dart';

class CustomWidget {
  static Widget customTextField(
      {String hintText = "",
      InputBorder inputBorder = InputBorder.none,
      Color bgColor = Warna.softWhite}) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: bgColor),
        child: Padding(
          padding: EdgeInsets.only(left: Get.height / 30),
          child: TextFormField(
            decoration: InputDecoration(
              border: inputBorder,
              hintText: hintText,
            ),
          ),
        ));
  }

  static Widget IconMenu(IconData icon, String content,
      {required void Function() callBack,
      Color IconColor = Warna.softBlueCyan,
      String text2nd = ""}) {
    return GestureDetector(
      onTap: callBack,
      child: Column(
        children: [
          Container(
              decoration: BoxDecoration(
                  color: Warna.abuMudaBG,
                  borderRadius: BorderRadius.circular(100)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(icon, size: Get.height / 22, color: IconColor),
              )),
          Padding(
            padding: EdgeInsets.only(top: 4.0),
            child: Column(
              children: [
                CustomText().titleTextWithoutBold(content,
                    textColor: Warna.softBlack, fontSize: 12),
                text2nd == ""
                    ? Container()
                    : CustomText().titleTextWithoutBold(text2nd,
                        fontSize: 12, textColor: Warna.softBlack),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget TicketCard(TicketModel data) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            // width: Get.width / 2.5,
            decoration: BoxDecoration(
                border: Border.all(
                    color: data.tiketFee > 100000 ? Colors.red : Colors.green),
                borderRadius: BorderRadius.circular(10),
                color: data.tiketFee > 100000
                    ? Warna.pink
                    : Warna.softIjoMuda),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  CustomText().titleTextWithIcon(
                      NumberFormat.currency(locale: "id")
                          .format(data.tiketFee)
                          .replaceAll("IDR", "IDR ")
                          .toString(),
                      Icons.receipt,
                      isBack: true,
                      fontSize: 13,
                      textColor: Warna.softWhite)
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: CustomText().titleTextWithoutBold(data.name_ticket),
          )
        ],
      ),
    );
  }

  static Widget ListTileTopUp(CharacterModel characterModel,
      {required String leadIconLocation,
      required String title,
      required void Function() callBack,
      double imageWidth = 10}) {
    return GestureDetector(
      onTap: callBack,
      child: characterModel.gender == "M"
          ? customCard().cardBlueWidget(
              ListTile(
                trailing: characterModel.isExpand
                    ? Icon(
                        Icons.keyboard_arrow_down,
                        color: Warna.softWhite,
                        size: Get.width / 15,
                      )
                    : Icon(
                        Icons.keyboard_arrow_right_outlined,
                        color: Warna.softWhite,
                        size: Get.width / 15,
                      ),
                leading: Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(leadIconLocation))),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                title: Text(
                  title,
                  style: TextStyle(
                      color: Warna.softWhite, fontWeight: FontWeight.bold),
                ),
                tileColor: Colors.white,
              ),
            )
          : customCard().cardPinkWidget(
              ListTile(
                trailing: characterModel.isExpand
                    ? Icon(
                        Icons.keyboard_arrow_down,
                        color: Warna.softWhite,
                        size: Get.width / 15,
                      )
                    : Icon(
                        Icons.keyboard_arrow_right_outlined,
                        color: Warna.softWhite,
                        size: Get.width / 15,
                      ),
                leading: Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(leadIconLocation))),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                title: Text(
                  title,
                  style: TextStyle(
                      color: Warna.softWhite, fontWeight: FontWeight.bold),
                ),
                tileColor: Colors.white,
              ),
            ),
    );
  }
}
