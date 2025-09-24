import 'package:dio/dio.dart';
import 'package:dio_crud/network_manager/injection_container.dart';

class DioHelper{
  ///at first it will call getDio() and print all the necessary fields.
  Dio dio = getDio();

  Options options = Options(
    receiveDataWhenStatusError: true,
    contentType: "application/json",
    sendTimeout: Duration(seconds: 10),
    receiveTimeout: Duration(seconds: 30)
  );

   Map<String,dynamic> headers = {"isAuthRequired":'Bearer token'};


   ///Get Api
  Future<dynamic> get({required String url,bool isAuthRequired = false})async{

    if(isAuthRequired){
      options.headers = headers;
    }

    try{
      Response response = await dio.get(url,options: options);
      return response.data;
    }catch(e){
      return null;
    }



  }

  ///Post Api
  Future<dynamic> post({required String url, Object? requestBody, bool isAuthRequired = false}) async{
      if(isAuthRequired){
        options.headers = headers;
      }

      try{
        Response response;
        if(requestBody == null){
          response = await dio.post(url,options: options);
        }else{
          response = await dio.post(url, data: requestBody, options: options);
        }

        return response.data;
      }catch(e){
        return null;
      }


  }

  ///Put Api
  Future<dynamic> put({required String url,Object? requestBody, bool isAuthRequired = false})async{
    if(isAuthRequired){
      options.headers = headers;
    }

    try{
      Response response;

      if(requestBody == null){
        response = await dio.put(url,options: options);
      }else{
        response = await dio.put(url,data: requestBody,options: options);
      }

      return response.data;

    }catch(e){
      return null;
    }


  }
  
  ///Patch Api
  Future<dynamic> patch({required String url, Object? requestBody, bool isAuthRequired = false}) async{
    if(isAuthRequired){
      options.headers = headers;
    }
    
    try{
      Response response;

      if(requestBody == null){
        response = await dio.patch(url,options: options);
      }else{
        response = await dio.patch(url,data: requestBody,options: options);
      }

      return response.data;
    }catch(e){
      return null;
    }
    
  }

  ///Delete Api
  Future<dynamic> delete({required String url, Object? requestBody, bool isAuthRequired = false})async{
    if(isAuthRequired){
      options.headers = headers;
    }

    try{
      Response response;
      if(requestBody == null){
        response = await dio.delete(url,options: options);
      }else{
        response = await dio.delete(url,data: requestBody,options: options);
      }

      return response.data;
    }catch(e){
      return null;
    }

  }

  //file upload api
  Future<dynamic> uploadApi({required String url, required Object requestBody, bool isAuthRequired = false}) async{
    if(isAuthRequired){
      options.headers = headers;
    }

    //we must add header as "headers: {"Content-Type":"multipart/form-data"}" because multipart required it.
    Options multipartOptions = Options(
      headers: {"Content-Type":"multipart/form-data"}
    );

    try{
      Response response;

        response = await dio.post(url, data: requestBody, options: multipartOptions);

      return response.data;
    }catch(e){
      return null;
    }


  }


}