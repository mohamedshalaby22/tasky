// ignore_for_file: avoid_single_cascade_in_expression_statements

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:tasky/core/networking/dio_interceptor.dart';
import '../helpers/token_storage.dart';

class DioFactory {
  DioFactory._();
  static Dio? dio;
  static Dio getDio() {
    Duration timeOut = const Duration(seconds: 30);
    if (dio == null) {
      dio = Dio();
      dio!..options.connectTimeout = timeOut;
      dio!..options.receiveTimeout = timeOut;
      addDioInterceptor();
      addDioHeaders();
      return dio!;
    } else {
      return dio!;
    }
  }

  static void addDioInterceptor() {
    dio!.interceptors.addAll([
      DioInterceptor(dio!),
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
      ),
    ]);
  }

  static void addDioHeaders() async {
    String? accessToken = await TokenStorage.getAccessToken();
    dio?.options.headers = {
      'Authorization': 'Bearer $accessToken',
    };
  }
}
