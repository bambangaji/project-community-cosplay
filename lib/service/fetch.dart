// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:coscos/service/storage.dart';
import 'package:dio/dio.dart';

Dio fetch() {
  var dio = Dio();
  String? userToken;

  dio.interceptors.add(QueuedInterceptorsWrapper(
    onRequest: (options, handler) {
      // print('send request：path:${options.path}，baseURL:${options.baseUrl}');
      if (userToken == null) {
        // print('no token，request token firstly...');
        SecureStorage().readSecureData("userToken").then((token) {
          if (token != null) {
            options.headers['Authorization'] = userToken = "Bearer " + token;
            // options.headers['Cookie'] = 'lang=id-ID; ut=${userToken}';
          }
          handler.next(options);
        }).catchError((error, stackTrace) {
          handler.reject(error, true);
        });
      } else {
        options.headers['Authorization'] = userToken = "Bearer ${userToken!}";
        // options.headers['Cookie'] = 'lang=id-ID; ut=${userToken}';
        return handler.next(options);
      }
    },
    onError: (err, handler) {
      return handler.reject(err);
    },
    onResponse: (response, handler) {
      return handler.next(response);
    },
  ));

  return dio;
}
