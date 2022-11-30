import 'package:coscos/component/card.dart';
import 'package:coscos/component/color.dart';
import 'package:coscos/component/customText.dart';
import 'package:coscos/component/customWidget.dart';
import 'package:coscos/page/event/controller/eventController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: non_constant_identifier_names
Widget CardListDocument(int type, {ScrollController? scrollController}) {
  var controller = Get.find<EventController>();

  Widget RetVal = Container();
  if (type == 1) {
    var dataModel = controller.listSerialModel!.data;
    RetVal = dataModel.isNotEmpty
        ? ListView.builder(
            controller: scrollController,
            itemCount: dataModel.length,
            itemBuilder: (context, snapshot) {
              var data = dataModel[snapshot];
              return Padding(
                padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                child: Column(
                  children: [
                    CustomWidget.ListTileTopUpCard(
                      leadIconLocation: data.imageUrl,
                      title: data.name,
                      subTitle: data.type,
                      isPopular: snapshot == 0 ? true : false,
                      callBack: () {
                        print("object");
                        controller.selectSerial(data);
                      },
                    ),
                  ],
                ),
              ); // return Text("data");
            },
          )
        : const Center(
            child: Text(
            "Data Not Found",
            style: TextStyle(color: Warna.biruTua),
          ));
  } else if (type == 2) {
    var dataModel = controller.listCharacterModel!.data;
    RetVal = dataModel.isNotEmpty
        ? ListView.builder(
            controller: scrollController,
            itemCount: dataModel.length,
            itemBuilder: (context, snapshot) {
              var data = dataModel[snapshot];
              return Padding(
                padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                child: Column(
                  children: [
                    CustomWidget.ListTileTopUpCard(
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
                        print("object");
                        controller.selectCharacter(data);
                      },
                    ),
                  ],
                ),
              ); // return Text("data");
            },
          )
        : const Center(
            child: Text(
            "Data Not Found",
            style: TextStyle(color: Warna.biruTua),
          ));
  }
  return RetVal;
}
