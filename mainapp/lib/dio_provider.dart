import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

//dioを使った通信を行う方法のファイル
final Provider<Dio> dioProvider = Provider((ref) {
  final Dio dio = Dio(BaseOptions(baseUrl: "http://localhost:8000/"));
  dio.interceptors
    ..add(PrettyDioLogger())
    ..add(
      InterceptorsWrapper(
        onRequest: (options, requestInterceptorHandler) =>
            requestInterceptorHandler.next(options),
        onResponse: (options, responseInterceptorHandler) =>
            responseInterceptorHandler.next(options),
        onError: (options, errorInterceptorHandler) =>
            errorInterceptorHandler.next(options),
      ),
    );
  return dio;
});
