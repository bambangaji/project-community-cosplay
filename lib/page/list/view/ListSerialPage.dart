// ignore_for_file: file_names, prefer_const_constructors, non_constant_identifier_names, duplicate_ignore

import 'package:coscos/component/color.dart';
import 'package:coscos/component/customWidget.dart';
import 'package:coscos/component/shimmerCustom.dart';
import 'package:coscos/page/event/controller/eventController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget CardListDocument(int type, {ScrollController? scrollController}) {
  Widget RetVal = Container();
  if (type == 1) {
    var controller = Get.find<EventController>();
    var dataModel = controller.listSerialModel!.data;
    RetVal = dataModel.isNotEmpty
        ? SizedBox(
            height: Get.height,
            child: GridView.builder(
              // shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.75, crossAxisCount: 2),
              controller: scrollController,
              itemCount: dataModel.length,
              itemBuilder: (context, snapshot) {
                var data = dataModel[snapshot];
                return ShimmerLoading(
                  isLoading: false,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8, 10, 8, 10),
                    child: GestureDetector(
                      onTap: () {
                        controller.selectSerial(data);
                      },
                      child: CustomWidget.ListTileTopUpCardGrid(
                        leadIconLocation: data.imageUrl,
                        title: data.name,
                        subTitle: data.type,
                        isPopular: snapshot == 0 ? true : false,
                        callBack: () {},
                      ),
                    ),
                  ),
                ); // return Text("data");
              },
            ),
          )
        : const Center(
            child: Text(
            "Data is empty",
            style: TextStyle(color: Warna.biruTua),
          ));
  } else if (type == 2) {
    var controller = Get.find<EventController>();
    var dataModel = controller.listCharacterModel!.data;
    RetVal = dataModel.isNotEmpty
        ? SizedBox(
            height: Get.height,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.75,
                  // banyak grid yang ditampilkan dalam satu baris
                  crossAxisCount: 2),
              controller: scrollController,
              itemCount: dataModel.length,
              itemBuilder: (context, snapshot) {
                var data = dataModel[snapshot];
                return GestureDetector(
                  onTap: () {
                    controller.selectCharacter(data);
                  },
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(8, 10, 8, 0),
                    child: CustomWidget.ListTileTopUpCardGrid(
                      leadIconLocation: data.imageUrl,
                      title: data.name,
                      icon: Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: data.gender == "M"
                            ? const Icon(
                                Icons.male,
                                color: Warna.biru,
                                size: 20,
                              )
                            : const Icon(
                                Icons.female_outlined,
                                color: Warna.pink,
                                size: 20,
                              ),
                      ),
                      // subTitle: data.,
                      isPopular: snapshot == 0 ? true : false,
                      callBack: () {
                        controller.selectCharacter(data);
                      },
                    ),
                  ),
                ); // return Text("data");
              },
            ),
          )
        : const Center(
            child: Text(
            "Data Not Found",
            style: TextStyle(color: Warna.biruTua),
          ));
  }
  return RetVal;
}
