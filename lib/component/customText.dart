import 'package:coscos/component/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomText {
  Text titleText(String Content,
      {Color textColor = Warna.hitam,
      double fontSize = 14,
      FontWeight fontWeight = FontWeight.bold}) {
    return Text(
      Content,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          color: textColor, fontWeight: fontWeight, fontSize: fontSize),
    );
  }

  Text titleTextWithoutBold(String Content,
      {Color textColor = Warna.hitam, double fontSize = 14}) {
    return Text(
      Content,
      style: TextStyle(
          color: textColor, fontWeight: FontWeight.normal, fontSize: fontSize),
    );
  }

  String Capitalize(String content) {
    return "${content[0].toUpperCase()}${content.substring(1).toLowerCase()}";
  }

  Text longText(String Content,
      {Color textColor = Warna.hitam, double fontSize = 14}) {
    return Text(
      Content,
      softWrap: true,
      textAlign: TextAlign.justify,
      style: TextStyle(
          height: 1.3,
          color: textColor,
          fontWeight: FontWeight.normal,
          fontSize: fontSize),
    );
  }

  Widget titleTextWithIcon(String Content, IconData icon,
      {Color textColor = Warna.white,
      double fontSize = 14,
      Color iconColor = Warna.softWhite,
      bool isBack = false,
      bool isCenter = false,
      FontWeight fontWeight = FontWeight.bold}) {
    return Row(
      mainAxisAlignment:
          isCenter ? MainAxisAlignment.center : MainAxisAlignment.start,
      children: [
        isBack
            ? Icon(
                icon,
                color: iconColor,
              )
            : Container(),
        Text(
          Content,
          maxLines: 5,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: textColor, fontWeight: fontWeight, fontSize: fontSize),
        ),
        !isBack
            ? Icon(
                icon,
                color: iconColor,
              )
            : Container()
      ],
    );
  }

  Widget bulletList(String Content,
      {Color textColor = Warna.hitam,
      double fontSize = 14,
      FontWeight fontWeight = FontWeight.bold}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("• "),
        Expanded(
          child: Text(
            Content,
            style: TextStyle(
              color: textColor,
              fontWeight: fontWeight,
              fontSize: fontSize,
            ),
          ),
        ),
      ],
    );
  }

  Widget titleTextWithWidgetIcon(String Content, Widget icon,
      {Color textColor = Warna.white,
      double fontSize = 14,
      Color iconColor = Warna.softWhite,
      bool isBack = false,
      bool isMaxWidth = false,
      // double width = Get.width,
      FontWeight fontWeight = FontWeight.bold}) {
    return Row(
      children: [
        isBack
            ? Padding(
                padding: EdgeInsets.only(right: 4.0),
                child: icon,
              )
            : Container(),
        Container(
          width: isMaxWidth ? null : 77,
          child: Text(
            Content,
            maxLines: 1,
            softWrap: true,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color: textColor, fontWeight: fontWeight, fontSize: fontSize),
          ),
        ),
        !isBack
            ? Padding(
                padding: EdgeInsets.only(left: 4.0),
                child: icon,
              )
            : Container()
      ],
    );
  }
}
