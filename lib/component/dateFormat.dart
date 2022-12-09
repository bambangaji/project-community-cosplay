// ignore_for_file: file_names

import 'package:intl/intl.dart';

class CustomFormatDate {
  String formatDateID(String data) {
    String retVal;
    // initializeDateFormatting("ar_SA", null).then((_) {
    //   var now = DateTime.now();
    //   var formatter = DateFormat.yMMMd('ar_SA');
    //   print(formatter.locale);
    //   //example = '2020-01-02 03:04:05'
    //   var toDateFormat = DateTime.parse(data);
    //   String formatted = formatter.format(toDateFormat);
    //   print(formatted);
    //   retVal = formatted;
    // });
    var formatter = DateFormat.yMMMd('id_ID');
    // print(formatter.locale);
    //example = '2020-01-02 03:04:05'
    var toDateFormat = DateTime.parse(data);
    String formatted = formatter.format(toDateFormat);
    retVal = formatted;
    return retVal;
  }

  String toDateFilter(String data) {
    String retVal;
    DateFormat dateFormat = DateFormat("yyyy-MM-dd");
    // initializeDateFormatting("ar_SA", null).then((_) {
    //   var now = DateTime.now();
    //   var formatter = DateFormat.yMMMd('ar_SA');
    //   print(formatter.locale);
    //   //example = '2020-01-02 03:04:05'
    //   var toDateFormat = DateTime.parse(data);
    //   String formatted = formatter.format(toDateFormat);
    //   print(formatted);
    //   retVal = formatted;
    // });
    var formatter = DateFormat('yyyy-MM-dd');
    DateTime dateTime = dateFormat.parse(data.replaceAll("/", "-"));
    // print(formatter.locale);
    //example = '2020-01-02 03:04:05'
    // var toDateFormat = DateTime.parse(data);
    String formatted = formatter.format(dateTime);
    retVal = formatted;
    return retVal;
  }

  DateTime toDateFormat(String data) {
    DateTime retVal;
    DateFormat dateFormat = DateFormat("yyyy-MM-dd");
    // initializeDateFormatting("ar_SA", null).then((_) {
    //   var now = DateTime.now();
    //   var formatter = DateFormat.yMMMd('ar_SA');
    //   print(formatter.locale);
    //   //example = '2020-01-02 03:04:05'
    //   var toDateFormat = DateTime.parse(data);
    //   String formatted = formatter.format(toDateFormat);
    //   print(formatted);
    //   retVal = formatted;
    // });
    DateTime dateTime = dateFormat.parse(data.replaceAll("/", "-"));
    // print(formatter.locale);
    //example = '2020-01-02 03:04:05'
    // var toDateFormat = DateTime.parse(data);
    retVal = dateTime;
    return retVal;
  }

  // ignore: non_constant_identifier_names
  String ConvertDate(String data) {
    data = data.substring(0, 10);
    // DateTime dateTime = DateTime.parse(dateWithT);
    return data;
  }
}
