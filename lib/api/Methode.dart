import 'dart:io';

import 'package:coscos/api/Error.dart';
import 'package:coscos/page/event/model/CharacterModel.dart';
import 'package:coscos/page/event/model/SerialModel.dart';
import 'package:coscos/page/event/model/UploadImage.dart';
import 'package:coscos/page/login/model/authModel.dart';
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
    var error = validationError(e);
    return ListSerial.dataError(error.errorCode, error.message);
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
    var error = validationError(e);
    return ListCharacter.dataError(error.errorCode, error.message);
  }
}

Future<SerialData> addSerial(dynamic data) async {
  try {
    var URL = API().addSerial;
    print("URL::" + URL);
    final Response response = await fetch().post(URL, data: data);
    print(response.data.toString());
    return SerialData.fromJson(response.data);
  } on DioError catch (e) {
    var error = validationError(e);
    return SerialData.dataError(error.errorCode, error.message);
  }
}

Future<CharacterData> addCharacter(dynamic data) async {
  try {
    var URL = API().addCharacter;
    print("URL::" + URL);
    final Response response = await fetch().post(URL, data: data);
    print(response.data.toString());
    return CharacterData.fromJson(response.data);
  } on DioError catch (e) {
    var error = validationError(e);
    return CharacterData.dataError(error.errorCode, error.message);
  }
}

Future<UploadImage> uploadIMGSerial(File data) async {
  try {
    String fileName = data.path.split('/').last;
    var formData = FormData.fromMap(
        {'file': await MultipartFile.fromFile(data.path, filename: fileName)});
    var URL = API().uploadIMGSerial;
    print("URL::" + URL);
    final Response response = await fetch().post(URL, data: formData);
    print("data::" + response.data.toString());
    return UploadImage.fromJson(response.data);
  } on DioError catch (e) {
    var error = validationError(e);
    return UploadImage.dataError(error.errorCode, error.message);
  }
}

Future<UploadImage> uploadIMGCharacter(dynamic data) async {
  try {
    String fileName = data.path.split('/').last;
    var formData = FormData.fromMap(
        {'file': await MultipartFile.fromFile(data.path, filename: fileName)});
    var URL = API().uploadIMGCharacter;
    print("URL::" + URL);
    final Response response = await fetch().post(URL, data: formData);
    print(response.data.toString());
    return UploadImage.fromJson(response.data);
  } on DioError catch (e) {
    var error = validationError(e);
    return UploadImage.dataError(error.errorCode, error.message);
  }
}

Future<Register> registerAccount(dynamic data) async {
  try {
    var URL = API().register;
    print("URL::" + URL);
    final Response response = await fetch().post(URL, data: data);
    return Register.fromJson(response.data);
  } on DioError catch (e) {
    var error = validationError(e);
    return Register.dataError(error.errorCode, error.message);
  }
}
