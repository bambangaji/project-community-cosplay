// ignore_for_file: non_constant_identifier_names

import 'dart:developer';

import 'package:coscos/component/MotionTabBar/MotionTabController.dart';
import 'package:coscos/component/customWidget.dart';
import 'package:coscos/component/dateFormat.dart';
import 'package:coscos/page/dashboard/model/eventModel.dart';
import 'package:coscos/page/dashboard/model/guestStarModel.dart';
import 'package:coscos/page/dashboard/model/ticketModel.dart';
import 'package:coscos/page/event/controller/eventController.dart';
import 'package:coscos/page/event/view/Event.dart';
import 'package:coscos/page/main_controller.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:geocoding/geocoding.dart';

class DashboardController extends GetxController
    with GetTickerProviderStateMixin {
  var isLoading = false.obs;
  Position? _currentPosition;
  List<EventModel> listEvent = [];
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
    addDataDummy("Comifuro 15");
    addDataDummy("Indonesia Comic Con ");
    addDataDummy("Clash H");
    await handleLocationPermission();
    await getCurrentPosition();
    changeLoading();
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
    }).catchError((e) {
    });
  }

  Future<void> getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(
            _currentPosition!.latitude, _currentPosition!.longitude)
        .then((List<Placemark> placemarks) {
      // setState(() {
      update();
      inspect(placemarks);
      // });
    }).catchError((e) {
    });
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

  goToEventDetail(EventModel data) async {
    Get.put(EventController());
    Get.find<EventController>().onBuildPage(data);
    Get.to(() => const EventPage());
  }

  addDataDummy(String EventName) {
    EventModel event = EventModel(
      guest_star: [
        GuestStarModel(
            gender: "F",
            id: "1",
            name: "Aliga",
            social_media: "@aileduoaliga",
            country: "CN",
            description: "China",
            createdAt: DateTime.now()),
        GuestStarModel(
            gender: "F",
            id: "1",
            name: "Aliga2",
            social_media: "@aileduoaliga",
            country: "ID",
            description: "Indonesia",
            createdAt: DateTime.now()),
        GuestStarModel(
            gender: "M",
            id: "1",
            name: "Aliga3",
            social_media: "@aileduoaliga",
            country: "TW",
            description: "Taiwan",
            createdAt: DateTime.now()),
        GuestStarModel(
            gender: "F",
            id: "1",
            name: "Aliga4",
            social_media: "@aileduoaliga",
            country: "CN",
            description: "China",
            createdAt: DateTime.now()),
        GuestStarModel(
            gender: "F",
            id: "1",
            name: "Aliga5",
            social_media: "@aileduoaliga",
            country: "CN",
            description: "China",
            createdAt: DateTime.now())
      ],
      description:
          "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. , Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.",
      id_event: "1",
      name_event: EventName,
      date_start_event: CustomFormatDate().toDateFormat("2022-10-01T08:00"),
      date_end_event: CustomFormatDate().toDateFormat("2022-10-02T20:00"),
      time_start_event: "08:00",
      time_end_event: "20:00",
      isExpired: false,
      address:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat",
      city: "Jakarta",
      country: "Indonesia",
      tiket: [
        TicketModel(
            id_ticket: "1",
            name_ticket: "Regular",
            date_start_ticket: CustomFormatDate().toDateFormat("2022-10-01"),
            date_end_ticket: CustomFormatDate().toDateFormat("2022-10-02"),
            isExpired: false,
            type: "REGULAR",
            stock: 1000,
            description: "Harga Normal",
            current_stock: 111,
            tiketFee: 100000,
            createdAt: DateTime.now()),
        TicketModel(
            id_ticket: "2",
            name_ticket: "VIP",
            date_start_ticket: CustomFormatDate().toDateFormat("2022-10-01"),
            date_end_ticket: CustomFormatDate().toDateFormat("2022-10-02"),
            isExpired: false,
            type: "VIP",
            stock: 1000,
            description: "Harga Normal",
            current_stock: 111,
            tiketFee: 1000000,
            createdAt: DateTime.now()),
        TicketModel(
            id_ticket: "3",
            name_ticket: "Pre Sale",
            date_start_ticket: CustomFormatDate().toDateFormat("2022-10-01"),
            date_end_ticket: CustomFormatDate().toDateFormat("2022-10-02"),
            isExpired: false,
            type: "PRESALE",
            stock: 1000,
            description: "Harga Normal",
            current_stock: 111,
            tiketFee: 50000,
            createdAt: DateTime.now()),
        TicketModel(
            id_ticket: "4",
            name_ticket: "Cosplayer",
            date_start_ticket: CustomFormatDate().toDateFormat("2022-10-01"),
            date_end_ticket: CustomFormatDate().toDateFormat("2022-10-02"),
            isExpired: false,
            type: "SPECIAL",
            stock: 1000,
            description: "Harga Normal",
            current_stock: 111,
            tiketFee: 75000,
            createdAt: DateTime.now())
      ],
      createdAt: DateTime.now(),
    );
    listEvent.add(event);
  }

  // login() {
  //   Get.find<MainController>().isLogin = true.obs;
  //   update();
  //   Get.off(() => Get.off(DashboardPage()));
  // }
}
