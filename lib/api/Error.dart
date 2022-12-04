import 'dart:developer';

import 'package:coscos/component/customWidget.dart';
import 'package:dio/dio.dart';

class Error {
  Error({
    required this.errorCode,
    required this.message,
  });

  int errorCode;
  String message;

  factory Error.fromJson(Map<String, dynamic> json) => Error(
        errorCode: json["errorCode"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "errorCode": errorCode,
        "message": message,
      };
  factory Error.onError(int errorCode, String message) {
    var error = Error(errorCode: 200, message: "Sukses");
    if (errorCode == 400) {
      CustomWidget.showDialog("Error 400", "Data not found");
      error = Error(
        errorCode: 400,
        message: 'Data not found',
      );
    } else {
      CustomWidget.showDialog("Error 500", message);
      error = Error(
        errorCode: 500,
        message: message,
      );
    }

    return error;
  }
}

Error validationError(DioError e) {
  inspect(e);
  var error = Error(errorCode: 500, message: "");
  // ignore: unnecessary_null_comparison
  if (e.response == null) {
    error.errorCode = 500;
    error.message = e.toString();
  } else {
    error.errorCode = e.response!.statusCode!;
    error.message = e.response!.statusMessage!;
  }
  return error;
}
