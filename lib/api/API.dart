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
  static String addVisitor = dotenv.env['ADD_VISITOR'].toString();
  static String getHistory = dotenv.env['GET_HISTORY'].toString();
  static String register = dotenv.env['REGISTER'].toString();
  static String applyOTP = dotenv.env['APPLY_OTP'].toString();
  static String login = dotenv.env['LOGIN'].toString();
  static String profile = dotenv.env['PROFILE'].toString();
  static String getImageEvent = dotenv.env['GET_IMAGE_EVENT'].toString();
  static String getMapEvent = dotenv.env['GET_MAP_EVENT'].toString();
  static String getTopEvent = dotenv.env['GET_TOP_EVENT'].toString();
  static String getAllEvent = dotenv.env['GET_ALL_EVENT'].toString();
  static String getDetailEvent = dotenv.env['GET_DETAIL_EVENT'].toString();
  static String getSchedule = dotenv.env['GET_SCHEDULE'].toString();
  static String getRundown = dotenv.env['GET_RUNDOWN'].toString();
  static String getSerialCosplayer =
      dotenv.env['GET_SERIAL_COSPLAYER'].toString();
  static String getCharacterCosplayer =
      dotenv.env['GET_CHARACTER_COSPLAYER'].toString();
  static String getCosplayer = dotenv.env['GET_COSPLAYER'].toString();
  // ignore: non_constant_identifier_names
  // static String replaceURL(String URL,
  //     {String id = "",
  //     String id2 = "",
  //     String startDate = "",
  //     String endDate = "",
  //     // ignore: non_constant_identifier_names
  //     String Type = "",
  //     // ignore: non_constant_identifier_names
  //     String Status = ""}) {
  //   if (id != "") {
  //     URL.replaceAll("{id}", id);
  //   }

  //   if (id2 != "") {
  //     URL.replaceAll("{id2}", id2);
  //   }
  //   return URL;
  // }
}
