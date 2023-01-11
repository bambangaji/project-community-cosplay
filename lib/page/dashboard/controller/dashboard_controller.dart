// ignore_for_file: non_constant_identifier_names

import 'dart:developer';

import 'package:coscos/api/Methode.dart';
import 'package:coscos/component/MotionTabBar/MotionTabController.dart';
import 'package:coscos/component/customWidget.dart';
import 'package:coscos/page/dashboard/model/topEventModel.dart';
import 'package:coscos/page/event/controller/eventController.dart';
import 'package:coscos/page/event/view/Event.dart';
import 'package:coscos/page/main_controller.dart';
import 'package:coscos/page/profile/controller/profileController.dart';
import 'package:coscos/page/profile/model/profileModel.dart';
import 'package:coscos/service/storage.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:geocoding/geocoding.dart';

class DashboardController extends GetxController
    with GetTickerProviderStateMixin {
  var isLoading = false.obs;
  Position? _currentPosition;
  List<TopEventModel> listEvent = [];
  MotionTabController? tabController;

  MainController getMainController() {
    return Get.find<MainController>();
  }

  @override
  void dispose() {
    super.dispose();
    tabController!.dispose();
  }

  changeIndexTab(int value) {
    tabController!.index = value;
    update();
  }

  onBuildPage() async {
    tabController =
        MotionTabController(initialIndex: 0, vsync: this, length: 3);
    // getMainController().changeLoading();
    changeLoading();
    await handleLocationPermission();
    await getCurrentPosition();
    await Get.find<MainController>().cekLogin();
    var payload = {"id_city": "3171", "id_provinces": "31", "id_country": "ID"};
    var data = await getTopEvent(payload);
    await getDataProfile();
    listEvent = data.data;
    inspect(data);
    changeLoading();
  }

  getDataProfile() async {
    SecureStorage().readSecureData('login').then((data) async {
      if (data == 'true') {
        var payload = {
          "id_user": await SecureStorage().readSecureData('userToken')
        };
        var data = await getProfileData(payload);
        Get.lazyPut(() => profileController(), fenix: true);
        Get.find<profileController>().updateProfile(data.data);
        inspect(data);
      }
    });
  }

  // getCurrentLocation() async {
  //   Position position = await Geolocator.getCurrentPosition(
  //       desiredAccuracy: LocationAccuracy.high);
  //       getCurrentPosition();
  // }
  Future<void> getCurrentPosition() async {
    final hasPermission = await handleLocationPermission();
    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      _currentPosition = position;
      update();
      getAddressFromLatLng(_currentPosition!);
    }).catchError((e) {});
  }

  Future<void> getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(
            _currentPosition!.latitude, _currentPosition!.longitude)
        .then((List<Placemark> placemarks) {
      // setState(() {
      update();
      // });
    }).catchError((e) {});
  }

  Future<bool> handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      CustomWidget.showSnackBar(
          'Location services are disabled. Please enable the services');
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        CustomWidget.showSnackBar('Location permissions are denied');
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      CustomWidget.showSnackBar(
          'Location permissions are permanently denied, we cannot request permissions.');
      return false;
    }
    return true;
  }

  changeLoading() {
    isLoading.value = !isLoading.value;
    update();
  }

  goToEventDetail(TopEventModel data) async {
    changeLoading();
    Get.put(EventController());

    var payload = {"id_event": data.id};
    print(data.id);
    var retVal = await getDetailEvent(payload);
    Get.find<EventController>().onBuildPage(retVal);
    // inspect(retVal);
    changeLoading();
    Get.to(() => const EventPage());
  }
  // login() {
  //   Get.find<MainController>().isLogin = true.obs;
  //   update();
  //   Get.off(() => Get.off(DashboardPage()));
  // }
}
