import 'package:coscos/component/ImageLoc.dart';
import 'package:coscos/component/customWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../component/color.dart';
import '../../dashboard/controller/dashboard_controller.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
        init: DashboardController(), // INIT IT ONLY THE FIRST TIME
        builder: (_) => Scaffold(
              resizeToAvoidBottomInset: true,
              backgroundColor: Warna.softMerahMuda2,
              body: Stack(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: Get.height / 4),
                        child: Center(
                          child: Image.asset(ImageLoc.logoLoc),
                        ),
                      ),
                      Container(
                          width: Get.width,
                          child: Padding(
                            padding: EdgeInsets.all(Get.height / 10),
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
                  Positioned(
                      bottom: Get.height / 50,
                      right: 0,
                      child: Container(
                          width: Get.width,
                          child: Padding(
                            padding: EdgeInsets.all(Get.height / 10),
                            child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  backgroundColor: Warna.softBiruMuda,
                                  side: BorderSide(
                                      color: Colors.transparent, width: 1.0),
                                ),
                                onPressed: null,
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
