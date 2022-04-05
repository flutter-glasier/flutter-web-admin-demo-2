import 'dart:io';
import 'package:dio/adapter.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter_web_dashboard/network/NetworkService.dart';

import '../constants/api_constants.dart';
import '../constants/constants.dart';
import '../helpers/app.export.dart';
import '../utils/pref_utils.dart';

class ServiceModule {
  NetworkService networkService({String? playerId, bool? isKnowlarity}) {
    final dio = Dio(); // Provide a dio instance
    dio.options.validateStatus = (status) {
      return status! < 500;
    };
    dio.options.followRedirects = false;
    dio.options.connectTimeout = 50000; //5s
    dio.options.receiveTimeout = 50000;
    dio.options.headers['Accept'] = 'application/json';
    dio.options.headers["Content-Type"] = "application/json";
    dio.options.headers["devicetime"] =
        DateTime.now().toUtc().toIso8601String();
    if (Platform.isIOS) {
      dio.options.headers["deviceType"] = DEVICE_TYPE_IOS;
    } else if (Platform.isAndroid) {
      dio.options.headers["deviceType"] = DEVICE_TYPE_ANDROID;
    }

    dio.options.headers["Authorization"] =
        "Bearer " + app.resolve<PrefUtils>().getUserToken();

    if (kDebugMode && ApiConstants.apiLog) {
      // DioInstance().checkForCharlesProxy(dio);
      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (client) {
        // config the http client
        client.findProxy = (uri) {
          return ApiConstants.PROXY_URL;
        };

        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => Platform.isAndroid;

        // client.badCertificateCallback =
        //     (X509Certificate cert, String host, int port) {
        //   return isProxyChecked && Platform.isAndroid;
        // };
        // client.findProxy = (url) {
        //   return isProxyChecked ? 'PROXY ${ApiConstants.PROXY_URL}' : 'DIRECT';
        // };
        // // // you can also create a new HttpClient to dio
        // return new HttpClient();
      };
    }

    //     if (kDebugMode) {
    //    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
    //        (client) {
    //      // config the http client
    //      client.findProxy = (uri) {
    //        return ApiConstants.PROXY_URL;
    //      };
    // you can also create a new HttpClient to dio
    // return new HttpClient();
    //    };
    //  }
    return NetworkService(dio);
  }
}
