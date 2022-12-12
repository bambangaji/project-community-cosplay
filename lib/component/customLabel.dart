import 'package:coscos/component/color.dart';
import 'package:coscos/component/customText.dart';
import 'package:coscos/component/fontSize.dart';
import 'package:flutter/cupertino.dart';

class customLabel {
  static Widget labelGreen(String message) {
    return Container(
        decoration: BoxDecoration(
            color: Warna.softIjoMuda.withOpacity(0.35),
            borderRadius: BorderRadius.circular(5)),
        child: Padding(
            padding: const EdgeInsets.fromLTRB(6, 3, 6, 3),
            child: CustomText().titleText(message,
                textColor: Warna.green, fontSize: FontSize.small)));
  }

  static Widget labelBlue(String message) {
    return Container(
        decoration: BoxDecoration(
            color: Warna.flowerBlue.withOpacity(0.35),
            borderRadius: BorderRadius.circular(5)),
        child: Padding(
            padding: const EdgeInsets.fromLTRB(6, 3, 6, 3),
            child: CustomText().titleText(message,
                textColor: Warna.biru, fontSize: FontSize.small)));
  }
}
