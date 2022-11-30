import 'package:coscos/component/color.dart';
import 'package:coscos/component/customText.dart';
import 'package:coscos/component/customWidget.dart';
import 'package:coscos/page/event/controller/eventController.dart';
import 'package:coscos/page/list/controller/ListController.dart';
import 'package:dropdown_below/dropdown_below.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddDetail extends GetView<ListController> {
  const AddDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SizedBox.expand(
          child: DraggableScrollableSheet(
              minChildSize: 0.2,
              initialChildSize: 340 / Get.height,
              maxChildSize: 340 / Get.height,
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return GestureDetector(
                  onTap: () {
                    print("object");
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Warna.white,
                        borderRadius: BorderRadius.circular(10)),
                    height: Get.height - (Get.width / 4),
                    child: ListView.builder(
                      controller: scrollController,
                      itemCount: 1,
                      itemBuilder: (BuildContext context, int index) {
                        return Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 50,
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 10.0),
                                    child: CustomText().titleText("Name"),
                                  ),
                                  Obx(() => CustomWidget.customTextField(
                                      callBack: () {
                                        // controller.goToSerialPage();
                                      },
                                      hintText: "Naruto",
                                      bgColor: Warna.grey,
                                      controller: controller.addSerialName,
                                      isDisable: false)),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      controller.typeContent == 1
                                          ? Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 14.0,
                                                          top: 14),
                                                  child: CustomText().titleText(
                                                      "Select Type Serial"),
                                                ),
                                                DropdownBelow(
                                                  boxHeight: 40,
                                                  itemWidth: Get.width / 3,
                                                  itemTextstyle:
                                                      const TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: Colors.black),
                                                  boxTextstyle: const TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Warna.softBlack),
                                                  boxPadding:
                                                      const EdgeInsets.fromLTRB(
                                                          12, 0, 0, 0),
                                                  boxWidth: Get.width / 2.2,
                                                  // boxHeight: 45,
                                                  boxDecoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      color: Warna.grey),
                                                  hint: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 8),
                                                      child: CustomText()
                                                          .titleText(
                                                        "Anime",
                                                        textColor:
                                                            Warna.softBlack,
                                                      )),
                                                  value: controller
                                                      .addSelectedType,
                                                  items: controller
                                                      .dropdownAddType,
                                                  onChanged: controller
                                                      .onChangeDropdownAddType,
                                                ),
                                              ],
                                            )
                                          : Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 14.0,
                                                          top: 14),
                                                  child: CustomText().titleText(
                                                      "Select Gender"),
                                                ),
                                                DropdownBelow(
                                                  boxHeight: 40,
                                                  itemWidth: Get.width / 3,
                                                  itemTextstyle:
                                                      const TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: Colors.black),
                                                  boxTextstyle: const TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Warna.softBlack),
                                                  boxPadding:
                                                      const EdgeInsets.fromLTRB(
                                                          12, 0, 0, 0),
                                                  boxWidth: Get.width / 2.2,
                                                  // boxHeight: 45,
                                                  boxDecoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      color: Warna.grey),
                                                  hint: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 8),
                                                      child: CustomText()
                                                          .titleText(
                                                        "Male",
                                                        textColor:
                                                            Warna.softBlack,
                                                      )),
                                                  value: controller
                                                      .addSelectedGender,
                                                  items:
                                                      controller.dropdownGender,
                                                  onChanged: controller
                                                      .onChangeDropdownAddGender,
                                                ),
                                              ],
                                            ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 14.0, top: 14),
                                            child: CustomText()
                                                .titleText("Select Picture"),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              controller.pickImage();
                                            },
                                            child: SizedBox(
                                              width: Get.width / 2.2,
                                              child: OutlinedButton(
                                                  style: TextButton.styleFrom(
                                                      fixedSize: Size(
                                                          Get.width / 2.2, 40),
                                                      backgroundColor:
                                                          Warna.grey,
                                                      side: BorderSide.none),
                                                  onPressed: null,
                                                  child: CustomText().titleText(
                                                      "Upload",
                                                      textColor:
                                                          Warna.softBlack)),
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  CustomText().titleTextWithoutBold(
                                      controller.fileName == ""
                                          ? "*Max upload 5Mb"
                                          : controller.fileName,
                                      textColor: Colors.red),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    width: Get.width,
                                    child: OutlinedButton(
                                        style: TextButton.styleFrom(
                                            backgroundColor: Warna.biruTua),
                                        onPressed: () {
                                          controller.SubmitSerial();
                                        },
                                        child: CustomText().titleText("Submit",
                                            textColor: Warna.white)),
                                  )
                                ],
                              ),
                            ),
                            Positioned(
                                top: -10,
                                child: SizedBox(
                                  width: Get.width,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 8.0),
                                        child: Center(
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: Warna.abuDisable,
                                            ),
                                            width: Get.width / 10,
                                            height: Get.width / 60,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                          padding: const EdgeInsets.all(0.0),
                                          child: Padding(
                                              padding: EdgeInsets.only(
                                                  top: 15,
                                                  bottom: Get.width / 20),
                                              child: Column(children: [
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      right: Get.width / 20,
                                                      left: Get.width / 20),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        controller.typeContent ==
                                                                1
                                                            ? "Serial Form"
                                                            : "Character Form",
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: TextStyle(
                                                          color: Warna.abuAbu,
                                                          fontSize:
                                                              Get.width / 25,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      // Image.asset(
                                                      //   "lib/assets/payment/BCA.png",
                                                      //   width: Get.width / 5,
                                                      // )
                                                    ],
                                                  ),
                                                ),
                                                Divider(
                                                  color: Colors.grey[300],
                                                  thickness: 1,
                                                ),
                                              ]))),
                                    ],
                                  ),
                                ))
                          ],
                        );
                      },
                    ),
                  ),
                );
              })),
    );
  }
}
