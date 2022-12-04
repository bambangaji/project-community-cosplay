import 'package:cached_network_image/cached_network_image.dart';
import 'package:coscos/component/enum.dart';
import 'package:coscos/component/shimmerCustom.dart';
import 'package:coscos/component/validator.dart';
import 'package:coscos/page/dashboard/model/anime.dart';
import 'package:coscos/page/dashboard/model/character.dart';
import 'package:coscos/page/dashboard/model/ticketModel.dart';
import 'package:coscos/page/main_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'card.dart';
import 'color.dart';
import 'customText.dart';

class CustomWidget {
  static showSnackBar(String message) {
    Get.showSnackbar(GetSnackBar(
      message: message,
      duration: Duration(seconds: 1),
    ));
  }

  static Widget customTextField(
      {String hintText = "",
      int minLength = 0,
      void Function()? callBack,
      void Function(String)? onChanged,
      // String? Function(String)? validator,
      bool isDisable = false,
      bool obsecureText = false,
      int validator = 0,
      int type = 0,
      InputType inputType = InputType.none,
      InputBorder inputBorder = InputBorder.none,
      Rx<TextEditingController>? controller,
      bool isMandatory = true,
      Color bgColor = Warna.softWhite}) {
    return TextFormField(
      autofocus: true,
      onChanged: onChanged,
      obscureText: obsecureText,
      controller: controller?.value,
      onTap: callBack,
      readOnly: isDisable,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (isMandatory) {
          if (value == null || value.isEmpty) {
            return "Can't be empty";
          }
          if (inputType == InputType.email) {
            if (!GetUtils.isEmail(value!)) {
              return "Invalid email format";
            } else {
              return null;
            }
          }
          if (inputType == InputType.phone) {
            if (!GetUtils.isPhoneNumber(value!)) {
              return "Invalid phone number format";
            } else {
              return null;
            }
          }
          if (inputType == InputType.password) {
            if (!validateStructure(value!)) {
              return "*Password must like 'Abcdefg123!' ";
            } else {
              return null;
            }
          }
          if (minLength > 0) {
            if (value.length < minLength) {
              return "Min length $minLength";
            } else {
              return null;
            }
          } else {
            return null;
          }
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xffEEF2F7),
        suffixIcon: inputType == InputType.password
            ? GestureDetector(
                onTap: () {
                  Get.find<MainController>().changeObsecureText();
                },
                child: Icon(
                    obsecureText
                        ? Icons.remove_red_eye_outlined
                        : Icons.remove_red_eye,
                    color: Warna.abuMuda),
              )
            : null,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Warna.flowerGreen, width: 2),
          borderRadius: BorderRadius.circular(15.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.pink[400]!, width: 2),
          borderRadius: BorderRadius.circular(15.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(15.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(15.0),
        ),
        border: inputBorder,
        hintText: hintText,
      ),
    );
  }

  Widget emailField(
    Rx<TextEditingController>? controller,
  ) {
    return Container(
      margin: const EdgeInsets.all(15),
      child: TextFormField(
        controller: controller?.value,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10.0),
          ),
          fillColor: const Color(0xffEEF2F7),
          hintText: 'Email',
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xff535FF7), width: 2),
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.pink[400]!, width: 2),
            borderRadius: BorderRadius.circular(10.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        validator: (value) {
          if (!GetUtils.isEmail(value!)) {
            return "Invalid email";
          } else {
            return null;
          }
        },
      ),
    );
  }

  Widget customTextFieldDynamic(
      {String hintText = "",
      void Function()? callBack,
      void Function(String)? onChanged,
      // String? Function(String)? validator,
      bool isDisable = false,
      bool obsecureText = false,
      int validator = 0,
      InputBorder inputBorder = InputBorder.none,
      Rx<TextEditingController>? controller,
      Color bgColor = Warna.softWhite}) {
    var mainController = Get.find<MainController>();
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: bgColor),
        child: Padding(
          padding: EdgeInsets.only(left: Get.height / 30),
          child: Column(
            children: [
              TextFormField(
                autofocus: true,
                onChanged: onChanged,
                obscureText: obsecureText,
                controller: controller?.value,
                onTap: callBack,
                readOnly: isDisable,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    mainController.showErrorMessage(1, text: "Empty");
                    return null;
                  }
                  if (validator == 1) {
                    if (validatorEmail(text)) {
                      return null;
                    } else {
                      return "Insert email format correctly";
                    }
                  }
                  // if (text.length < 4) {
                  //   return 'Too short';
                  // }
                  mainController.showErrorMessage(0, text: "Empty");
                  return null;
                },
                decoration: InputDecoration(
                  border: inputBorder,
                  hintText: hintText,
                ),
              ),
              Obx(() => mainController.showError.value
                  ? CustomText()
                      .titleTextWithoutBold(mainController.message.value)
                  : Container())
            ],
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
                color: data.tiketFee > 100000 ? Warna.pink : Warna.softIjoMuda),
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

  static Widget ListTileTopUpCard(
      {required String leadIconLocation,
      required String title,
      String? subTitle,
      Widget? icon,
      required void Function() callBack,
      bool isPopular = false,
      double imageWidth = 10}) {
    return customCard().cardWidgetAnime(
        ListTile(
          trailing: Icon(
            Icons.keyboard_arrow_right_outlined,
            color: Warna.softBlack,
            size: Get.width / 15,
          ),
          leading: Container(
            height: 150,
            width: 90,
            decoration: BoxDecoration(
              // color: Colors.amber,
              borderRadius: BorderRadius.circular(10),
            ),
            child: CachedNetworkImage(
              imageUrl: leadIconLocation,
              placeholder: (context, url) => new CircularProgressIndicator(),
              errorWidget: (context, url, error) => new Icon(Icons.error),
            ),
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          title: Row(
            children: [
              Text(
                title,
                style: const TextStyle(
                    color: Warna.softBlack,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
              icon ?? Container()
            ],
          ),
          subtitle: subTitle == null
              ? null
              : Text(
                  CustomText().Capitalize(subTitle),
                  style: TextStyle(color: Warna.softBlack),
                ),
          tileColor: Colors.white,
        ),
        callBack: callBack,
        colorBg: Warna.white,
        colorBorder: Warna.white,
        isPopular: isPopular);
  }

  static Widget ListTileTopUpCardGrid(
      {required String leadIconLocation,
      required String title,
      String? subTitle,
      Widget? icon,
      required void Function() callBack,
      bool isPopular = false,
      double imageWidth = 10}) {
    return SizedBox(
        height: 300,
        width: 200,
        child: Stack(
          children: [
            SizedBox(
              height: 300,
              width: 200,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: CachedNetworkImage(
                  fit: BoxFit.fitWidth,
                  imageUrl: leadIconLocation,
                  placeholder: (context, url) => ShimmerLoading(
                      isLoading: true,
                      child: Container(
                        width: 200,
                        height: 300,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)),
                      )),
                  errorWidget: (context, url, error) => new Icon(Icons.error),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                width: 200,
                height: 30,
                decoration: BoxDecoration(
                  color: Warna.softBlack.withOpacity(0.7),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: CustomText()
                          .titleText(title, textColor: Warna.abuDisable),
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }

  static Future<dynamic> showDialog(String title, String content) {
    return Get.defaultDialog(
        title: title,
        content: Center(
          child: CustomText().titleTextWithoutBold(content),
        ));
  }
}
