import 'package:coscos/component/color.dart';
import 'package:coscos/component/customText.dart';
import 'package:coscos/component/header.dart';
import 'package:coscos/page/list/controller/ListController.dart';
import 'package:coscos/page/list/view/Add.dart';
import 'package:dropdown_below/dropdown_below.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageList extends GetView<ListController> {
  const PageList({Key? key}) : super(key: key);
  Container dialogDate(bool confirm) {
    return Container(
      width: Get.width / 1.5,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          OutlinedButton(
            onPressed: () {
              // Get.off(PageDashboard());
            },
            style: OutlinedButton.styleFrom(
                elevation: 5.0,
                backgroundColor: Warna.white,
                side: const BorderSide(color: Warna.biruTua, width: 1.1),
                shape: const StadiumBorder(),
                fixedSize: Size(Get.width / 5, 20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Icon(
                //   Icons.arrow_left_outlined,
                //   color: Warna.biruTua,
                // ),
                GestureDetector(
                  onTap: () {},
                  child: const Text(
                    'Confirm',
                    style: TextStyle(color: Warna.biruTua),
                  ),
                )
              ],
            ),
          ),
          OutlinedButton(
            onPressed: () {
              // Get.off(PageDashboard());
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Icon(
                //   Icons.arrow_left_outlined,
                //   color: Warna.biruTua,
                // ),
                GestureDetector(
                  onTap: () {},
                  child: const Text(
                    'Back',
                    style: TextStyle(color: Warna.biruTua),
                  ),
                )
              ],
            ),
            style: OutlinedButton.styleFrom(
                elevation: 5.0,
                backgroundColor: Warna.white,
                side: const BorderSide(color: Warna.biruTua, width: 1.1),
                shape: const StadiumBorder(),
                fixedSize: Size(Get.width / 5, 20)),
          ),
        ],
      ),
    );
  }

  Container contentDialog(BuildContext context) {
    return Container(
      // color: Warna.abuDisable,
      height: 60,
      // width: 200,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Container(
              //   width: 100,
              //   // height: 20,
              //   child: TextFormField(
              //     controller: controller.StartDateController.value,
              //     decoration: InputDecoration(
              //       border: UnderlineInputBorder(),
              //       labelText: 'Start Date',
              //     ),
              //     readOnly: true,
              //     onTap: () {
              //       controller.selectDate(context, 1);
              //     },
              //     // initialValue: "test",
              //   ),
              // ),
              // Container(
              //   width: 100,
              //   // height: 20,
              //   child: TextFormField(
              //     controller: controller.EndDateController.value,
              //     decoration: InputDecoration(
              //       border: UnderlineInputBorder(),
              //       labelText: 'End Date',
              //     ),
              //     readOnly: true,
              //     onTap: () {
              //       controller.selectDate(context, 2);
              //     },
              //     // initialValue: "test",
              //   ),
              // )
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    controller.onRebuild();
    return GetBuilder<ListController>(
        init: ListController(), // INIT IT ONLY THE FIRST TIME
        builder: (_) => LoadingOverlay(
            isLoading: controller.isLoading.value,
            child: Stack(
              children: [
                Scaffold(
                  backgroundColor: Warna.abuMudaBG,
                  appBar: CustomAppBar(context, back: true, callback: () {
                    Get.back();
                    // controller.resetAll();
                  }),
                  body: SizedBox(
                    height: Get.height,
                    width: Get.width,
                    child: Stack(children: [
                      Positioned(
                          top: 7,
                          left: 7,
                          child: Container(
                            width: Get.width,
                            height: 50,
                            child: Center(
                              child: ListView(
                                padding: const EdgeInsets.all(5),
                                scrollDirection: Axis.horizontal,
                                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  // Padding(
                                  //   padding: const EdgeInsets.only(right: 9.0),
                                  //   child: controller.resetFilter(),
                                  // ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 12.0),
                                    child: DropdownBelow(
                                      itemWidth: 100,
                                      itemTextstyle: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black),
                                      boxTextstyle: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Warna.biruTua),
                                      boxPadding: const EdgeInsets.fromLTRB(
                                          12, 0, 0, 0),
                                      boxWidth: 100,
                                      boxHeight: 35,
                                      boxDecoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.black.withOpacity(0.2),
                                              spreadRadius: 1.1,
                                              blurRadius: 5,
                                              offset: const Offset(1, 1),
                                            )
                                          ],
                                          // border: Border.all(
                                          //     color: Warna.biruTua, width: 1.1),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Warna.white),
                                      hint: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8),
                                          child: CustomText().titleText(
                                            "All",
                                            textColor: Warna.biruTua,
                                          )),
                                      value: controller.selectedType,
                                      items: controller.dropdownType,
                                      onChanged:
                                          controller.onChangeDropdownType,
                                    ),
                                  ),
                                  // controller.selectedOrder == "" ||
                                  //         controller.selectedOrder
                                  //                 .toLowerCase() ==
                                  //             "signing"
                                  //     ? Padding(
                                  //         padding: const EdgeInsets.only(
                                  //             right: 12.0),
                                  //         child: OutlinedButton(
                                  //           onPressed: () {
                                  //             // Get.off(PageDashboard());
                                  //             Get.defaultDialog(
                                  //                 title: "Chose Date",
                                  //                 contentPadding:
                                  //                     const EdgeInsets.all(15),
                                  //                 textConfirm: "Confirm",
                                  //                 textCancel: "Cancel",
                                  //                 onConfirm: () {
                                  //                   // controller.confirmFilter(1);
                                  //                   Navigator.pop(context);
                                  //                 },
                                  //                 confirmTextColor:
                                  //                     Colors.white,
                                  //                 content:
                                  //                     contentDialog(context));
                                  //             // child: dialogDate(true)));
                                  //             // showAlertDialog(context);
                                  //           },
                                  //           style: OutlinedButton.styleFrom(
                                  //             elevation: 5.0,
                                  //             backgroundColor: Warna.white,
                                  //             side: const BorderSide(
                                  //                 color: Warna.biruTua,
                                  //                 width: 1.1),
                                  //             shape: const StadiumBorder(),
                                  //             // fixedSize: Size(size.width! / 3.3, 20)
                                  //           ),
                                  //           child: Row(
                                  //             mainAxisAlignment:
                                  //                 MainAxisAlignment.spaceAround,
                                  //             children: [
                                  //               // Icon(
                                  //               //   Icons.arrow_left_outlined,
                                  //               //   color: Warna.biruTua,
                                  //               // ),
                                  //               Text(
                                  //                 controller.filterDate.value
                                  //                     ? "${controller.StartDateController.value.text} - ${controller.EndDateController.value.text}"
                                  //                     : 'Date Document',
                                  //                 style: const TextStyle(
                                  //                     color: Warna.biruTua),
                                  //               )
                                  //             ],
                                  //           ),
                                  //         ),
                                  //       )
                                  //     : Container(),
                                ],
                              ),
                            ),
                          )),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 60.0, 0, 0),
                        child: Obx(() => controller.isRebuild.value
                            ? const Center(
                                child: SizedBox(
                                    height: 50,
                                    width: 50,
                                    child: CircularProgressIndicator()),
                              )
                            : Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: controller.cardListDocument(),
                              )),
                      ),
                    ]),
                  ),
                  floatingActionButton: Obx(() => controller.openAdd.value
                      ? Container()
                      : GestureDetector(
                          onTap: () {
                            controller.changeAddBtn();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [
                                    Color(0xff00bcd4),
                                    Color(0xff8fcaf9)
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                borderRadius: BorderRadius.circular(100)),
                            child: const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Icon(Icons.add,
                                  color: Colors.white, size: 40),
                            ),
                          ),
                        )),
                ),
                Obx(() => controller.openAdd.value
                    ? Positioned(
                        child: GestureDetector(
                        onTap: () {
                          controller.changeAddBtn();
                        },
                        child: Container(
                          height: Get.height,
                          width: Get.width,
                          color: Warna.silver.withOpacity(0.8),
                          child: Container(
                              width: Get.width,
                              height: Get.height / 2,
                              child: AddDetail()),
                        ),
                      ))
                    : Container())
              ],
            )));
    // ));
  }
}
