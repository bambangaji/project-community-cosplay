// ignore_for_file: file_names, non_constant_identifier_names, duplicate_ignore

import 'dart:convert';
import 'dart:io';

import 'package:coscos/api/Error.dart';
import 'package:coscos/page/dashboard/model/eventDetailModel.dart';
import 'package:coscos/page/dashboard/model/topEventModel.dart';
import 'package:coscos/page/event/model/CharacterModel.dart';
import 'package:coscos/page/event/model/SerialModel.dart';
import 'package:coscos/page/event/model/UploadImage.dart';
import 'package:coscos/page/login/model/authModel.dart';
import 'package:coscos/service/fetch.dart';
import 'package:dio/dio.dart';

import 'API.dart';

Future<ListSerial> getListSerial(dynamic data) async {
  // ignore: duplicate_ignore
  try {
    // ignore: non_constant_identifier_names
    var URL = API.getSerial;
    final Response response = await fetch().post(URL, data: data);
    return ListSerial.fromJson(response.data);
  } on DioError catch (e) {
    var error = validationError(e);
    return ListSerial.dataError(error.errorCode, error.message);
  }
}

Future<ListCharacter> getListCharacter(dynamic data) async {
  try {
    // ignore: non_constant_identifier_names
    var URL = API.getCharacter;
    final Response response = await fetch().post(URL, data: data);
    return ListCharacter.fromJson(response.data);
  } on DioError catch (e) {
    var error = validationError(e);
    return ListCharacter.dataError(error.errorCode, error.message);
  }
}

Future<SerialData> addSerial(dynamic data) async {
  try {
    // ignore: non_constant_identifier_names
    var URL = API.addSerial;
    final Response response = await fetch().post(URL, data: data);
    return SerialData.fromJson(response.data);
  } on DioError catch (e) {
    var error = validationError(e);
    return SerialData.dataError(error.errorCode, error.message);
  }
}

Future<CharacterData> addCharacter(dynamic data) async {
  try {
    // ignore: non_constant_identifier_names
    var URL = API.addCharacter;
    final Response response = await fetch().post(URL, data: data);
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
    // ignore: non_constant_identifier_names
    var URL = API.uploadIMGSerial;
    final Response response = await fetch().post(URL, data: formData);
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
    // ignore: non_constant_identifier_names
    var URL = API.uploadIMGCharacter;
    final Response response = await fetch().post(URL, data: formData);
    return UploadImage.fromJson(response.data);
  } on DioError catch (e) {
    var error = validationError(e);
    return UploadImage.dataError(error.errorCode, error.message);
  }
}

Future<Register> registerAccount(dynamic data) async {
  try {
    var URL = API.register;
    final Response response = await fetch().post(URL, data: data);
    return Register.fromJson(response.data);
  } on DioError catch (e) {
    var error = validationError(e);
    return Register.dataError(error.errorCode, error.message);
  }
}

Future<Login> applyOTP(dynamic data) async {
  try {
    var URL = API.applyOTP;
    final Response response = await fetch().post(URL, data: data);
    return Login.fromJson(response.data);
  } on DioError catch (e) {
    var error = validationError(e);
    return Login.dataError(error.errorCode, error.message);
  }
}

Future<Login> loginMethode(dynamic data) async {
  try {
    var URL = API.login;
    final Response response = await fetch().post(URL, data: data);
    return Login.fromJson(response.data);
  } on DioError catch (e) {
    var error = validationError(e);
    return Login.dataError(error.errorCode, error.message);
  }
}

Future<TopEvent> getTopEvent(dynamic data) async {
  try {
    var URL = API.getTopEvent;
    final Response response = await fetch().post(URL, data: data);
    return TopEvent.fromJson(response.data);
  } on DioError catch (e) {
    var error = validationError(e);
    return TopEvent.dataError(error.errorCode, error.message);
  }
}

Future<EventDetail> getDetailEvent(dynamic data) async {
  try {
    var URL = API.getDetailEvent;
    final Response response = await fetch().post(URL, data: data);
    print(jsonEncode(response.data['data']));
    return EventDetail.fromJson(response.data);
  } on DioError catch (e) {
    var error = validationError(e);
    return EventDetail.dataError(error.errorCode, error.message);
  }
}
