import 'package:coscos/component/ImageLoc.dart';
import 'package:coscos/component/color.dart';
import 'package:coscos/component/customText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: non_constant_identifier_names
AppBar CustomAppBar(BuildContext context,
    {bool back = false,
    void Function()? callback,
    bool isSearchBar = true,
    String title = ""}) {
  return AppBar(
    centerTitle: true,
    leading: Padding(
      padding: EdgeInsets.only(left: Get.width / 95),
      child: back
          ? IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: back == false && callback == null
                  ? () {
                      Get.back();
                    }
                  : callback ?? () => Get.back(),
            )
          : GestureDetector(
              onTap: () => Get.until((route) => Get.currentRoute == '/'),
              child: Image.asset(ImageLoc.logoTrans)),
    ),
    title: isSearchBar
        ? Container(
            height: 40,
            // height: Get.height * 0.055,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Warna.softWhite),
            child: Padding(
              padding: EdgeInsets.only(
                left: Get.width / 30,
              ),
              child: TextFormField(
                // scrollPadding: ,
                maxLines: 1,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.only(bottom: 6),
                  border: InputBorder.none,
                  hintText: "Indonesia Comic Con",
                ),
              ),
            ))
        : Container(
            child: CustomText()
                .titleText(title, fontSize: 16, textColor: Warna.softWhite)),
    elevation: 1,
    automaticallyImplyLeading: false,
    backgroundColor: Warna.cyan,
    actions: [
      Padding(
          padding: EdgeInsets.only(right: Get.height / 80),
          child: GestureDetector(
            onTap: () {},
            child: const Icon(Icons.more_horiz_rounded),
          )),
    ],
  );
}
