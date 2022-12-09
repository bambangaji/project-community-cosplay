import 'package:coscos/component/color.dart';
import 'package:coscos/component/customText.dart';
import 'package:coscos/component/customWidget.dart';
import 'package:coscos/component/enum.dart';
import 'package:coscos/component/header.dart';
import 'package:coscos/page/login/controller/authController.dart';
import 'package:coscos/page/login/view/pin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';

class RegisterPage extends GetView<AuthController> {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
        init: AuthController(), // INIT IT ONLY THE FIRST TIME
        builder: (_) => Obx(() => LoadingOverlay(
              progressIndicator: const CircularProgressIndicator(),
              isLoading: controller.getMainController().isLoading.value,
              color: Warna.white,
              opacity: 0.7,
              child: Scaffold(
                appBar: CustomAppBar(context,
                    back: true, title: "Register", isSearchBar: false),
                resizeToAvoidBottomInset: true,
                backgroundColor: Warna.softWhite,
                body: SizedBox(
                  height: Get.height,
                  width: Get.width,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: SizedBox(
                        height: Get.height - 130,
                        width: Get.width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 8),
                                CustomText().titleText("Username"),
                                const SizedBox(height: 8),
                                CustomWidget.customTextField(
                                    controller: controller.nameController,
                                    hintText: "JoeStar",
                                    minLength: 4,
                                    bgColor: Warna.grey),
                                const SizedBox(height: 8),
                                CustomText().titleText("Email"),
                                const SizedBox(height: 8),
                                CustomWidget.customTextField(
                                    validator: 1,
                                    controller: controller.emailController,
                                    hintText: "Email@Test.com",
                                    bgColor: Warna.grey),
                                const SizedBox(height: 15),
                                CustomText().titleText("Password"),
                                const SizedBox(height: 8),
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
                                const SizedBox(height: 8),
                                CustomText().titleText("Re-Type Password"),
                                const SizedBox(height: 8),
                                Obx(
                                  () => controller
                                          .getMainController()
                                          .obsecureText
                                          .value
                                      ? CustomWidget.customTextField(
                                          controller:
                                              controller.repasswordController,
                                          hintText: "Password",
                                          inputType: InputType.password,
                                          obsecureText: true,
                                          bgColor: Warna.grey)
                                      : CustomWidget.customTextField(
                                          controller:
                                              controller.repasswordController,
                                          hintText: "Password",
                                          inputType: InputType.password,
                                          obsecureText: false,
                                          bgColor: Warna.grey),
                                ),
                                // const SizedBox(height: 8),
                              ],
                            ),
                            Column(
                              children: [
                                SizedBox(
                                    width: Get.width,
                                    child: Padding(
                                      padding: EdgeInsets.zero,
                                      // padding: EdgeInsets.fromLTRB(
                                      //     Get.height / 15, 10, Get.height / 15, 0),

                                      child: OutlinedButton(
                                          style: OutlinedButton.styleFrom(
                                            backgroundColor: Warna.moonStone,
                                            side: const BorderSide(
                                                color: Colors.transparent,
                                                width: 1.0),
                                          ),
                                          onPressed: () {
                                            controller.register();
                                          },
                                          child: const Text(
                                            "Register",
                                            style: TextStyle(
                                                color: Warna.softWhite),
                                          )),
                                    )),
                                SizedBox(
                                  width: Get.width,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CustomText().longText(
                                          "Already have an account?",
                                          textColor: Warna.softBlack),
                                      GestureDetector(
                                        onTap: () {
                                          Get.to(const PageOTP());
                                        },
                                        child: CustomText().titleText("  Login",
                                            textColor: Warna.biruTua),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )));
  }
}
