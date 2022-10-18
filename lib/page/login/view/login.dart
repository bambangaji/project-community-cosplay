import 'package:coscos/component/ImageLoc.dart';
import 'package:coscos/component/customWidget.dart';
import 'package:coscos/page/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../component/color.dart';
import '../../dashboard/controller/dashboard_controller.dart';

class LoginPage extends GetView<MainController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
        init: MainController(), // INIT IT ONLY THE FIRST TIME
        builder: (_) => Scaffold(
              resizeToAvoidBottomInset: true,
              backgroundColor: Warna.softMerahMuda2,
              body: Stack(
                children: [
                  Container(
                    height: Get.height,
                    width: Get.width,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 0),
                            child: Center(
                              child: Image.asset(ImageLoc.logoLoc),
                            ),
                          ),
                          Container(
                              width: Get.width,
                              child: Padding(
                                padding: EdgeInsets.all(Get.height / 15),
                                child: Column(
                                  children: [
                                    CustomWidget.customTextField(
                                        hintText: "Email@Test.com"),
                                    SizedBox(height: Get.height / 25),
                                    CustomWidget.customTextField(
                                        hintText: "Password"),
                                    SizedBox(height: Get.height / 25),
                                  ],
                                ),
                              )),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: 10,
                      right: 0,
                      child: Container(
                          width: Get.width,
                          child: Padding(
                            padding: EdgeInsets.all(Get.height / 15),
                            child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  backgroundColor: Warna.softBiruMuda,
                                  side: BorderSide(
                                      color: Colors.transparent, width: 1.0),
                                ),
                                onPressed: () {
                                  Get.find<MainController>().login();
                                },
                                child: Text(
                                  "Login",
                                  style: TextStyle(color: Warna.softWhite),
                                )),
                          )))
                ],
              ),
            ));
  }
}
