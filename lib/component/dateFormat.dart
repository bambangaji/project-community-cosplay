import 'package:flutter/cupertino.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class CustomFormatDate {
  String formatDateID(String data) {
    var retVal;
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
    var retVal;
    print("tanggal :" + data);
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
    var retVal;
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
    retVal = dateTime;
    return retVal;
  }

  String ConvertDate(String data) {
    data = data.substring(0, 10);
    var data2 = new DateFormat("yyyy-m-dd").parse(data);
    // DateTime dateTime = DateTime.parse(dateWithT);
    return data;
  }
}
