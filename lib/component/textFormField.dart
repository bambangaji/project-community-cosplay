// ignore_for_file: must_be_immutable, library_private_types_in_public_api, file_names

import 'dart:async';

import 'package:coscos/component/color.dart';
import 'package:coscos/component/customText.dart';
import 'package:coscos/component/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextFieldExample extends StatefulWidget {
  String? hintText = "";
  void Function()? callBack;
  void Function(String)? onChanged;
  // String? Function(String)? validator,
  bool? isDisable = false;
  bool? obsecureText = false;
  int? validator = 0;
  InputBorder? inputBorder = InputBorder.none;
  Rx<TextEditingController>? controller;
  Color? bgColor = Warna.softWhite;
  TextFieldExample(
      {super.key, required this.hintText,
      required this.validator,
      required this.isDisable,
      required this.bgColor,
      this.controller});
  @override
  _TextFieldExampleState createState() => _TextFieldExampleState();
}

class _TextFieldExampleState extends State<TextFieldExample> {
  @override
  void dispose() {
    _username.close();
    _password.close();
    super.dispose();
  }

  String? validatorMessage;
  bool validate =
      false; //will be true if the user clicked in the    login button
  final _username =
      StreamController<String>(); //stream to   validate   the text
  final _password = StreamController<String>();

  @override
  Widget build(BuildContext context) {
    bool showError = false;
    String message = "";
    return Column(
      children: [
        Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15), color: widget.bgColor),
            child: Padding(
              padding: EdgeInsets.only(left: Get.height / 30),
              child: Column(
                children: [
                  TextFormField(
                    autofocus: true,
                    // onChanged: onChanged,
                    // obscureText: obsecureText,
                    controller: widget.controller?.value,
                    // onTap: callBack,
                    readOnly: widget.isDisable!,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        showError = true;
                        message = 'Can\'t be empty';

                        return null;
                      }
                      if (widget.validator == 1) {
                        if (validatorEmail(text)) {
                          return null;
                        } else {
                          showError = true;
                          message = 'Can\'t be empty';

                          return null;
                        }
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      border: widget.inputBorder,
                      hintText: widget.hintText,
                    ),
                  ),
                ],
              ),
            )),
        showError ? CustomText().titleTextWithoutBold(message) : Container()
      ],
    );
  }
}
