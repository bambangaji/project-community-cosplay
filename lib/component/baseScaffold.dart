// ignore_for_file: file_names, prefer_const_literals_to_create_immutables, non_constant_identifier_names, duplicate_ignore, avoid_unnecessary_containers

import 'dart:developer';

import 'package:coscos/component/color.dart';
import 'package:coscos/page/dashboard/controller/dashboard_controller.dart';
import 'package:coscos/page/history/view/history.dart';
import 'package:coscos/page/main_controller.dart';
import 'package:coscos/page/profile/view/profilePage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../page/login/view/login.dart';
import 'MotionTabBar/MotionTabBar.dart';
import 'header.dart';

class CustomScaffold {
  Widget tabBarContent(List<Widget> children) {
    var controller = Get.find<DashboardController>();
    Widget Output = Container();
    if (controller.tabController!.index == 0) {
      Output = Column(
        children: children,
      );
    } else if (controller.tabController!.index == 1) {
      Output = HistoryPage();
    } else if (controller.tabController!.index == 2) {
      Output = profilePage();
    }
    return Output;
  }

  Widget baseScaffold(BuildContext context,
      {List<Widget> children = const [],
      bool isBack = false,
      bool appBar = true,
      bool isSearchBar = true,
      String title = "",
      bool isTabBar = false}) {
    return LoadingOverlay(
      isLoading: Get.find<DashboardController>().isLoading.value,
      progressIndicator: const CircularProgressIndicator(),
      color: Warna.softLavender,
      opacity: 0.6,
      child: Scaffold(
          appBar: appBar
              ? CustomAppBar(context,
                  back: isBack, isSearchBar: isSearchBar, title: title)
              : null,
          resizeToAvoidBottomInset: true,
          backgroundColor: Warna.abuMudaBG,
          // bottomNavigationBar: isTabBar
          //     ? MotionTabBar(
          //         labels: ["Account", "Home", "Dashboard"],
          //         initialSelectedTab: "Home",
          //         tabIconColor: Colors.green,
          //         tabSelectedColor: Colors.cyan,
          //         onTabItemSelected: (int value) {
          //           print(value);

          //           Get.find<DashboardController>().tabController!.index =
          //               value;
          //         },
          //         icons: [Icons.account_box, Icons.home, Icons.menu],
          //         textStyle: TextStyle(color: Colors.red),
          //       )
          //     : null,
          // body: MotionTabBarView(
          //   controller: _tabController,
          //   children: <Widget>[
          //     Container(
          //       child: Center(
          //         child: Text("Account"),
          //       ),
          //     ),
          //     Container(
          //       child: Center(
          //         child: Text("Home"),
          //       ),
          //     ),
          //     Container(
          //       child: Center(
          //         child: Text("Dashboard"),
          //       ),
          //     ),
          //   ],
          // ));,
          body: NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (overscroll) {
                overscroll.disallowIndicator();
                return false;
              },
              child: Padding(
                padding: const EdgeInsets.only(bottom: 0.0),
                child: SizedBox(
                  height: Get.height,
                  width: Get.width,
                  child: Stack(
                    children: [
                      SingleChildScrollView(child: tabBarContent(children)),
                      !appBar
                          ? Positioned(
                              top: 0,
                              left: 0,
                              child: SizedBox(
                                // color: Colors.black,
                                width: Get.width,
                                height: Get.height / 8,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconButton(
                                        icon: const Icon(Icons.arrow_back,
                                            color: Warna.softIjoMuda),
                                        onPressed: () {
                                          Get.close(1);
                                        }),
                                    Row(
                                      children: [
                                        IconButton(
                                            icon: const Icon(
                                                Icons.star_border_outlined,
                                                color: Warna.softMerahMuda),
                                            onPressed: () {
                                              Get.close(1);
                                            }),
                                        IconButton(
                                            icon: const Icon(
                                                Icons.more_horiz_rounded,
                                                color: Warna.softWhite),
                                            onPressed: () {
                                              Get.close(1);
                                            }),
                                      ],
                                    ),
                                  ],
                                ),
                              ))
                          : Container(),
                      isTabBar
                          ? Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                width: Get.width,
                                // height: 200,
                                color: Colors.amber,
                                child: MotionTabBar(
                                  labels: ["Home", "Activity", "Profile"],
                                  initialSelectedTab: "Home",
                                  tabIconColor: Colors.green,
                                  tabSelectedColor: Colors.cyan,
                                  onTabItemSelected: (int value) async {
                                    // print(login);
                                    print(value);
                                    if (Get.find<MainController>()
                                        .isLogin
                                        .value) {
                                      Get.find<DashboardController>()
                                          .changeIndexTab(value);
                                    } else {
                                      Get.defaultDialog(
                                        contentPadding:
                                            const EdgeInsets.all(20),
                                        backgroundColor: Warna.white,
                                        title: "Login Verification",
                                        barrierDismissible: true,
                                        titleStyle: const TextStyle(
                                            color: Warna.biruTua,
                                            fontWeight: FontWeight.bold),
                                        middleText:
                                            "Login first to use all feature",
                                        middleTextStyle: const TextStyle(
                                            color: Warna.biruTua),
                                        confirmTextColor: Warna.white,
                                        textConfirm: "Login",
                                        onConfirm: () {
                                          // LogOut();
                                          Get.to(() => const LoginPage());
                                          // Get.off(() => Get.off(LoginPage()));
                                        },
                                      );
                                    }
                                  },
                                  // ignore: prefer_const_literals_to_create_immutables
                                  icons: [
                                    Icons.home_outlined,
                                    Icons.list_alt_sharp,
                                    Icons.person
                                  ],
                                  textStyle:
                                      const TextStyle(color: Warna.biruTua),
                                ),
                                // child: Text("sa"),
                              ),
                            )
                          : Container()
                    ],
                  ),
                ),
              ))),
    );
  }
}
