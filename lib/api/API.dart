import 'package:flutter_dotenv/flutter_dotenv.dart';

class API {
  String uploadIMGSerial = dotenv.env['UPLOAD_IMG_SERIAL'].toString();
  String uploadIMGCharacter = dotenv.env['UPLOAD_IMG_CHARACTER'].toString();
  String getSerial = dotenv.env['GET_SERIAL'].toString();
  String addSerial = dotenv.env['ADD_SERIAL'].toString();
  String getCharacter = dotenv.env['GET_CHARACTER'].toString();
  String addCharacter = dotenv.env['ADD_CHARACTER'].toString();
  String register = dotenv.env['REGISTER'].toString();
  String replaceURL(String URL,
      {String id = "",
      String id2 = "",
      String startDate = "",
      String endDate = "",
      String Type = "",
      String Status = ""}) {
    if (id != "") {
      URL.replaceAll("{id}", id);
    }

    if (id2 != "") {
      URL.replaceAll("{id2}", id2);
    }
    return URL;
  }

  initAPI() {
    print("object");
    uploadIMGCharacter = dotenv.env['UPLOAD_IMG_CHARACTER'].toString();
    uploadIMGSerial = dotenv.env['UPLOAD_IMG_SERIAL'].toString();
    addCharacter = dotenv.env['ADD_CHARACTER'].toString();
    addSerial = dotenv.env['ADD_SERIAL'].toString();
    getCharacter = dotenv.env['GET_CHARACTER'].toString();
    getSerial = dotenv.env['GET_SERIAL'].toString();
    print(getSerial);
  }
}
