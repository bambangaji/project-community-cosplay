import 'dart:ui';

import 'package:coscos/component/color.dart';
import 'package:coscos/component/customText.dart';
import 'package:coscos/page/event/controller/eventController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MySliverAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;

  MySliverAppBar({required this.expandedHeight});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      decoration: const BoxDecoration(
        color: Warna.white,
        // image: DecorationImage(
        //     fit: BoxFit.cover,
        //     image: AssetImage("lib/assets/comifuro.jpg")
        //     )
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 24.0),
        child: Stack(
          clipBehavior: Clip.none,
          fit: StackFit.expand,
          children: [
            Positioned(
              top: shrinkOffset > (expandedHeight - 130)
                  ? -(expandedHeight - 130)
                  : 0 - shrinkOffset,
              child: Stack(
                children: [
                  SizedBox(
                    height: expandedHeight - 30,
                    width: Get.width,
                    child: PageView.builder(
                        itemCount: 3,
                        pageSnapping: true,
                        controller: Get.find<EventController>().pageController,
                        onPageChanged: (page) {
                          Get.find<EventController>().changePage(page);
                        },
                        itemBuilder: (context, pagePosition) {
                          return AnimatedContainer(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOutCubic,
                            height: Get.height / 4.5,
                            width: Get.width,
                            child: Container(
                              child: BackdropFilter(
                                filter: shrinkOffset > 120
                                    ? ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0)
                                    : ImageFilter.blur(
                                        sigmaX: 0.0, sigmaY: 0.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.0)),
                                ),
                              ),
                            ),
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("lib/assets/comifuro.jpg"),
                                  fit: BoxFit.cover),
                            ),
                          );
                        }),
                  ),
                  Positioned(
                      bottom: Get.height / 18,
                      child: Container(
                        width: Get.width,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: Get.find<EventController>().indicators(
                                3, Get.find<EventController>().activePage)),
                      )),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: shrinkOffset > (((Get.height / 2.6) - 30) - 65)
                      ? 65
                      : (Get.height / 2.6) - 30 - shrinkOffset),
              child: Container(
                alignment: Alignment.centerLeft,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      topLeft: Radius.circular(10),
                    ),
                    // gradient: LinearGradient(
                    //   begin: Alignment.topCenter,
                    //   end: Alignment.bottomCenter,
                    //   colors: [
                    //     Color(0xff8360c3),
                    //     Color(0xff2ebf91),
                    //   ],
                    // ),
                    color: Warna.softWhite),
                // child: IconButton(
                //   onPressed: () {
                //     Navigator.pop(context);
                //   },
                //   icon: const Icon(
                //     Icons.arrow_back_ios,
                //     color: Colors.black,
                //   ),
                // ),
              ),
            ),
            // Padding(
            //   padding: EdgeInsets.only(top: 00.0),
            //   child: Center(
            //     child: Opacity(
            //       opacity: shrinkOffset / expandedHeight,
            //       child: const Text(
            //         'My Profile',
            //         style: TextStyle(
            //           color: Colors.black,
            //           fontWeight: FontWeight.w700,
            //           fontSize: 23,
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            Positioned(
              top: shrinkOffset > (((Get.height / 2.6) - 20) - 75)
                  ? 75
                  : (Get.height / 2.6) - 20 - shrinkOffset,
              // left: MediaQuery.of(context).size.width / 4,
              left: 0,
              child: Opacity(
                // opacity: (1 - shrinkOffset / expandedHeight),
                opacity: 1,
                child: Container(
                  height: 30,
                  width: Get.width,
                  decoration: const BoxDecoration(
                      border:
                          Border(bottom: BorderSide(color: Warna.softSilver))),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 6),
                    child: ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.find<EventController>().changeTab(1);
                          },
                          child: Container(
                              width: 100,
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Get.find<EventController>()
                                                      .selectTab ==
                                                  1
                                              ? Warna.softBiruMuda
                                              : Colors.transparent,
                                          width: 3))),
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 5.0),
                                child: Center(
                                    child: CustomText().titleText("Information",
                                        fontWeight: Get.find<EventController>()
                                                    .selectTab ==
                                                1
                                            ? FontWeight.bold
                                            : FontWeight.normal)),
                              )),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.find<EventController>().changeTab(2);
                          },
                          child: Container(
                              width: 100,
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Get.find<EventController>()
                                                      .selectTab ==
                                                  2
                                              ? Warna.softBiruMuda
                                              : Colors.transparent,
                                          width: 3))),
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 5.0),
                                child: Center(
                                    child: CustomText().titleText("Rules",
                                        fontWeight: Get.find<EventController>()
                                                    .selectTab ==
                                                2
                                            ? FontWeight.bold
                                            : FontWeight.normal)),
                              )),
                        ),
                        // GestureDetector(
                        //   onTap: () {
                        //     Get.find<EventController>().changeTab(3);
                        //   },
                        //   child: Container(
                        //       width: 100,
                        //       decoration: BoxDecoration(
                        //           border: Border(
                        //               bottom: BorderSide(
                        //                   color: Get.find<EventController>()
                        //                               .selectTab ==
                        //                           3
                        //                       ? Warna.softBiruMuda
                        //                       : Colors.transparent,
                        //                   width: 3))),
                        //       child: Padding(
                        //         padding: const EdgeInsets.only(bottom: 5.0),
                        //         child: Center(
                        //             child:
                        //                 CustomText().titleText("Guest Star")),
                        //       )),
                        // ),
                        GestureDetector(
                          onTap: () {
                            Get.find<EventController>().changeTab(3);
                          },
                          child: Container(
                              width: 100,
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Get.find<EventController>()
                                                      .selectTab ==
                                                  3
                                              ? Warna.softBiruMuda
                                              : Colors.transparent,
                                          width: 3))),
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 5.0),
                                child: Center(
                                    child: CustomText().titleText("Cosplayer",
                                        fontWeight: Get.find<EventController>()
                                                    .selectTab ==
                                                3
                                            ? FontWeight.bold
                                            : FontWeight.normal)),
                              )),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.find<EventController>().changeTab(4);
                            // Get.showSnackbar(GetSnackBar(
                            //   duration: Duration(seconds: 2),
                            //   message: "Coming Soon",
                            //   backgroundColor: Warna.abuMuda,
                            // ));
                          },
                          child: Container(
                              width: 100,
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Get.find<EventController>()
                                                      .selectTab ==
                                                  4
                                              ? Warna.softBiruMuda
                                              : Colors.transparent,
                                          width: 3))),
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 5.0),
                                child: Center(
                                    child: CustomText().titleText("Run Down",
                                        fontWeight: Get.find<EventController>()
                                                    .selectTab ==
                                                4
                                            ? FontWeight.bold
                                            : FontWeight.normal)),
                              )),
                        ),
                        GestureDetector(
                          onTap: () {
                            // Get.find<EventController>().changeTab(5);
                            Get.showSnackbar(const GetSnackBar(
                              duration: Duration(seconds: 2),
                              message: "Coming Soon",
                              backgroundColor: Warna.abuMuda,
                            ));
                          },
                          child: Container(
                              width: 100,
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Get.find<EventController>()
                                                      .selectTab ==
                                                  5
                                              ? Warna.softBiruMuda
                                              : Colors.transparent,
                                          width: 3))),
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 5.0),
                                child: Center(
                                    child: CustomText().titleText("Performance",
                                        fontWeight: Get.find<EventController>()
                                                    .selectTab ==
                                                5
                                            ? FontWeight.bold
                                            : FontWeight.normal)),
                              )),
                        ),
                        // GestureDetector(
                        //   onTap: () {
                        //     Get.find<EventController>().changeTab(6);
                        //   },
                        //   child: Container(
                        //       width: 100,
                        //       decoration: BoxDecoration(
                        //           border: Border(
                        //               bottom: BorderSide(
                        //                   color: Get.find<EventController>()
                        //                               .selectTab ==
                        //                           7
                        //                       ? Warna.softBiruMuda
                        //                       : Colors.transparent,
                        //                   width: 3))),
                        //       child: Padding(
                        //         padding: const EdgeInsets.only(bottom: 5.0),
                        //         child: Center(
                        //             child: CustomText().titleText("Staff")),
                        //       )),
                        // ),
                        GestureDetector(
                          onTap: () {
                            // Get.find<EventController>().changeTab(6);
                            Get.showSnackbar(const GetSnackBar(
                              duration: Duration(seconds: 2),
                              message: "Coming Soon",
                              backgroundColor: Warna.abuMuda,
                            ));
                          },
                          child: Container(
                              width: 100,
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Get.find<EventController>()
                                                      .selectTab ==
                                                  6
                                              ? Warna.softBiruMuda
                                              : Colors.transparent,
                                          width: 3))),
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 5.0),
                                child: Center(
                                    child: CustomText().titleText("Partner",
                                        fontWeight: Get.find<EventController>()
                                                    .selectTab ==
                                                6
                                            ? FontWeight.bold
                                            : FontWeight.normal)),
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => 130;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
