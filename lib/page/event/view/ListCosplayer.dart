// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../component/baseScaffold.dart';
import '../controller/eventController.dart';

class ListCosplayerPage extends GetView<EventController> {
  const ListCosplayerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EventController>(
        init: EventController(), // INIT IT ONLY THE FIRST TIME
        builder: (_) => CustomScaffold().baseScaffold(
              context,
              isSearchBar: false,
              isBack: true,
              title: controller.animeModel.name,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: SizedBox(
                      height: Get.height,
                      width: Get.width,
                      child: ListView.builder(
                        padding: const EdgeInsets.only(bottom: 100),
                        itemCount: controller.animeModel.character.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                            child: Column(
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                // CustomWidget.ListTileTopUp(
                                //   dataChara,
                                //   leadIconLocation: "lib/assets/tanjiro.jpg",
                                //   title: dataChara.name,
                                //   callBack: () {
                                //     controller.expandCharacter(dataChara);
                                //   },
                                // ),
                                // dataChara.isExpand
                                //     ? ConstrainedBox(
                                //         constraints: BoxConstraints(
                                //             minHeight: 0, maxHeight: Get.width),
                                //         child: ListView.builder(
                                //           shrinkWrap: true,
                                //           padding: EdgeInsets.zero,
                                //           itemCount: dataChara.cosplayer.length,
                                //           itemBuilder: (context, index) {
                                //             var dataCosplayer =
                                //                 dataChara.cosplayer[index];
                                //             return Padding(
                                //                 padding: EdgeInsets.fromLTRB(
                                //                     8, 0, 8, 0),
                                //                 child: customCard().cardWidget(
                                //                   colorBg:
                                //                       dataCosplayer.gender ==
                                //                               "M"
                                //                           ? Warna.softIjoMedium
                                //                           : Warna.kuning,
                                //                   colorBorder:
                                //                       dataCosplayer.gender ==
                                //                               "M"
                                //                           ? Warna.softIjoMuda
                                //                           : Colors.yellow[800]!,
                                //                   Padding(
                                //                     padding:
                                //                         const EdgeInsets.only(
                                //                             left: 8.0),
                                //                     child: Row(
                                //                       children: [
                                //                         CustomText()
                                //                             .titleTextWithWidgetIcon(
                                //                                 dataCosplayer
                                //                                     .socmed,
                                //                                 isMaxWidth:
                                //                                     true,
                                //                                 FaIcon(
                                //                                   FontAwesomeIcons
                                //                                       .instagram,
                                //                                   color: Warna
                                //                                       .softWhite,
                                //                                 ),
                                //                                 isBack: true)
                                //                       ],
                                //                     ),
                                //                   ),
                                //                 ));
                                //             // return Text("data");
                                //           },
                                //         ),
                                //       )
                                //     : Container()
                              ],
                            ),
                          );
                          // return Text("data");
                        },
                      )),
                )
              ],
            ));
  }
}
