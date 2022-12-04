import 'package:coscos/component/ImageLoc.dart';
import 'package:coscos/component/color.dart';
import 'package:coscos/component/customText.dart';
import 'package:coscos/component/sizeConfig.dart';
import 'package:coscos/page/dashboard/controller/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

AppBar CustomAppBar(BuildContext context,
    {bool back = false,
    void Function()? callback = null,
    bool isSearchBar = true,
    String title = ""}) {
  print(callback);
  return AppBar(
    centerTitle: true,
    leading: Padding(
      padding: EdgeInsets.only(left: Get.width / 95),
      child: back
          ? IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: back == false && callback == null
                  ? () {
                      Get.back();
                    }
                  : callback == null
                      ? () => Get.back()
                      : callback,
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
                decoration: InputDecoration(
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
            child: Icon(Icons.more_horiz_rounded),
          )),
    ],
  );
}
