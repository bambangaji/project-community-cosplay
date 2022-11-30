import 'dart:io';

import 'package:coscos/page/event/model/CharacterModel.dart';
import 'package:coscos/page/event/model/SerialModel.dart';
import 'package:coscos/service/fetch.dart';
import 'package:dio/dio.dart';

import 'API.dart';

Future<ListSerial> getListSerial(dynamic data) async {
  try {
    var URL = API().getSerial;
    print("URL::" + URL);
    final Response response = await fetch().post(URL, data: data);
    print(response.data.toString());
    return ListSerial.fromJson(response.data);
  } on DioError catch (e) {
    if (e.response != null) {
      print(e.response?.data);
      print(e.response?.headers);
      print(e.response?.requestOptions);
    } else {
      // Something happened in setting up or sending the request that triggered an Error
      print(e.requestOptions);
      print(e.message);
    }
    return ListSerial.fromJson(e.response?.data);
  }
}

Future<ListCharacter> getListCharacter(dynamic data) async {
  try {
    var URL = API().getCharacter;
    print("URL::" + URL);
    final Response response = await fetch().post(URL, data: data);
    print(response.data.toString());
    return ListCharacter.fromJson(response.data);
  } on DioError catch (e) {
    if (e.response != null) {
      print(e.response?.data);
      print(e.response?.headers);
      print(e.response?.requestOptions);
    } else {
      // Something happened in setting up or sending the request that triggered an Error
      print(e.requestOptions);
      print(e.message);
    }
    return ListCharacter.fromJson(e.response?.data);
  }
}

Future<ListSerial> addSerial(dynamic data) async {
  try {
    var URL = API().addSerial;
    print("URL::" + URL);
    final Response response = await fetch().post(URL, data: data);
    print(response.data.toString());
    return ListSerial.fromJson(response.data);
  } on DioError catch (e) {
    if (e.response != null) {
      print(e.response?.data);
    } else {
      print(e.message);
    }
    return ListSerial.fromJson(e.response?.data);
  }
}

Future<ListSerial> addCharacter(dynamic data) async {
  try {
    var URL = API().addCharacter;
    print("URL::" + URL);
    final Response response = await fetch().post(URL, data: data);
    print(response.data.toString());
    return ListSerial.fromJson(response.data);
  } on DioError catch (e) {
    if (e.response != null) {
      print(e.response?.data);
    } else {
      print(e.message);
    }
    return ListSerial.fromJson(e.response?.data);
  }
}

Future<ListSerial> uploadIMGSerial(File data) async {
  try {
    String fileName = data.path.split('/').last;
    var formData = FormData.fromMap(
        {'file': await MultipartFile.fromFile(data.path, filename: fileName)});
    var URL = API().uploadIMGSerial;
    print("URL::" + URL);
    final Response response = await fetch().post(URL, data: data);
    print(response.data.toString());
    return ListSerial.fromJson(response.data);
  } on DioError catch (e) {
    if (e.response != null) {
      print(e.response?.data);
    } else {
      print(e.message);
    }
    return ListSerial.fromJson(e.response?.data);
  }
}

Future<ListSerial> uploadIMGCharacter(dynamic data) async {
  try {
    String fileName = data.path.split('/').last;
    var formData = FormData.fromMap(
        {'file': await MultipartFile.fromFile(data.path, filename: fileName)});
    var URL = API().uploadIMGCharacter;
    print("URL::" + URL);
    final Response response = await fetch().post(URL, data: data);
    print(response.data.toString());
    return ListSerial.fromJson(response.data);
  } on DioError catch (e) {
    if (e.response != null) {
      print(e.response?.requestOptions);
    } else {
      print(e.message);
    }
    return ListSerial.fromJson(e.response?.data);
  }
}
