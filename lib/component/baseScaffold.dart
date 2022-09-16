import 'package:coscos/component/color.dart';
import 'package:coscos/page/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';

import 'header.dart';

class CustomScaffold {
  static Widget baseScaffold(BuildContext context,
      {List<Widget> children = const [],
      bool isBack = false,
      bool appBar = true,
      bool isSearchBar = true,
      String title = ""}) {
    return LoadingOverlay(
      isLoading: Get.find<MainController>().isLoading.value,
      progressIndicator: CircularProgressIndicator(),
      color: Warna.softLavender,
      opacity: 0.2,
      child: Scaffold(
          appBar: appBar
              ? CustomAppBar(context,
                  back: isBack, isSearchBar: isSearchBar, title: title)
              : null,
          resizeToAvoidBottomInset: true,
          backgroundColor: Colors.grey[50],
          body: NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (overscroll) {
                overscroll.disallowGlow();
                return false;
              },
              child: Container(
                height: Get.height,
                width: Get.width,
                child: Stack(
                  children: [
                    SingleChildScrollView(
                        child: Column(
                      children: children,
                    )),
                    !appBar
                        ? Positioned(
                            top: 0,
                            left: 0,
                            child: Container(
                              // color: Colors.black,
                              width: Get.width,
                              height: Get.height / 8,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                      icon: Icon(Icons.arrow_back,
                                          color: Warna.softIjoMuda),
                                      onPressed: () {
                                        Get.close(1);
                                      }),
                                  Row(
                                    children: [
                                      IconButton(
                                          icon: Icon(Icons.star_border_outlined,
                                              color: Warna.softMerahMuda),
                                          onPressed: () {
                                            Get.close(1);
                                          }),
                                      IconButton(
                                          icon: Icon(Icons.more_horiz_rounded,
                                              color: Warna.softWhite),
                                          onPressed: () {
                                            Get.close(1);
                                          }),
                                    ],
                                  ),
                                ],
                              ),
                            ))
                        : Container()
                  ],
                ),
              ))),
    );
  }
}
