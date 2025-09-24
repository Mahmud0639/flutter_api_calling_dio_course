import 'dart:convert';

import 'package:dio/dio.dart';

Dio getDio() {
  Dio dio = Dio();
  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (RequestOptions options, handler) {
        print('Api Uri: ${options.uri}');
        print('Headers: ${options.headers}');
        print('Request body: ${jsonEncode(options.data)}');
        return handler.next(options);
      },

      onResponse: (Response response, ResponseInterceptorHandler handler) {
        print('Api Response ${response.data}');
        return handler.next(response);
      },

      onError: (DioException e, handler){
        print('Status code: ${e.response!.statusCode??""}');
        print('Error data: ${e.response!.data??""}');
        return handler.next(e);
      }

    ),
  );

  return dio;
}
