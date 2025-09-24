import 'dart:convert';

import 'package:dio/dio.dart';

Dio getDio() {
  Dio dio = Dio();
  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (RequestOptions options, handler) {
        print('Api Uri: ${options.uri}');
        print('Headers: ${options.headers}');
        try{
          print('Request body: ${jsonEncode(options.data)}');
        }catch(e){
          print('error: ${e.toString()}');
        }

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
