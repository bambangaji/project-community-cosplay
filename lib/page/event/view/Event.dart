import 'package:coscos/component/MySliverAppBar.dart';
import 'package:coscos/component/baseScaffold.dart';
import 'package:coscos/component/color.dart';
import 'package:coscos/component/customText.dart';
import 'package:coscos/component/customWidget.dart';
import 'package:coscos/page/event/controller/eventController.dart';
import 'package:coscos/page/event/view/AttendanceDetail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';

class EventPage extends GetView<EventController> {
  const EventPage({Key? key}) : super(key: key);

  List<Widget> indicators(imagesLength, currentIndex) {
    return List<Widget>.generate(imagesLength, (index) {
      return Container(
        margin: const EdgeInsets.all(3),
        width: 10,
        height: 10,
        decoration: BoxDecoration(
            color: currentIndex == index ? Colors.white : Colors.white30,
            shape: BoxShape.circle),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EventController>(
        init: EventController(), // INIT IT ONLY THE FIRST TIME
        builder: (_) => CustomScaffold()
                .baseScaffold(context, isBack: false, appBar: false, children: [
              Stack(
                children: [
                  Container(
                    height: Get.height,
                    width: Get.width,
                    color: Warna.white,
                    child: CustomScrollView(
                      slivers: [
                        // SliverAppBar(
                        //   automaticallyImplyLeading: true,
                        //   pinned: false,
                        //   snap: false,
                        //   floating: false,
                        //   expandedHeight: 220.0,
                        //   flexibleSpace: Padding(
                        //     padding: const EdgeInsets.only(top: 24.0),
                        //     child: Stack(
                        //       children: [
                        //         SizedBox(
                        //           height: Get.height / 2.5,
                        //           width: Get.width,
                        //           child: PageView.builder(
                        //               itemCount: 3,
                        //               pageSnapping: true,
                        //               controller: controller.pageController,
                        //               onPageChanged: (page) {
                        //                 controller.changePage(page);
                        //               },
                        //               itemBuilder: (context, pagePosition) {
                        //                 return AnimatedContainer(
                        //                   duration: Duration(milliseconds: 500),
                        //                   curve: Curves.easeInOutCubic,
                        //                   height: Get.height / 4.5,
                        //                   width: Get.width,
                        //                   decoration: BoxDecoration(
                        //                     image: DecorationImage(
                        //                         image: AssetImage(
                        //                             "lib/assets/comifuro.jpg"),
                        //                         fit: BoxFit.cover),
                        //                   ),
                        //                 );
                        //               }),
                        //         ),
                        //         Positioned(
                        //             bottom: Get.height / 30,
                        //             child: Container(
                        //               width: Get.width,
                        //               child: Row(
                        //                   mainAxisAlignment:
                        //                       MainAxisAlignment.center,
                        //                   children:
                        //                       indicators(3, controller.activePage)),
                        //             )),
                        //       ],
                        //     ),
                        //   ),
                        // ),
                        SliverPersistentHeader(
                            pinned: true,
                            floating: false,
                            delegate: MySliverAppBar(
                                expandedHeight: Get.height / 2.3)),
                        SliverList(
                            delegate: SliverChildListDelegate(
                          [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 50.0),
                              child: Stack(
                                children: [controller.contentTab()],
                              ),
                            ),
                          ],
                        ))
                      ],
                    ),
                  ),
                  Positioned(
                      bottom: 0,
                      child: GestureDetector(
                        onTap: () {
                          controller.showAttendance();
                        },
                        child: Container(
                          width: Get.width,
                          height: 44,
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10)),
                              color: Warna.biruToscaMuda),
                          child: Center(
                            child: CustomText().titleTextWithIcon(
                                isCenter: true,
                                isBack: true,
                                "Attend this event",
                                Icons.edit),
                          ),
                        ),
                      )),
                  Obx(() => controller.isExpand.value
                      ? GestureDetector(
                          onTap: () => controller.viewPhoto(),
                          child: Container(
                            height: Get.height,
                            width: Get.width,
                            color: Warna.abuMuda.withOpacity(0.7),
                            child: Center(
                              child: Container(
                                width: Get.width - 40,
                                height: Get.height / 1.8,
                                child: PhotoView(
                                    imageProvider: const AssetImage(
                                        "lib/assets/mapEvent.jpg")),
                              ),
                            ),
                          ),
                        )
                      : Container()),
                  Obx(
                    () => controller.openAttendanceCosplayer.value
                        ? Positioned(
                            child: GestureDetector(
                            onTap: () {
                              controller.changeAttendanceCosplayer();
                            },
                            child: Container(
                              height: Get.height,
                              width: Get.width,
                              color: Warna.silver.withOpacity(0.8),
                              child: Container(
                                  width: Get.width,
                                  height: Get.height / 2,
                                  child: const AttendanceDetail()),
                            ),
                          ))
                        : Container(),
                  )
                ],
              ),
            ]));
  }
}
