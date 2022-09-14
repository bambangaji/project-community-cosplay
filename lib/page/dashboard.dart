import 'package:coscos/component/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dashboard_controller.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
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
                        padding: EdgeInsets.only(top: Get.width / 4),
                        child: Center(
                          child: Image.asset("lib/assets/bg/logo-bg.png"),
                        ),
                      ),
                      Container(
                          width: Get.width,
                          child: Padding(
                            padding: EdgeInsets.all(Get.width / 10),
                            child: Column(
                              children: [
                                Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Warna.softWhite),
                                    child: Padding(
                                      padding:
                                          EdgeInsets.only(left: Get.width / 30),
                                      child: TextFormField(
                                        decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            hintText: "Test@email.com"),
                                      ),
                                    )),
                                SizedBox(height: Get.width / 25),
                                Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Warna.softWhite),
                                    child: Padding(
                                      padding:
                                          EdgeInsets.only(left: Get.width / 30),
                                      child: TextFormField(
                                        decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            hintText: "Password"),
                                      ),
                                    )),
                                SizedBox(height: Get.width / 25),
                              ],
                            ),
                          )),
                    ],
                  ),
                  Positioned(
                      bottom: Get.width / 50,
                      right: 0,
                      child: Container(
                          width: Get.width,

                          child: Padding(
                            padding: EdgeInsets.all(Get.width / 10),
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                backgroundColor: Warna.softBiruMuda,
                               side: BorderSide(color: Colors.transparent, width: 1.0),
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
