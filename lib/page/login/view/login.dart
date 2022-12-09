import 'package:coscos/component/ImageLoc.dart';
import 'package:coscos/component/customText.dart';
import 'package:coscos/component/customWidget.dart';
import 'package:coscos/component/enum.dart';
import 'package:coscos/page/login/controller/authController.dart';
import 'package:coscos/page/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../component/color.dart';

class LoginPage extends GetView<AuthController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
        init: AuthController(), // INIT IT ONLY THE FIRST TIME
        builder: (_) => Scaffold(
              resizeToAvoidBottomInset: true,
              backgroundColor: Warna.biru2,
              body: SingleChildScrollView(
                child: SizedBox(
                  height: Get.height,
                  width: Get.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 0),
                        child: SizedBox(
                          height: 200,
                          child: Center(
                            child: Image.asset(ImageLoc.logoLoc),
                          ),
                        ),
                      ),
                      SizedBox(
                          width: Get.width,
                          child: Padding(
                            padding: EdgeInsets.all(Get.height / 15),
                            child: Column(
                              children: [
                                CustomWidget.customTextField(
                                    controller: controller.nameController,
                                    hintText: "Username",
                                    minLength: 4,
                                    bgColor: Warna.grey),
                                SizedBox(height: Get.height / 25),
                                Obx(
                                  () => controller
                                          .getMainController()
                                          .obsecureText
                                          .value
                                      ? CustomWidget.customTextField(
                                          controller:
                                              controller.passwordController,
                                          hintText: "Password",
                                          inputType: InputType.password,
                                          obsecureText: true,
                                          bgColor: Warna.grey)
                                      : CustomWidget.customTextField(
                                          controller:
                                              controller.passwordController,
                                          hintText: "Password",
                                          inputType: InputType.password,
                                          obsecureText: false,
                                          bgColor: Warna.grey),
                                ),
                                SizedBox(height: Get.height / 100),
                                SizedBox(
                                  width: Get.width,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      GestureDetector(
                                          onTap: () {
                                          },
                                          child: CustomText().titleText(
                                              "Forgot Password ?",
                                              textColor: Warna.kuning)),
                                    ],
                                  ),
                                ),
                                SizedBox(height: Get.height / 45),
                                SizedBox(
                                  width: Get.width,
                                  child: OutlinedButton(
                                      style: OutlinedButton.styleFrom(
                                        backgroundColor: Warna.biru,
                                        side: const BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0),
                                      ),
                                      onPressed: () {
                                        Get.find<MainController>().login();
                                      },
                                      child: const Text(
                                        "Login",
                                        style:
                                            TextStyle(color: Warna.softWhite),
                                      )),
                                ),
                                SizedBox(
                                  child: Row(
                                    children: [
                                      CustomText().longText(
                                          "Don't have an account?",
                                          textColor: Warna.softWhite),
                                      GestureDetector(
                                        onTap: () {
                                          controller.goToRegister();
                                        },
                                        child: CustomText().titleText(
                                            "  Register Now",
                                            textColor: Warna.kuning),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )),
                      // Container(
                      //     width: Get.width,
                      //     child: Padding(
                      //       padding: EdgeInsets.all(Get.height / 15 ),
                      //       child: OutlinedButton(
                      //           style: OutlinedButton.styleFrom(
                      //             backgroundColor: Warna.softBiruMuda,
                      //             side: BorderSide(
                      //                 color: Colors.transparent,
                      //                 width: 1.0),
                      //           ),
                      //           onPressed: () {
                      //             Get.find<MainController>().login();
                      //           },
                      //           child: Text(
                      //             "Login",
                      //             style: TextStyle(color: Warna.softWhite),
                      //           )),
                      //     ))
                    ],
                  ),
                ),
              ),
            ));
  }
}
