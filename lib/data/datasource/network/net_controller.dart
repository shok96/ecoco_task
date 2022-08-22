/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 22.08.2022, 22:08
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 22.08.2022, 12:41
 *
 */

import 'net.dart';
import 'package:dio/dio.dart' hide Headers;

import 'responseModel/MTaskResult.dart';

class NetController{

  Api _api;

  Api get api => _api;

  final _dio = Dio();

  NetController(this._api){
    _initRetrofit();
  }


  void _initRetrofit(){

    _dio.options.connectTimeout = 5000;
    _dio.options.receiveTimeout = 5000;
    _dio.options.headers["Content-Type"] = 'application/json';   // config your dio headers globally
    _api = Api(_dio);


  }

  Api AuthRetrofit(String url){

    return Api(_dio, baseUrl: url);
  }



  Future<MTaskResult<T>> asyncResult<T>(
      Future<dynamic> Function() methodAction) async {
    try {

      final res = await methodAction();
      return MTaskResult.createBlankNetwork(res, true);

    } catch (e) {
      print("server_api_error - $e");
      switch (e.runtimeType) {
        case DioError:
          final res = (e as DioError).response;
          print("Got error : ${res?.statusCode} -> ${res?.statusMessage} -> ${res?.data}");
          return MTaskResult.createFailureNetwork(error: res?.data.toString() ?? "");
        default:
      }
    }
    return MTaskResult.createFailureNetwork(error: "Empty object");
  }


}