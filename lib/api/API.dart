// ignore_for_file: file_names

import 'package:flutter_dotenv/flutter_dotenv.dart';

class API {
  static String uploadIMGSerial = dotenv.env['UPLOAD_IMG_SERIAL'].toString();
  static String uploadIMGCharacter =
      dotenv.env['UPLOAD_IMG_CHARACTER'].toString();
  static String getSerial = dotenv.env['GET_SERIAL'].toString();
  static String addSerial = dotenv.env['ADD_SERIAL'].toString();
  static String getCharacter = dotenv.env['GET_CHARACTER'].toString();
  static String addCharacter = dotenv.env['ADD_CHARACTER'].toString();
  static String register = dotenv.env['REGISTER'].toString();
  static String getImageEvent = dotenv.env['GET_IMAGE_EVENT'].toString();
  static String getMapEvent = dotenv.env['GET_MAP_EVENT'].toString();
  static String getTopEvent = dotenv.env['GET_TOP_EVENT'].toString();
  static String getAllEvent = dotenv.env['GET_ALL_EVENT'].toString();
  static String getDetailEvent = dotenv.env['GET_DETAIL_EVENT'].toString();
  static String getSchedule = dotenv.env['GET_SCHEDULE'].toString();
  static String getRundown = dotenv.env['GET_RUNDOWN'].toString();
  // ignore: non_constant_identifier_names
  static String replaceURL(String URL,
      {String id = "",
      String id2 = "",
      String startDate = "",
      String endDate = "",
      // ignore: non_constant_identifier_names
      String Type = "",
      // ignore: non_constant_identifier_names
      String Status = ""}) {
    if (id != "") {
      URL.replaceAll("{id}", id);
    }

    if (id2 != "") {
      URL.replaceAll("{id2}", id2);
    }
    return URL;
  }

  // initAPI() {
  //   print("object");
  //   uploadIMGCharacter = dotenv.env['UPLOAD_IMG_CHARACTER'].toString();
  //   uploadIMGSerial = dotenv.env['UPLOAD_IMG_SERIAL'].toString();
  //   addCharacter = dotenv.env['ADD_CHARACTER'].toString();
  //   addSerial = dotenv.env['ADD_SERIAL'].toString();
  //   getCharacter = dotenv.env['GET_CHARACTER'].toString();
  //   getSerial = dotenv.env['GET_SERIAL'].toString();
  //   print(getSerial);
  // }
}
