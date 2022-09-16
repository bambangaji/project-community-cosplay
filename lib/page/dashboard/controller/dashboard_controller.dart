import 'package:coscos/component/dateFormat.dart';
import 'package:coscos/page/dashboard/model/anime.dart';
import 'package:coscos/page/dashboard/model/character.dart';
import 'package:coscos/page/dashboard/model/cosplayer.dart';
import 'package:coscos/page/dashboard/model/eventModel.dart';
import 'package:coscos/page/dashboard/model/guestStarModel.dart';
import 'package:coscos/page/dashboard/model/ticketModel.dart';
import 'package:coscos/page/event/controller/eventController.dart';
import 'package:coscos/page/event/view/Event.dart';
import 'package:coscos/page/main_controller.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController
    with GetSingleTickerProviderStateMixin {
  List<EventModel> listEvent = [];

  MainController getMainController() {
    return Get.find<MainController>();
  }

  onBuildPage() async {
    getMainController().changeLoading();
    addDataDummy("Comifuro 15");
    addDataDummy("Indonesia Comic Con ");
    addDataDummy("Clash H");
    // event.name_event = "Comifuro 15";
    // event.date_start_event = CustomFormatDate().toDateFormat("2022-09-24");
    // event.date_end_event = CustomFormatDate().toDateFormat("2022-09-25");
    // update();
    // listEvent.add(event);
    // event.name_event = "Clas:5 2022";
    // event.date_start_event = CustomFormatDate().toDateFormat("2022-09-24");
    // event.date_end_event = CustomFormatDate().toDateFormat("2022-09-25");
    // update();
    // listEvent.add(event);
    // event.name_event = "Indonesia Comic Con 2022";
    // event.date_start_event = CustomFormatDate().toDateFormat("2022-10-01");
    // event.date_end_event = CustomFormatDate().toDateFormat("2022-10-02");
    // update();
    // listEvent.add(event);
    getMainController().changeLoading();
  }

  goToEventDetail(EventModel data) async {
    Get.put(EventController());
    Get.find<EventController>().onBuildPage(data);
    Get.to(() => EventPage());
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
            "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.",
        id_event: "1",
        name_event: EventName,
        date_start_event: CustomFormatDate().toDateFormat("2022-10-01"),
        date_end_event: CustomFormatDate().toDateFormat("2022-10-02"),
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
        anime: [
          AnimeModel(
              id: "1",
              name: "Kimetsu No Yaiba",
              character: [
                CharacterModel(
                    id: "1",
                    name: "Kamado Tanjiro",
                    cosplayer: [
                      CosplayerModel(
                          id: "1",
                          name: "Aliga",
                          link_socmed:
                              "https://www.facebook.com/aliga.aliga.773776",
                          socmed_type: "FB",
                          gender: "M",
                          createdAt: DateTime.now(),
                          socmed: "Ahmad Budi")
                    ],
                    gender: "M",
                    createdAt: DateTime.now()),
                CharacterModel(
                    id: "1",
                    name: "Kanao Tsuyuri",
                    cosplayer: [
                      CosplayerModel(
                          id: "1",
                          name: "Aliga",
                          link_socmed:
                              "https://www.facebook.com/aliga.aliga.773776",
                          socmed_type: "FB",
                          gender: "M",
                          createdAt: DateTime.now(),
                          socmed: "Ahmad Budi"),
                      CosplayerModel(
                          id: "1",
                          name: "Aliga",
                          link_socmed:
                              "https://www.facebook.com/aliga.aliga.773776",
                          socmed_type: "FB",
                          gender: "F",
                          createdAt: DateTime.now(),
                          socmed: "Ganyu"),
                    ],
                    gender: "F",
                    createdAt: DateTime.now()),
                CharacterModel(
                    id: "1",
                    name: "Nezuko Komado",
                    cosplayer: [
                      CosplayerModel(
                          id: "1",
                          name: "Aliga",
                          link_socmed:
                              "https://www.facebook.com/aliga.aliga.773776",
                          socmed_type: "FB",
                          gender: "M",
                          createdAt: DateTime.now(),
                          socmed: "Ahmad Budi"),
                      CosplayerModel(
                          id: "1",
                          name: "Aliga",
                          link_socmed:
                              "https://www.facebook.com/aliga.aliga.773776",
                          socmed_type: "FB",
                          gender: "F",
                          createdAt: DateTime.now(),
                          socmed: "Ganyu"),
                    ],
                    gender: "F",
                    createdAt: DateTime.now())
              ],
              createdAt: DateTime.now()),
          AnimeModel(
              id: "1",
              name: "Sword Art Online",
              character: [
                CharacterModel(
                    id: "1",
                    name: "Kirigaya Kazuto",
                    cosplayer: [
                      CosplayerModel(
                          id: "1",
                          name: "Aliga",
                          link_socmed:
                              "https://www.facebook.com/aliga.aliga.773776",
                          socmed_type: "FB",
                          gender: "M",
                          createdAt: DateTime.now(),
                          socmed: "Ahmad Budi")
                    ],
                    gender: "M",
                    createdAt: DateTime.now()),
                CharacterModel(
                    id: "1",
                    name: "Yuki Asuna",
                    cosplayer: [
                      CosplayerModel(
                          id: "1",
                          name: "Aliga",
                          link_socmed:
                              "https://www.facebook.com/aliga.aliga.773776",
                          socmed_type: "FB",
                          gender: "M",
                          createdAt: DateTime.now(),
                          socmed: "Ahmad Budi"),
                      CosplayerModel(
                          id: "1",
                          name: "Aliga",
                          link_socmed:
                              "https://www.facebook.com/aliga.aliga.773776",
                          socmed_type: "FB",
                          gender: "F",
                          createdAt: DateTime.now(),
                          socmed: "Ganyu"),
                    ],
                    gender: "F",
                    createdAt: DateTime.now()),
              ],
              createdAt: DateTime.now())
        ]);
    listEvent.add(event);
  }
}
